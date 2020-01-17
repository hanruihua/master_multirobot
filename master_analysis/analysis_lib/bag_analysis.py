import sys
sys.path.append('../')
import rosbag
import matplotlib.pyplot as plt
import numpy as np
from scipy import interpolate 
from tempfile import TemporaryFile
from analysis_lib.data_smooth import convolution_window_1d

class bag_analysis:
    
    def __init__(self, path_file):
        
        # uwb coordinate system
        self.bag = rosbag.Bag(path_file)        
        self.rotation_opti = [[-0.04425313, 0.99902035], [-0.99902035, -0.04425313]] 
        self.transition_opti = [[4.41968278], [4.13352817]]
        self.transition_odom = [[1], [1]]
        
        self.uwb_data = []
        self.opti_data = []
        self.odom_data = []

    def read_anchor_dis(self, topic_name):

        self.bag_msg = self.bag.read_messages(topics = topic_name)

        self.agent_dis = [[] for i in range(4)]

        for topic, msg, t in self.bag_msg:
            if topic == topic_name and len(msg.nodes) == 4:
                for i in range(4): 
                    distance = msg.nodes[i].distance
                    self.agent_dis[i].append(distance)
        
        return self.agent_dis

    def read_location(self, topic_name, mode = 'uwb'):

        bag_msg = self.bag.read_messages(topics = topic_name)
        for topic, msg, t in bag_msg:

            if topic == topic_name:
                
                if mode == 'uwb':
                    self.uwb_data.append([msg.position.x, msg.position.y])
                    
                if mode == 'optitrack':
                    self.opti_data.append([msg.x, msg.y])

                if mode == 'odom':
                    self.odom_data.append([msg.pose.pose.position.x, msg.pose.pose.position.y])
        
        if len(self.uwb_data) != 0:
            self.uwb_data = np.array(self.uwb_data)

        if len(self.opti_data) != 0:
            self.opti_data = np.array(self.opti_data)

        if len(self.odom_data) != 0:
            self.odom_data = np.array(self.odom_data)

        return self.uwb_data, self.opti_data, self.odom_data
        
    # def trans_data():

    def update_trans_opti(self, transition, rotation):
        self.rotation_opti = rotation
        self.transition_opti = transition

    def update_trans_odom(self, transition = []):
        
        if not transition:
            self.transition_odom = self.uwb_data[0, :] - self.odom_data[0, :]
        else:
            self.transition_odom = transition
    # def read_locations(self, topic_name):

    def transform(self):
        self.opti_data = np.transpose(np.dot(self.rotation_opti, np.transpose(self.opti_data))  + self.transition_opti)
        self.odom_data = self.odom_data + self.transition_odom

    def smooth_dis_data(self):
        self.agent_dis_smooth = convolution_window_1d(self.agent_dis)

    def dis_plot(self, ax, name, if_raw = True, if_smooth = True, window_len = 0):
        num1 = 0
        num2 = 0

        if if_raw == True:
            for distance in self.agent_dis:
                num1 = num1 + 1
                x_arrange = np.arange(len(distance))
                distance = np.array(distance)

                ax.plot(x_arrange, distance, label=name + '{}'.format(num1))

        if  if_smooth == True:
            for distance in self.agent_dis_smooth:
                num2 = num2 + 1
                x_arrange = np.arange(window_len/2, window_len/2 + len(distance))
                # x_arrange = np.arange(len(distance))
                distance = np.array(distance)

                ax.plot(x_arrange, distance, label=name + 's{}'.format(num2))
        
        ax.legend()

    def plot_1d(self, ax, name, list, offset):
        num = 0
    
        for diff in list:
            num = num + 1
            if (num < 2):
                x_arrange = np.arange(offset, offset + len(diff))
                array = np.array(diff)
                ax.plot(x_arrange, array, label=name+'d{}'.format(num))

        ax.legend()
         
    def location_plot(self, ax, limit=[0, 10, 0, 10]):

        # num = int(name)
        ax.set_xlim(limit[0], limit[1])
        ax.set_ylim(limit[2], limit[3])

        ax.plot(self.uwb_data[:, 0], self.uwb_data[:, 1], label = 'uwb')
        ax.plot(self.opti_data[:, 0], self.opti_data[:, 1], label = 'optitrack')
        ax.plot(self.odom_data[:, 0], self.odom_data[:, 1], label = 'odom')
        ax.legend()
        

    def save_data(self):
        outfile = TemporaryFile()
        np.save(outfile, self.agent_dis)

    def close(self):
        self.bag.close()
    
    


