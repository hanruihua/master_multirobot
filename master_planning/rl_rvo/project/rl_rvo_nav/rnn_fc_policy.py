import torch
import torch.nn as nn
import scipy
import scipy.signal
import numpy as np
from gym.spaces import Box, Discrete
from torch.distributions.categorical import Categorical
from torch.distributions.normal import Normal
from torch.nn.utils.rnn import pad_sequence, pack_padded_sequence

# use_gpu=torch.cuda.is_available()
use_gpu=0

def mlp(sizes, activation, output_activation=nn.Identity):
    layers = []

    for j in range(len(sizes)-1):
        act = activation if j < len(sizes)-2 else output_activation
        layers += [nn.Linear(sizes[j], sizes[j+1]), act()]

    return nn.Sequential(*layers)

def mlp2(sizes, activation, output_activation=nn.Identity, drop_p = 0.1):
    layers = []
    for j in range(len(sizes)-1):
        act = activation if j < len(sizes)-2 else output_activation
        layers += [nn.Linear(sizes[j], sizes[j+1]), act()]

    return nn.Sequential(*layers)

def mlp3(sizes, activation, output_activation=nn.Identity):

    layers = []
    for j in range(len(sizes)-1):
        if j < len(sizes)-2:
            act = activation
            layers += [nn.Linear(sizes[j], sizes[j+1]), act()]
        else:
            layers += [nn.Linear(sizes[j], sizes[j+1]), nn.Tanh] 

    return nn.Sequential(*layers)


def discount_cumsum(x, discount):
    """
    magic from rllab for computing discounted cumulative sums of vectors.

    input: 
        vector x, 
        [x0, 
         x1, 
         x2]

    output:
        [x0 + discount * x1 + discount^2 * x2,  
         x1 + discount * x2,
         x2]
    """
    return scipy.signal.lfilter([1], [1, float(-discount)], x[::-1], axis=0)[::-1]

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
            if use_gpu:
                act = act.cuda()
            logp_a = self._log_prob_from_distribution(pi, act)

        if use_gpu:
            logp_a = logp_a.cpu()

        return pi, logp_a

class rnn_Reader():

    def __init__(self, state_dim, input_dim, hidden_dim):

        self.state_dim = state_dim
        # self.lstm_net = nn.LSTM(input_dim, hidden_dim, batch_first=True )
        # self.rnn_net= nn.GRU(rnn_input_dim, rnn_hidden_dim, batch_first=True)
        self.gru_net = nn.GRU(input_dim, hidden_dim, batch_first=True, dropout=0, num_layers=1)
        if use_gpu:
            self.gru_net=self.gru_net.cuda()

        self.input_dim = input_dim
        self.hidden_dim = hidden_dim

    def obs_fc(self, obs):

        obs = torch.as_tensor(obs, dtype=torch.float32)  

        if use_gpu:
            obs=obs.cuda() 

        moving_state = obs[self.state_dim:]

        robot_state = obs[:self.state_dim]
        mov_len = int(moving_state.size()[0] / self.input_dim)
        lstm_input = torch.reshape(moving_state, (1, mov_len, self.input_dim))

        lstm_input_flip = torch.flip(lstm_input, [1])

        # output, (hn, cn) = self.lstm_net(lstm_input_flip)

        output, hn= self.gru_net(lstm_input_flip)
        
        # hn_temp = hn[-1]

        hnv = torch.squeeze(hn)
        fc_obs = torch.cat((robot_state, hnv))

        return fc_obs

    def obs_fc_list(self, obs_tensor_list):

        # if use_gpu:
        #    obs_tensor_list= [obs.cuda() for obs in obs_tensor_list]

        mov_len = [(len(obs_tensor)-self.state_dim)/self.input_dim for obs_tensor in obs_tensor_list]
        obs_pad = pad_sequence(obs_tensor_list, batch_first = True)
        robot_state_batch = obs_pad[:, :self.state_dim] 
        mov_state_batch = obs_pad[:, self.state_dim:] 
        
        def obs_tensor_reform(obs_tensor):
            mov_tensor = obs_tensor[self.state_dim:]
            mov_tensor_len = int(len(mov_tensor)/self.input_dim)
            re_mov_tensor = torch.reshape(mov_tensor, (mov_tensor_len, self.input_dim)) 
            mov_tensor_flip = torch.flip(re_mov_tensor, [0])
            return mov_tensor_flip
        
        re_mov_list = list(map(lambda o: obs_tensor_reform(o), obs_tensor_list))
        re_mov_pad = pad_sequence(re_mov_list, batch_first = True)
        moving_state_pack = pack_padded_sequence(re_mov_pad, mov_len, batch_first=True, enforce_sorted=False)

        # output, (hn, cn) = self.lstm_net(moving_state_pack)
        output, hn = self.gru_net(moving_state_pack)

        # hn_temp=hn[-1]
        hnv = torch.squeeze(hn)
        fc_obs_batch = torch.cat((robot_state_batch, hnv), 1)

        return fc_obs_batch
   
class GaussianActor(Actor):

    def __init__(self, obs_dim, act_dim, hidden_sizes, activation, output_activation, rnn_reader=None, drop_p=0.1, factor=1):
        super().__init__()
        log_std = -factor*np.ones(act_dim, dtype=np.float32)
        self.log_std = torch.nn.Parameter(torch.as_tensor(log_std))
        self.net_out=mlp2([obs_dim] + list(hidden_sizes) + [act_dim+2], activation, output_activation)
        
        # self.mu_net = mlp2([obs_dim] + list(hidden_sizes) + [act_dim], activation, output_activation, drop_p=drop_p)
        # self.std_net = mlp2([obs_dim] + list(hidden_sizes) + [act_dim], activation=nn.Identity, output_activation=nn.Sigmoid)
        # self.factor = factor

        if use_gpu:
            self.mu_net=self.mu_net.cuda()
            # self.log_std=self.log_std.cuda()

        self.rnn_reader = rnn_reader

    # def std_decay(self):
    #     self.factor = self.factor - 0.1
    #     self.factor = np.clip(self.factor, 0.1, 1)

    def _distribution(self, obs, factor=1):

        if isinstance(obs, list):
            obs = self.rnn_reader.obs_fc_list(obs)
            net_out = self.net_out(obs)
            mu = net_out[:, 0:2]
            log_std= net_out[:, 2:4]
        else:
            obs = self.rnn_reader.obs_fc(obs)
            net_out = self.net_out(obs)
            mu = net_out[0:2]
            log_std= net_out[2:4]

        std = torch.exp(log_std)
        std=std*factor

        # print(std)
        # mu = 1.5 * mu
        # mu = self.mu_net(obs)
        # std =factor* torch.exp(self.log_std)

        # std = self.std_net(obs)
        # std = torch.clamp(std_net, 0.05, 1)
        
         
        # if use_gpu:
        #     std=std.cuda()

        return Normal(mu, std)

    def _log_prob_from_distribution(self, pi, act):
        return pi.log_prob(act).sum(axis=-1)    # Last axis sum needed for Torch Normal distribution

class Critic(nn.Module):

    def __init__(self, obs_dim, hidden_sizes, activation, output_activation, rnn_reader=None):
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

        if use_gpu:
            v=v.cpu()

        return v # Critical to ensure v has right shape.

class rnn_fc_ac(nn.Module):

    def __init__(self, observation_space, action_space, state_dim=5, rnn_input_dim=8, 
    rnn_hidden_dim=256, hidden_sizes_ac=(256, 256), hidden_sizes_v=(16, 16), 
    activation=nn.ReLU, output_activation=nn.Tanh, drop_p=0.1, factor=1):
        super().__init__()

        torch.cuda.synchronize()
        print('hidden_sizes_ac', hidden_sizes_ac)
        print('hidden_sizes_v', hidden_sizes_v)

        # obs_dim = observation_space.shape[0]
        obs_dim = rnn_hidden_dim + state_dim

        rnn = rnn_Reader(state_dim, rnn_input_dim, rnn_hidden_dim)

        # policy builder depends on action space
        if isinstance(action_space, Box):
            self.pi = GaussianActor(obs_dim, action_space.shape[0], hidden_sizes_ac, activation, output_activation,factor=factor, rnn_reader=rnn)
        # build value function
        self.v = Critic(obs_dim, hidden_sizes_v, activation, output_activation, rnn_reader=rnn)

    def std_decay(self):
        self.pi.std_decay()

    def step(self, obs, factor=1):
        with torch.no_grad():
            pi_dis = self.pi._distribution(obs, factor)
            a = pi_dis.sample()
            logp_a = self.pi._log_prob_from_distribution(pi_dis, a)
            v = self.v(obs)

            if use_gpu:
                a = a.cpu()
                logp_a = logp_a.cpu()
                v = v.cpu()

        return a.numpy(), v.numpy(), logp_a.numpy()

    def act(self, obs, factor=1):
        return self.step(obs, factor=factor)[0]