# reference(transform): http://nghiaho.com/?page_id=671

import sys
sys.path.append('../')

import numpy as np
import matplotlib.pyplot as plt
from analysis_lib.bag_analysis import bag_analysis
import math
from analysis_lib.transformation2d import trans2d

def main():
    
    point_uwb = []
    point_opti = []

    fig, ax1 = plt.subplots()
    # ax1 = plt.subplot(221)

    bag_static1 = bag_analysis('bag_ign/record_20201_15/sta_nh1.bag')
    bag_static2 = bag_analysis('bag_ign/record_20201_15/sta_nh2.bag')
    bag_static3 = bag_analysis('bag_ign/record_20201_15/sta_nh3.bag')
    bag_static4 = bag_analysis('bag_ign/record_20201_15/sta_nh4.bag')
    
    bag_list = [bag_static1, bag_static2, bag_static3, bag_static4]

    topic_uwb_list = ['/agent1/nlink_linktrack_nodeframe2', '/agent2/nlink_linktrack_nodeframe2', '/agent3/nlink_linktrack_nodeframe2']
    topic_opti_list = ['/agent1/ground_pose', '/agent2/ground_pose', '/agent3/ground_pose']

    for bag in bag_list:

        for i in range(len(topic_uwb_list)):

            uwb_data, _, _ = bag.read_location(topic_uwb_list[i], mode='uwb')
            bag.location_plot(ax1, 'agent1_uwb')

            _, opti_data, _ = bag.read_location(topic_opti_list[i], mode='optitrack')
            bag.location_plot(ax1, 'agent1_opti', mode = 'optitrack')

            uwb_data_aver = np.average(uwb_data, axis = 0)
            opti_data_aver = np.average(opti_data, axis = 0)

            point_uwb.append(uwb_data_aver)
            point_opti.append(opti_data_aver)

    # print(point_opti)
    point_opti = np.transpose(np.array(point_opti))
    point_uwb = np.transpose(np.array(point_uwb))

    trans = trans2d(point_opti, point_uwb)

    T, R, theta = trans.transform_2d()

    point_opti_uwb = np.dot(R, point_opti) + T
    ax1.plot(point_opti_uwb[0, :], point_opti_uwb[1, :], 'ko')

    plt.show()






    












if __name__ == '__main__':
    main()