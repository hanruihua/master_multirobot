import rosbag
import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import splprep, splev
import data_smooth
import matplotlib.animation as animation

#bag = rosbag.Bag("/home/han/catkin_ws/src/master_multirobot/master_analysis/bag/10_robot_2257.bag")
bag_dyna = rosbag.Bag("/home/han/catkin_ws/src/master_multirobot/record/dyna_2020-01-08-17-47-22.bag")
bag_static = rosbag.Bag("/home/han/catkin_ws/src/master_multirobot/record/static2020-01-08-17-45-20.bag")

topic_agent1 = ['/agent1/ground_pose', '/agent1/nlink_linktrack_nodeframe2', '/agent1/odom'] # ground uwb odom


def process_msg(bag_name, topic_name_list, agent_name):
    bag_msg = bag_name.read_messages(topics=topic_name_list)

    ground = []
    uwb = []
    odom = []

    for topic, msg, t in bag_msg:

        if (topic == topic_name_list[0]):
            ground.append([msg.x, msg.y])
            
        if (topic == topic_name_list[1]):
            uwb.append([msg.position.x, msg.position.y])
            
        if (topic == topic_name_list[2]):
            odom.append([msg.pose.pose.position.x, msg.pose.pose.position.x])
            

    ground = np.array(ground)
    uwb = np.array(uwb)
    odom = np.array(odom)

    return ground, uwb, odom

ground_agent1, uwb_agent1, odom_agent1 = process_msg(bag_dyna, topic_agent1, 'agent1')

fig, ax = plt.subplots()
x_data, y_data = [], []

px = 0
py = 0

line_uwb, = ax.plot([], [], 'r-')
point_uwb, = ax.plot(px, py, 'ok', markersize = 5)
# plt.plot(uwb_agent1[:, 0], uwb_agent1[:, 1])

line_len = 20

def init():  # only required for blitting to give a clean slate.

    ax.set_ylim(-1, 10)
    ax.set_xlim(-1, 10)
    
    return [line_uwb, point_uwb]

def animate(i):
    length = uwb_agent1.shape[0]
    if i < length:
        x_data.append(uwb_agent1[i,0])
        y_data.append(uwb_agent1[i,1])

        if i > line_len:
            x_data.pop(0)
            y_data.pop(0)
            
        line_uwb.set_data(x_data,y_data)
        point_uwb.set_data(uwb_agent1[i,0], uwb_agent1[i,1])
     
    else:
        if len(x_data) > 1:
            x_data.pop(0)
            y_data.pop(0)

            line_uwb.set_data(x_data,y_data)

        else: 
            print('done')

    return [line_uwb, point_uwb]

ani = animation.FuncAnimation(
    fig, animate, init_func=init, interval=3, save_count=50)


plt.show()
# print(uwb_agent1.shape[0])
# print(uwb_agent1[:,0])


bag_static.close()





# # world_time = np.array(world_time)
# # # agent1_uwb_y = np.sin(agent1_uwb_x)

# # tck, u = splprep([agent1_uwb_x, agent1_uwb_y], s=0)

# # agent_uwb_new = splev(u, tck)
# # agent1_uwb_x_new = agent1_uwb_x
# # agent1_uwb_y_new = interpolate.splev(agent1_uwb_x_new, der=0)
# agent_uwb_new = data_smooth.smooth_curve2d(agent1_uwb_x, agent1_uwb_y)

# tck, u = splprep(agent_uwb_new, s=1)
# agent_uwb_new = splev(u, tck)

# # plt.plot(agent1_uwb_x, agent1_uwb_y, agent1_odom_x_new, agent1_odom_y_new, agent1_ground_x, agent1_ground_y)
# plt.plot(agent1_ground_x, agent1_ground_y)
# # plt.plot(agent1_uwb_x, agent1_uwb_y)
# # plt.plot(agent1_ground_x, agent1_ground_y)

# plt.legend()
# plt.show()



