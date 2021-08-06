#!/usr/bin/env python3
import numpy as np
import threading
from pathlib import Path
import torch

import rospy
from gazebo_msgs.msg import WorldState
from gazebo_msgs.msg import ModelStates
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Pose
from std_msgs.msg import String

from math import sin, cos, pi, atan2
import time
import re
from rvo_inter import rvo_inter
from util import cal_yaw, cal_des_vel_omni, init_state_distribute, random_start_goal

# parameter
num_robot = 8
v_max = 1.0
robot_name_list = ['agent1', 'agent2','agent3','agent4','agent5', 'agent6', 'agent7','agent8','agent9','agent10', 'agent11', 'agent12']
collision_radius = 0.2

# envaluate
episode_count = 0
episode_num = 50
cost_time_list = []
goal_flag = True
mode = 3
# update info
robot_state_list = [None] * num_robot
robot_obs_state_list = [None] * num_robot
name_list = [None] * num_robot
propri_obs_list = [None] * num_robot
robot_pose_list = [None] * num_robot
agent_name_list = [None] * num_robot

obs_cir_list = []
obs_line_list = []
nei_state_list = []

info = {'rs_l': robot_state_list, 'ros_l': robot_obs_state_list, 'po_l': propri_obs_list,
'rp_l': robot_pose_list, 'an_l': agent_name_list}

# policy model
filename = str(Path(__file__).parent / 'project' / 'r8_0' /'r8_0_800.pt')
model = torch.load(filename)
model.eval()

# ros pub
pub=rospy.Publisher('/global/multi_vel', WorldState, queue_size=100)

# goal list
goal_list1, goal_list2, _ = init_state_distribute(robot_num=num_robot, init_mode=mode, random_bear=True)
goal_list = goal_list1.copy()

start_time = time.time()

def callback(data):

    global info, goal_list, start_time, episode_count, goal_flag
    arrive_flag_list = []

    for index, name in enumerate(data.name):
        if name in robot_name_list:
            id_agent = int(re.findall('\d+', name)[0])
            goal = goal_list[id_agent-1]

            p_x = data.pose[index].position.x
            p_y = data.pose[index].position.y
            yaw = cal_yaw(data.pose[index].orientation)
            
            vel_x = data.twist[index].linear.x
            vel_y = data.twist[index].linear.y

            # robot_collision_radius
            robot_obs_state = np.array([p_x, p_y, vel_x, vel_y, collision_radius])
            info['ros_l'][id_agent - 1] = robot_obs_state

            des_vel_x, des_vel_y = cal_des_vel_omni(np.array([p_x, p_y]), np.squeeze(goal), v_max)
            robot_state = np.array([p_x, p_y, vel_x, vel_y, collision_radius, des_vel_x, des_vel_y])
            info['rs_l'][id_agent - 1] = robot_state

            propri_obs = np.array([ vel_x, vel_y, des_vel_x, des_vel_y, cos(yaw), sin(yaw), collision_radius]) 
            info['po_l'][id_agent - 1] = propri_obs

            info['an_l'][id_agent - 1] = name

            info['rp_l'][id_agent - 1] = data.pose[index]

            if des_vel_x == 0 and des_vel_y == 0:
                arrive_flag = 1
            else: 
                arrive_flag = 0
            
            arrive_flag_list.append(arrive_flag)
    
    if min(arrive_flag_list):
        print('arrive')
        s_time = time.time()
        cost_time = s_time - start_time
        start_time = time.time()

        if episode_count != 0 and episode_count <= episode_num:
            cost_time_list.append(cost_time)

        print('arrive, current episode count' + str(episode_count))
        print('cost time:', cost_time)

        if episode_count <= episode_num:
            goal_flag = not goal_flag
            episode_count += 1
        else:
            avg_time = np.mean(cost_time_list)
            print('end, average time: ',avg_time)

        if mode == 3:
            if goal_flag:
                goal_list = goal_list1.copy()
            else:
                goal_list = goal_list2.copy()

        if mode == 2:
            _, goal_list = random_start_goal(num_robot=num_robot, interval=1.5, square=[0, 0, 10, 10])

def drl_rvo():

    rospy.init_node('drl_rvo', anonymous=True)
    rate=rospy.Rate(50)
    rospy.Subscriber("/gazebo/model_states", ModelStates, callback)

    rvo = rvo_inter(neighbor_region=5, neighbor_num=10)

    global info, goal_list

    while not rospy.is_shutdown():
        ws = WorldState()

        for i in range(num_robot):
            
            robot_state = info['rs_l'][i]
            
            if robot_state is None:
                continue

            cur_vel = robot_state[2:4]
            des_vel = robot_state[-2:]

            obs_vo_list, _, _, _ = rvo.config_vo_inf(robot_state, info['ros_l'], obs_cir_list, obs_line_list)

            if len(obs_vo_list) == 0:
                exter_obs = np.zeros(9,)
            else:
                exter_obs = np.concatenate(obs_vo_list)
            
            propri_obs = info['po_l'][i]

            observation = np.concatenate([propri_obs, exter_obs])

            with torch.no_grad():
                obs = torch.as_tensor(observation, dtype=torch.float32)
                action = model.act(obs, std_factor=0.000001)

            abs_action = 0.5 * action + cur_vel
            abs_action = np.clip(abs_action, -v_max, v_max)

            robot_name = info['an_l'][i]
        
            tw = Twist()

            if des_vel[0] == 0 and des_vel[1] == 0:
                tw.linear.x = 0
                tw.linear.y = 0
                tw.linear.z = 0
            else:
                tw.linear.x = abs_action[0]
                tw.linear.y = abs_action[1]
                tw.linear.z = 0

            robot_pose = info['rp_l'][i]

            ws.name.append(robot_name)
            ws.twist.append(tw)
            ws.pose.append(robot_pose)

        pub.publish(ws)
        # print('publish velocity successfully')
        rate.sleep()

def spin():
    rospy.spin()


if __name__=='__main__':
    thread = threading.Thread(target=spin)
    drl_rvo()
    start_time = time.time()
    thread.start()
    
    