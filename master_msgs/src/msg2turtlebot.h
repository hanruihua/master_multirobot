#ifndef MSG_TRANS_TURTLEBOT_H
#define MSG_TRANS_TURTLEBOT_H

#include "ros/ros.h"
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/Quaternion.h>
#include "gazebo_msgs/ModelStates.h"
#include <math.h>
#include "master_msgs/multi_vel.h"
#include "rvo_ros/rvo_vel.h"

std::vector<ros::Publisher> turtlebot_pub;
const int max_agent = 10;
int num_robots;

int cout_flag = 0;
float angular_max = 1.2;
float pi = 3.1415926;

std::string trans_model = "sim";  // sim or exp

float cal_yaw(geometry_msgs::Quaternion quater);




#endif
