#!/usr/bin/env python3
import rospy
import numpy as np
import threading
from reciprocal_vel_obs import reciprocal_vel_obs
from gazebo_msgs.msg import WorldState
from gazebo_msgs.msg import ModelStates
from std_msgs.msg import String

robot_name_list = ['agent1', 'agent2','agent3','agent4','agent5', 'agent6', 'agent7','agent8','agent9','agent10', 'agent11', 'agent12','agent13','agent14']

def callback(data):

    for index, name in enumerate(data.name):
        
        if name in robot_name_list:
            if name == 'agent1':
                
                p_x = data.pose[index].position.x
                p_y = data.pose[index].position.y

                vel_x = data.twist[index].linear.x
                vel_y = data.twist[index].linear.y
                
        #     if name == robot_name:     
        #         
        #     else: 
        #         other_position = data.pose[index].position
        #         other_vel = data.twist[index]

        #         other_list_position.append(other_position)
        #         other_list_vel.append(other_vel)

def rl_rvo():
    rospy.init_node('rl_rvo', anonymous=True)
    pub=rospy.Publisher('/global/multi_vel', WorldState)
    rate=rospy.Rate(10)
    rospy.Subscriber("/gazebo/model_states", ModelStates, callback)
    
    while not rospy.is_shutdown():
        rate.sleep()

def spin():
    rospy.spin()


if __name__=='__main__':
    thread = threading.Thread(target=spin)
    rl_rvo()
    thread.start()
    
    