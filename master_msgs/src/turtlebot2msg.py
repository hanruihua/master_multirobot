# !/usr/bin/env python
import message_filters
import sys
import rospy
from nav_msgs.msg import Odometry
from master_msgs.msg import global_info
from master_msgs.msg import node_frame2


pub_info = rospy.Publisher('/global_info', global_info, queue_size=10)

def global_callback(odo_data1, uwb_data1, odo_data2, uwb_data2):
    pub_info.publish("1")
    print("receive multiple odometry messages successfully")

def multi_turtlebot_info():
    rospy.init_node('turtlebot2msg', anonymous=True)
    rate=rospy.Rate(10)
    list_info_sub = []

    if len(sys.argv) < 2:
        rospy.logerr_once("Please input the number of the slave robot")
    else:
        num_message = sys.argv[1]

        for i in range(int(num_message)):
            topic_name_odom = "Slave0"+str(i+1)+"/odom"
            topic_name_uwb =  "Slave0"+str(i+1)+"/nlink_linktrack_nodeframe2"

            list_info_sub.append(message_filters.Subscriber(topic_name_odom, Odometry))
            list_info_sub.append(message_filters.Subscriber(topic_name_uwb, node_frame2))

        ts_info = message_filters.ApproximateTimeSynchronizer(list_info_sub, 10, 0.1)
        ts_info.registerCallback(global_callback)
        rospy.spin()

    while not rospy.is_shutdown():
        rate.sleep()
        
if __name__=='__main__':
    try:
        multi_turtlebot_info()
    except rospy.ROSInterruptException:
        pass



