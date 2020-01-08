import rosbag
import matplotlib.pyplot as plt
import numpy as np
from scipy import interpolate 
import data_smooth

bag = rosbag.Bag("/home/han/catkin_ws/src/master_multirobot/master_analysis/bag/10_robot_2257.bag")

agent1_ground = bag.read_messages(topics=['/agent1/ground_pose', '/agent1/nlink_linktrack_nodeframe2', '/agent1/odom'])

n = 0

agent1_ground_x = []
agent1_ground_y = []

agent1_uwb_x = []
agent1_uwb_y = []

agent1_odom_x = []
agent1_odom_y = []

world_time = []

for topic, msg, t in agent1_ground:

    if (topic == "/agent1/ground_pose"):
        agent1_ground_x.append(msg.x)
        agent1_ground_y.append(msg.y)

    if (topic == '/agent1/nlink_linktrack_nodeframe2'):
        agent1_uwb_x.append(msg.position.x)
        agent1_uwb_y.append(msg.position.y)

        # world_time.append(t)

    if (topic == '/agent1/odom'):
        agent1_odom_x.append(msg.pose.pose.position.x)
        agent1_odom_y.append(msg.pose.pose.position.y)
        

agent1_uwb_x = np.array(agent1_uwb_x)
agent1_uwb_y = np.array(agent1_uwb_y)

agent1_odom_x = np.array(agent1_odom_x)
agent1_odom_y = np.array(agent1_odom_y)

diff_x = agent1_uwb_x[0] - agent1_odom_x[0]
diff_y = agent1_uwb_y[0] - agent1_odom_y[0]

agent1_odom_x_new = agent1_odom_x + diff_x
agent1_odom_y_new = agent1_odom_y + diff_y

# world_time = np.array(world_time)
# # agent1_uwb_y = np.sin(agent1_uwb_x)

# tck = interpolate.splrep([agent1_uwb_x, agent1_uwb_y], s=0)

# agent1_uwb_x_new = agent1_uwb_x
# agent1_uwb_y_new = interpolate.splev(agent1_uwb_x_new, der=0)



plt.plot(agent1_uwb_x, agent1_uwb_y, agent1_odom_x_new, agent1_odom_y_new, agent1_ground_x, agent1_ground_y)
plt.legend()
plt.show()


bag.close()


