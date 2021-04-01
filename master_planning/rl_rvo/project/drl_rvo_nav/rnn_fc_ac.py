import torch
import torch.nn as nn
import scipy
import scipy.signal
import numpy as np
from gym.spaces import Box, Discrete
from torch.distributions.categorical import Categorical
from torch.distributions.normal import Normal
from torch.nn.utils.rnn import pad_sequence, pack_padded_sequence


def mlp(sizes, activation, output_activation=nn.Identity):
    layers = []

    for j in range(len(sizes)-1):
        act = activation if j < len(sizes)-2 else output_activation
        layers += [nn.Linear(sizes[j], sizes[j+1]), act()]

    return nn.Sequential(*layers)

def mlp2(sizes, activation=nn.ReLU, output_activation=nn.Tanh):
    layers = []
    for j in range(len(sizes)-1):
        act = activation if j < len(sizes)-2 else output_activation
        layers += [nn.Linear(sizes[j], sizes[j+1]), act()]

    return nn.Sequential(*layers)

def mlp3(sizes, activation=nn.ReLU, output_activation=nn.Tanh, drop_p = 0):

    layers = []
    for j in range(len(sizes)-1):
        if j < len(sizes)-2:
            act = activation
            layers += [nn.Linear(sizes[j], sizes[j+1]), nn.Dropout(p=drop_p), act()]
        else:
            layers += [nn.Linear(sizes[j], sizes[j+1]), nn.Tanh()] 

    return nn.Sequential(*layers)

class rnn_Reader():

    def __init__(self, state_dim, input_dim, hidden_dim, use_gpu=False, mode='GRU'):

        self.state_dim = state_dim
        self.mode = mode


        if mode == 'GRU':
            self.rnn_net = nn.GRU(input_dim, hidden_dim, batch_first=True, dropout=0, num_layers=1)
        elif mode == 'LSTM':
            self.rnn_net = nn.LSTM(input_dim, hidden_dim, batch_first=True, dropout=0, num_layers=1)
        
        self.use_gpu=use_gpu

        self.input_dim = input_dim
        self.hidden_dim = hidden_dim

        # self.h0 = torch.randn(1, 1, self.hidden_dim)
        # self.c0 = torch.randn(1, 1, self.hidden_dim)

        # self.h0_list = torch.randn(1, 500, self.hidden_dim)
        # self.c0_list = torch.randn(1, 500, self.hidden_dim)

        if use_gpu:
            self.rnn_net = self.rnn_net.cuda()
            # self.h0 = self.h0.cuda()
            # self.c0 = self.c0.cuda()

            # self.h0_list = self.h0_list.cuda()
            # self.c0_list = self.c0_list.cuda()

    def obs_fc(self, obs):

        obs = torch.as_tensor(obs, dtype=torch.float32)  

        if self.use_gpu:
            obs=obs.cuda() 

        moving_state = obs[self.state_dim:]
        robot_state = obs[:self.state_dim]
        mov_len = int(moving_state.size()[0] / self.input_dim)
        rnn_input = torch.reshape(moving_state, (1, mov_len, self.input_dim))

        rnn_input_flip = torch.flip(rnn_input, [1])
        # output, (hn, cn) = self.lstm_net(lstm_input_flip)

        if self.mode == 'GRU':
            # h0 = torch.randn(1, 1, self.hidden_dim)
            # if self.use_gpu:
            #     h0=h0.cuda()  

            output, hn = self.rnn_net(rnn_input_flip)
        elif self.mode == 'LSTM':
            # h0 = torch.randn(1, 1, self.hidden_dim)
            # c0 = torch.randn(1, 1, self.hidden_dim)
            # if self.use_gpu:
            #     h0=h0.cuda() 
            #     c0=c0.cuda() 
            # output, (hn, cn) = self.rnn_net(rnn_input_flip, (self.h0, self.c0))
            output, (hn, cn) = self.rnn_net(rnn_input_flip)
    
        hnv = torch.squeeze(hn)
        fc_obs = torch.cat((robot_state, hnv))

        return fc_obs

    def obs_fc_list(self, obs_tensor_list):

        mov_len = [(len(obs_tensor)-self.state_dim)/self.input_dim for obs_tensor in obs_tensor_list]
        obs_pad = pad_sequence(obs_tensor_list, batch_first = True)
        robot_state_batch = obs_pad[:, :self.state_dim] 
        batch_size = len(obs_tensor_list)

        if self.use_gpu:
            robot_state_batch=robot_state_batch.cuda()

        mov_state_batch = obs_pad[:, self.state_dim:] 
        
        def obs_tensor_reform(obs_tensor):
            mov_tensor = obs_tensor[self.state_dim:]
            mov_tensor_len = int(len(mov_tensor)/self.input_dim)
            re_mov_tensor = torch.reshape(mov_tensor, (mov_tensor_len, self.input_dim)) 
            mov_tensor_flip = torch.flip(re_mov_tensor, [0])
            return mov_tensor_flip
        
        re_mov_list = list(map(lambda o: obs_tensor_reform(o), obs_tensor_list))
        re_mov_pad = pad_sequence(re_mov_list, batch_first = True)

        if self.use_gpu:
            re_mov_pad=re_mov_pad.cuda()

        moving_state_pack = pack_padded_sequence(re_mov_pad, mov_len, batch_first=True, enforce_sorted=False)

        if self.mode == 'GRU':
        #     h0 = torch.randn(1, batch_size, self.hidden_dim)
            # if self.use_gpu:
            #     h0=h0.cuda() 
            output, hn= self.rnn_net(moving_state_pack)
        elif self.mode == 'LSTM':
            # h0 = torch.randn(1, batch_size, self.hidden_dim)
            # c0 = torch.randn(1, batch_size, self.hidden_dim)

            # if self.use_gpu:
            #     h0=h0.cuda() 
            #     c0=c0.cuda()

            # output, (hn, cn) = self.rnn_net(moving_state_pack, (self.h0_list, self.c0_list))
            output, (hn, cn) = self.rnn_net(moving_state_pack)
        
        # output, (hn, cn) = self.lstm_net(moving_state_pack)
        # output, hn = self.gru_net(moving_state_pack)

        # hn_temp=hn[-1]
        hnv = torch.squeeze(hn)
        fc_obs_batch = torch.cat((robot_state_batch, hnv), 1)

        return fc_obs_batch



class Actor(nn.Module):

    def _distribution(self, obs):
        raise NotImplementedError

    def _log_prob_from_distribution(self, pi, act):
        raise NotImplementedError

    def forward(self, obs, act=None):
        # Produce action distributions for given observations, and 
        # optionally compute the log likelihood of given actions under
        # those distributions.
        pi = self._distribution(obs)
        logp_a = None

        if act is not None:   
            logp_a = self._log_prob_from_distribution(pi, act)

        return pi, logp_a

class GaussianActor(Actor):

    def __init__(self, obs_dim, act_dim, hidden_sizes, activation, output_activation, rnn_reader=None, drop_p=0, use_gpu=False):
        super().__init__()

        self.use_gpu = use_gpu

        log_std = -np.ones(act_dim, dtype=np.float32)

        if use_gpu:
            self.log_std = torch.nn.Parameter(torch.as_tensor(log_std, device=torch.device('cuda')))
        else:
            self.log_std = torch.nn.Parameter(torch.as_tensor(log_std))

        self.net_out=mlp([obs_dim] + list(hidden_sizes) + [act_dim], activation, output_activation)
        # self.std_out=mlp([obs_dim] + list(hidden_sizes) + [act_dim], activation, nn.Sigmoid)
        
        if use_gpu:
            self.net_out=self.net_out.cuda()
            # self.std_out = self.std_out.cuda()

        self.rnn_reader = rnn_reader

    # def std_init(self):
    #     self.std_out=mlp([self.obs_dim] + list(self.hidden_sizes) + [self.act_dim], nn.ReLU, nn.Sigmoid)

    def _distribution(self, obs, std_factor=1):

        if isinstance(obs, list):
            obs = self.rnn_reader.obs_fc_list(obs) 
            net_out = self.net_out(obs)
            # std_out = self.std_out(obs)
            # mu = net_out[:, 0:2]
            # log_std= net_out[:, 2:4]
        else:
            obs = self.rnn_reader.obs_fc(obs)
            net_out = self.net_out(obs)
            # std_out = self.std_out(obs)
            # mu = net_out[0:2]
            # log_std= net_out[2:4]

        mu = net_out  
        # std = std_out

        std = torch.exp(self.log_std)
        std = std_factor * std
        # std = torch.clamp(std, 0, 0.3)

        return Normal(mu, std)

    def _log_prob_from_distribution(self, pi, act):

        if self.use_gpu:
            act = act.cuda()

        return pi.log_prob(act).sum(axis=-1)    # Last axis sum needed for Torch Normal distribution


class Critic(nn.Module):

    def __init__(self, obs_dim, hidden_sizes, activation, output_activation, rnn_reader=None, use_gpu=False):
        super().__init__()
        self.v_net = mlp([obs_dim] + list(hidden_sizes) + [1], activation, output_activation)

        if use_gpu:
            self.v_net = self.v_net.cuda()

        self.rnn_reader = rnn_reader

    def forward(self, obs):

        if self.rnn_reader != None:
            if isinstance(obs, list):
                obs = self.rnn_reader.obs_fc_list(obs)
            else:
                obs = self.rnn_reader.obs_fc(obs)

        v = torch.squeeze(self.v_net(obs), -1)

        return v # Critical to ensure v has right shape.

class rnn_fc_ac(nn.Module):

    def __init__(self, observation_space, action_space, state_dim=5, rnn_input_dim=6, 
    rnn_hidden_dim=64, hidden_sizes_ac=(256, 256), hidden_sizes_v=(16, 16), 
    activation=nn.ReLU, output_activation=nn.Tanh, output_activation_v= nn.Identity, drop_p=0, std_factor=1, use_gpu=False, rnn_mode='GRU'):
        super().__init__()

        self.std_factor = std_factor
        self.use_gpu = use_gpu
        torch.cuda.synchronize()

        obs_dim = rnn_hidden_dim + state_dim
        rnn = rnn_Reader(state_dim, rnn_input_dim, rnn_hidden_dim, use_gpu=use_gpu, mode=rnn_mode)

        # policy builder depends on action space
        if isinstance(action_space, Box):
            self.pi = GaussianActor(obs_dim, action_space.shape[0], hidden_sizes_ac, activation, output_activation, rnn_reader=rnn, use_gpu=use_gpu)

        # build value function
        self.v = Critic(obs_dim, hidden_sizes_v, activation, output_activation_v, rnn_reader=rnn, use_gpu=use_gpu)

    def step(self, obs):
        with torch.no_grad():
            pi_dis = self.pi._distribution(obs, self.std_factor)
            a = pi_dis.sample()
            logp_a = self.pi._log_prob_from_distribution(pi_dis, a)
            v = self.v(obs)

            if self.use_gpu:
                a = a.cpu()
                logp_a = logp_a.cpu()
                v = v.cpu()

        return a.numpy(), v.numpy(), logp_a.numpy()

    def act(self, obs, std_factor=1):

        self.std_factor = std_factor
        return self.step(obs)[0]