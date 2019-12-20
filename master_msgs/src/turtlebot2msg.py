# !/usr/bin/env python
import message_filters
import sys
import rospy
from nav_msgs.msg import Odometry
from master_msgs.msg import global_info
from master_msgs.msg import node_frame2
from geometry_msgs.msg import Pose
from geometry_msgs.msg import Twist

pub_info = rospy.Publisher('/global_info', global_info, queue_size=10)
num_robot = int(sys.argv[1])
seq = 0

def global_callback(*args):
    # pub_info.publish("1")
    global_info_msg = global_info()
    global_info_msg.header.stamp = rospy.Time.now()

    global seq
    seq += 1

    # header
    global_info_msg.header.stamp = rospy.Time.now()
    global_info_msg.header.seq = seq
    global_info_msg.header.frame_id = "world"

    global_info_msg.pose.clear()
    global_info_msg.twist.clear()

    for i in range (num_robot):

        index_odom = 2 * i + 1
        index_uwb = 2 * i + 2

        # id
        global_info_msg.robot_id.append(i+1)

        # pose
        pose = Pose()
        pose.position = args[index_uwb].position     # from uwb
        pose.orientation = args[index_odom].pose.pose.orientation  # from odom
        global_info_msg.pose.append(pose)

        # twist
        twist = args[index_odom].twist.twist
        global_info_msg.twist.append(twist)

    pub_info.publish(global_info_msg)

    print("publish global information messages successfully")

def multi_turtlebot_info():
    rospy.init_node('turtlebot2msg', anonymous=True)
    rate=rospy.Rate(10)
    list_info_sub = []

    if len(sys.argv) < 2:
        rospy.logerr_once("Please input the number of the slave robot")
    else:
        for i in range(num_robot):
            topic_name_odom = "Slave0"+str(i+1)+"/odom"
            topic_name_uwb =  "Slave0"+str(i+1)+"/nlink_linktrack_nodeframe2"
            list_info_sub.append(message_filters.Subscriber(topic_name_odom, Odometry))
            list_info_sub.append(message_filters.Subscriber(topic_name_uwb, node_frame2))

        ts_info = message_filters.ApproximateTimeSynchronizer(list_info_sub, 10, 0.1, allow_headerless=True)
        ts_info.registerCallback(global_callback)
        rospy.spin()

    while not rospy.is_shutdown():
        rate.sleep()
        
if __name__=='__main__':
    try:
        multi_turtlebot_info()
    except rospy.ROSInterruptException:
        pass



