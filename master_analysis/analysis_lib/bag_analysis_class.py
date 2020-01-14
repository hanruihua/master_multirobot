import rosbag
import matplotlib.pyplot as plt
import numpy as np
from scipy import interpolate 
from tempfile import TemporaryFile

class bag_analysis:
    
    def __init__(self, path_file):

        self.bag = rosbag.Bag(path_file)        


    def read_anchor_dis(self, topic_name):

        self.bag_msg = self.bag.read_messages(topics = topic_name)

        self.agent_dis = [[] for i in range(4)]

        for topic, msg, t in self.bag_msg:
            if topic == topic_name and len(msg.nodes) == 4:
                for i in range(4): 
                    distance = msg.nodes[i].distance
                    self.agent_dis[i].append(distance)
        
        return self.agent_dis

    def read_location(self, topic_name):

        bag_msg = self.bag.read_messages(topics = topic_name)

        self.x_data = []
        self.y_data = []

        for topic, msg, t in bag_msg:

            if topic == topic_name:
                self.x_data.append(msg.position.x)
                self.y_data.append(msg.position.y)
            
        return self.x_data, self.y_data

    def update_smooth_data(self, agent_dis):
        self.agent_dis_smooth = agent_dis

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
        
        
    def location_plot(self, ax, name, limit):

        num = int(name)
        ax.set_xlim(limit[0], limit[1])
        ax.set_ylim(limit[2], limit[3])
        ax.plot(self.x_data, self.y_data, label = name+'{}'.format(num))

        ax.legend()

    def save_data(self):
        outfile = TemporaryFile()
        np.save(outfile, self.agent_dis)

    def close(self):
        self.bag.close()
    
    


