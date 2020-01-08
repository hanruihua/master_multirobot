import rosbag
import matplotlib.pyplot as plt
import numpy as np
from scipy import interpolate 
import data_smooth
import time

bag = rosbag.Bag("/home/han/catkin_ws/src/master_multirobot/record/2020-01-08-17-45-20.bag")

agent1_uwb = bag.read_messages(topics='/agent1/nlink_linktrack_nodeframe2')
    
agent_dis = [[] for i in range(4)]

for topic, msg, t in agent1_uwb:
    
    if (topic == "/agent1/nlink_linktrack_nodeframe2"):
        # time.sleep(0.05)

        for j in range(len(msg.nodes)): 
           distance = msg.nodes[j].distance
           agent_dis[j].append(distance)

for distance in agent_dis:

    x_arrange = np.arange(len(distance))
    distance = np.array(distance)

    distance_smooth = data_smooth.smooth(distance, 50, 'flat')
    x_arrange_smooth = np.arange(len(distance_smooth))

    plt.plot(x_arrange, distance, x_arrange_smooth, distance_smooth)

plt.show()


bag.close()


