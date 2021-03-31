#include "ros/ros.h"
#include <string>
#include <math.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/Pose.h>
#include <gazebo_msgs/WorldState.h>

// subscribe topic: /global/multi_vel type: gazebo_msgs::WorldState

// publish topic: cmd_vel_mux/input/teleop type: geometry_msgs::Twist

float cal_yaw(geometry_msgs::Quaternion quater);
float trans2pi(float angle);
int cout_flag = 0;
float angular_max = 2;
float pi = 3.1415926;
float control = 0.0;

std::string robot_name = "agent0";

geometry_msgs::Vector3 msg_robot_linear;
geometry_msgs::Vector3 msg_robot_angular;

geometry_msgs::Twist msg;

ros::Publisher chatter_pub;

float speed_smoothy(float target, float control, float acc_inc, float acc_dec);

void robotControl_callback(const gazebo_msgs::WorldState::ConstPtr &msgInput)
{

  int msg_index = 0;

  geometry_msgs::Twist msg_twist;
  geometry_msgs::Twist pub_twist;

  auto model_name = msgInput->name;

  auto index = std::find(model_name.begin(), model_name.end(), robot_name);

  msg_index = int(index - model_name.begin());
  float angle_yaw = 0.0;
  float angle_vel = 0.0;
  if (index != model_name.end())
  {
    msg_twist = msgInput->twist[msg_index];

    if (msg_twist.linear.z == 0)
    {

      float rvo_x = msg_twist.linear.x;
      float rvo_y = msg_twist.linear.y;

      float linear_x = 0.0;
      float angular_z = 0.0;

      if (rvo_x == 0.0f && rvo_y == 0.0f)
      {
        linear_x = 0;
        angular_z = 0;
      }
      else
      {
        double speed = sqrt(pow(rvo_x, 2) + pow(rvo_y, 2));

        if (rvo_y == 0)
          angle_vel = 0;
        else
          angle_vel = atan2(rvo_y, rvo_x);

        angle_yaw = cal_yaw(msgInput->pose[msg_index].orientation);

        float diff = trans2pi(angle_yaw - angle_vel);

        float speed_goal = speed * cos(diff);

        if (speed_goal < 0.01)
          linear_x = 0;
        else
          linear_x = speed_goal;   

        if (diff > 0.1)
          angular_z = diff < pi ? -angular_max : angular_max;
        else if (diff < -0.1)
          angular_z = diff < -pi ? -angular_max : angular_max;
        else
          angular_z = 0;

          control = speed_smoothy(linear_x, control, 0.05, 0.05);

          pub_twist.linear.x = control;
          pub_twist.angular.z = angular_z;
      }
    }
    else
    {
      control = speed_smoothy(msg_twist.linear.x, control, 0.05, 0.05);

      pub_twist.angular.z = msg_twist.angular.z;
      pub_twist.linear.x = control;
    }

    chatter_pub.publish(pub_twist);
    ROS_INFO("trans2robot: new velocity to %s is %f %f", robot_name.c_str(), pub_twist.linear.x, pub_twist.angular.z);
  }

  else
  {
    std::cout << "No velocity received" << std::endl;
  }
}

float cal_yaw(geometry_msgs::Quaternion quater)
{
  float x = quater.x;
  float y = quater.y;
  float z = quater.z;
  float w = quater.w;

  float raw = std::atan2(2 * (w * z + x * y), 1 - 2 * (pow(z, 2) + pow(y, 2)));
  return raw;
}

float speed_smoothy(float target, float control, float acc_inc, float acc_dec)
{
   if (target > control)
        control = std::min(target, control + acc_inc);
   else if (target < control) 
        control = std::max(target, control - acc_dec);
   else
        control = target;

    return control;

}

float trans2pi(float angle)
{
  if (angle > pi)
    angle = angle - 2*pi;
  
  else if (angle < -pi)
    angle = angle + 2 * pi;

  return angle;

}


// input robot id in argv
int main(int argc, char **argv)
{
  ros::init(argc, argv, "trans2robot");
  ros::NodeHandle n;
  chatter_pub = n.advertise<geometry_msgs::Twist>("cmd_vel_mux/input/teleop", 100);

  if (argc < 2)
    ROS_WARN("Please input the agent name, default agent0");
  else
    robot_name = argv[1];

  ros::Subscriber sub = n.subscribe("/global/multi_vel", 100, robotControl_callback);

  std::cout << "Configure completely" << std::endl;
  ros::Rate loop_rate(50);

  while (ros::ok())
  {

    //ROS_INFO("Published");
    ros::spinOnce();

    loop_rate.sleep();
  }
  return 0;
}
