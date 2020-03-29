import numpy as np
import rospy
from gazebo_msgs.msg import ModelStates
from particle_filter import particle_filter
import threading



point_id = 0
range_point = 0
robot_name_list = ['agent1', 'agent2','agent3','agent4','agent5']
robot_name = 'agent1'
vel_list = []
range_list = []
init_flag = False

def callback(data):
    other_list_position = []
    other_list_vel = []

    global vel_list
    global range_list

    for index, name in enumerate(data.name):
        if name in robot_name_list:
            if name == robot_name:     
                robot_point = data.pose[index].position
                robot_twist = data.twist[index]
            
            else: 
                other_position = data.pose[index].position
                other_vel = data.twist[index]

                other_list_position.append(other_position)
                other_list_vel.append(other_vel)

    range_list = list(map(lambda x: np.sqrt((x.x - robot_point.x) ** 2 + (x.y - robot_point.y) ** 2), other_list_position))
    vel_list = list(map(lambda x: [x.linear.x - robot_twist.linear.x, x.angular.z - robot_twist.angular.z], other_list_vel))

    real_rela_coordinate = list(map(lambda x: [x.x - robot_point.x, x.y - robot_point.y], other_list_position))

    print(range_list)

def pf_esti():

    global vel_list
    global range_list
    global init_flag 

    range_one = range_list[0]
    rel_vel_one = vel_list[0]

    if not init_flag:
        pf = particle_filter(360, 0.1, range_one)
        init_flag = True
    
    print(range_one)




    # print(range_list, vel_list, real_rela_coordinate)

def range_estimation():
    
    rospy.init_node('ran_est', anonymous=True)
    rate=rospy.Rate(10)

    rospy.Subscriber("/gazebo/model_states", ModelStates, callback)

    rospy.spin()



    while not rospy.is_shutdown():
        pf_esti()
        rate.sleep()






if __name__=='__main__':
    try:
        range_estimation()
    except rospy.ROSInterruptException:
        pass