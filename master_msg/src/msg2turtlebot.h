#ifndef MSG_TRANS_TURTLEBOT_H
#define MSG_TRANS_TURTLEBOT_H

#include "ros/ros.h"
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/Quaternion.h>
#include "gazebo_msgs/ModelStates.h"
#include <math.h>

std::vector<ros::Publisher> turtlebot_pub;
const int max_agent = 10;
int num_robots;

float cal_yaw(geometry_msgs::Quaternion quater);




#endif
