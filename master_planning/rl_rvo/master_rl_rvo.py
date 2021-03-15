#!/usr/bin/env python3
import rospy
import numpy as np
import threading
from reciprocal_vel_obs import reciprocal_vel_obs
from gazebo_msgs.msg import WorldState
from gazebo_msgs.msg import ModelStates
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Pose
from std_msgs.msg import String
from math import atan2
from reciprocal_vel_obs import reciprocal_vel_obs
import torch
import sys
from math import sin, cos
import re 

num_robot = 2
robot_name_list = ['agent1', 'agent2','agent3','agent4','agent5', 'agent6', 'agent7','agent8','agent9','agent10', 'agent11', 'agent12']
goal_list = [[9.5, 8], [8, 8], [6.5, 8], [5, 8], [3.5, 8], [2, 8],  [2, 2], [3.5, 2], [5, 2], [6.5, 2], [8, 2], [9.5, 2]]
start_list = [[2, 2], [3.5, 2], [5, 2], [6.5, 2], [8, 2], [9.5, 2],  [9.5, 8], [8, 8], [6.5, 8], [5, 8], [3.5, 8], [2, 8]]
v_max = 1.5
robot_radius = 0.2
robot_collision_radius = 0.4
neighbors_region = 4

filename = '/home/han/catkin_ws/src/master_multirobot/master_planning/rl_rvo/project/rl_rvo_nav/ppo_save/model/move14/move14.pt'

pub=rospy.Publisher('/global/multi_vel', WorldState, queue_size=100)

def cal_des_omni(position, goal_position):

	dif_x = goal_position[0] - position[0]
	dif_y = goal_position[1] - position[1]

	dis = np.sqrt( dif_x**2 + dif_y**2 )
	radian = atan2(dif_y, dif_x)

	if dis > 0.2:
		vx = v_max * cos(radian)
		vy = v_max * sin(radian)

	else:
		vx = 0
		vy = 0
	
	return vx, vy

def load_policy(filename, std_factor=1):

    model = torch.load(filename)
    model.eval()
    def get_action(x):
        with torch.no_grad():
            x = torch.as_tensor(x, dtype=torch.float32)
            action = model.act(x, factor=std_factor)
        return action

    return get_action


get_action = load_policy(filename, std_factor=0.001)

def callback(data):

	moving_state_list = []
	robot_state_list = []
	name_list = []
	pose_list=[]
	for index, name in enumerate(data.name):
		
		if name in robot_name_list:
			id_agent = int(re.findall('\d+', name)[0])
			
			p_x = data.pose[index].position.x
			p_y = data.pose[index].position.y

			vel_x = data.twist[index].linear.x
			vel_y = data.twist[index].linear.y

			collision_range = robot_collision_radius

			moving_state = np.array([p_x, p_y, vel_x, vel_y, collision_range])
			moving_state_list.append(moving_state)

			goal_position = goal_list[id_agent-1]
			des_x, des_y = cal_des_omni([p_x, p_y], goal_position)

			robot_state = np.array([p_x, p_y, vel_x, vel_y, robot_collision_radius, des_x, des_y])
			robot_state_list.append(robot_state)
			name_list.append(name)

			pose_list.append(data.pose[index])

	abs_action_list = []

	for i in range(num_robot):

		moving_state_list2 = moving_state_list[:]
		robot_state = robot_state_list[i]
		name = name_list[i]
		
		del moving_state_list2[i]

		def rs_function(moving_state):
			
			dif_x = moving_state[0] - p_x
			dif_y = moving_state[0] - p_y
			dis = np.sqrt( dif_x**2 + dif_y**2)

			return dis

		filter_moving_list = list(filter(lambda m: rs_function(m) <= neighbors_region, moving_state_list2))
		sorted_moving_list = sorted(filter_moving_list, key=lambda m: rs_function(m))

		rvo = reciprocal_vel_obs(robot_state, sorted_moving_list, vxmax = 1.5, vymax = 1.5)
		rvo_list = rvo.config_rvo2()
		vo_flag, min_dis = rvo.vo_out2(vel_x, vel_y, rvo_list)
		
		if min_dis > neighbors_region:
			min_dis = neighbors_region

		if len(rvo_list) == 0:
			rvo_array_flat = np.zeros(8,)
		else:
			rvo_array = np.concatenate(rvo_list)
			rvo_array_flat = rvo_array.flatten()

		# obs1 = np.array([vel_x, vel_y, des_x, des_y, collision_range, min_dis])
		obs1 = np.array([vel_x, vel_y, des_x, des_y, collision_range])
		obs = np.concatenate((obs1, rvo_array_flat)) 

		action = get_action(obs)
		abs_action = 0.5 * action + np.array([vel_x, vel_y])
		abs_action_list.append(abs_action)


	ws = WorldState()

	for i in range(num_robot):
		robot_name = name_list[i]
		
		tw = Twist()
		tw.linear.x = abs_action_list[i][0]
		tw.linear.y = abs_action_list[i][1]

		robot_pose = pose_list[i]

		ws.name.append(robot_name)
		ws.twist.append(tw)
		ws.pose.append(robot_pose)

		pub.publish(ws)

	print('publish velocity successfully')
		#     if name == robot_name:     
		#         
		#     else: 
		#         other_position = data.pose[index].position
		#         other_vel = data.twist[index]

# other_list_position.append(other_position)
		#         other_list_vel.append(other_vel)

def rl_rvo():
	rospy.init_node('rl_rvo', anonymous=True)
	
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
	
	