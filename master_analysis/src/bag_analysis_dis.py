import sys
sys.path.append('../')
sys.path.append('master_analysis')

import numpy as np
import matplotlib.pyplot as plt
from analysis_lib.bag_analysis_class import bag_analysis
from analysis_lib.data_smooth import smooth_data
from numpy.fft import fft

Fs = 2000
f1 = 50   # signal frequency
f2 = 100  # human frequency

offset = 1

def main():
    fig, ax = plt.subplots(2, 2)
    smooth_len = 30

    bag_static = bag_analysis('/home/han/catkin_ws/src/master_multirobot/master_analysis/bag_ign/static2020-01-08-17-45-20.bag')
    bag_dyna = bag_analysis('/home/han/catkin_ws/src/master_multirobot/master_analysis/bag_ign/dyna_2020-01-08-17-47-22.bag')
    bag_10agent = bag_analysis('/home/han/catkin_ws/src/master_multirobot/master_analysis/bag_ign/10_robot_2257.bag')

    bag_ref = bag_dyna

    agent1_dis = bag_ref.read_anchor_dis('/agent1/nlink_linktrack_nodeframe2')

    agent1_x, agent1_y = bag_ref.read_location('/agent1/nlink_linktrack_nodeframe2')

    dis_diff = np.diff(agent1_dis[3])
    # print(dis_diff, 3)
    # print('next')
    # print(agent1_dis[3][600:700])
    # print('next')
    # print(agent1_x[600:750])

    agent1_dis_smooth = []
    smooth_data_diff = []

    for agent1_dis_anchor in agent1_dis:
        agent1_smooth = smooth_data(agent1_dis_anchor)
        smooth_data_temp = agent1_smooth.convolution_window_1d(smooth_len)
        agent1_dis_smooth.append(smooth_data_temp)
        smooth_data_diff.append(np.diff(smooth_data_temp, offset))

    bag_ref.update_smooth_data(agent1_dis_smooth)
    bag_ref.dis_plot(ax[0][0], '1', if_raw = True, if_smooth = True, window_len = smooth_len)
    bag_ref.location_plot(ax[0][1], '1', [0,10,0,10])
    bag_ref.plot_1d(ax[1][0], 'diff', smooth_data_diff, offset)

    plt.show()

if __name__ == '__main__':
    main()



