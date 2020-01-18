import sys
sys.path.append('../')

import numpy as np
import matplotlib.pyplot as plt
from analysis_lib.bag_analysis import bag_analysis

def trajectory(topic_list, mode_list):
    fig, ax = plt.subplots()

    bag_sta5 = bag_analysis('bag_ign/record_20201_15/sta_h1.bag')
    sta_dyna1 = bag_analysis('bag_ign/record_20201_15/sta_h1.bag')

    bag_ref = bag_sta5

    for i in range(len(topic_list)):
        bag_ref.read_location(topic_list[i], mode_list[i])
    
    bag_ref.update_trans_odom()
    bag_ref.transform()
    bag_ref.location_plot(ax)

    plt.show()

if __name__ == '__main__':

    agent_name_list = ['agent1', 'agent2', 'agent3', 'agent4', 'agent5']
    agent_name = '/agent3'
    topic_list = [agent_name + '/nlink_linktrack_nodeframe2', agent_name+'/ground_pose', agent_name+'/odom']
    mode_list = ['uwb', 'optitrack', 'odom']

    trajectory(topic_list, mode_list)









