import sys
sys.path.append('master_plot')
sys.path.append('../')

from plot_lib import animate_path

import numpy as np
import rospy
from gazebo_msgs.msg import ModelStates
import matplotlib.pyplot as plt
import threading

fig, ax = plt.subplots()
num_agent = 10

anp = animate_path(fig, ax, num_agent, keep = True)

def callback(data):

    coordinate_list = []

    agent_names = data.name
    agent_poses = data.pose
    agent_twists= data.twist

    for pose in agent_poses:

        x = pose.position.x
        y = pose.position.y

        coordinate_list.append([x, y])

    anp.update_coordinate(coordinate_list)

    # print(coordinate_list)

def path_plot():

    rospy.init_node('rt_path_node')
    rospy.Subscriber('/global/model_states', ModelStates, callback)


def spin_callback():
    rospy.spin()

if __name__ == "__main__":

    path_plot()  
    thread_callback = threading.Thread(target = spin_callback, name='ros_callback', daemon=True)
    thread_callback.start()
    anp.ani_plot()
   