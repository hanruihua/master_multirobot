//
// Created by Carlos on 19-6-13.
//
#include <sstream>
#include <sys/time.h>
#include <sys/resource.h>
#include <ros/ros.h>
#include "std_msgs/String.h"
#include <string>  
#include <iostream> 
#include <gazebo_msgs/ModelStates.h>
#include "master_msg/node_frame2.h"
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Vector3.h>
#include "geometry_msgs/Twist.h"

std::ostringstream stream;
std::stringstream intStream;
int agent_number = 10;

geometry_msgs::Pose void_pose;
geometry_msgs::Twist void_twist;

geometry_msgs::Point  agent_pose_points;
geometry_msgs::Quaternion  agent_quaternion;
geometry_msgs::Twist twist;
std::string agent_name;

gazebo_msgs::ModelStates agent_states;
ros::Publisher chatter_pub;

void subscribe_callback(const master_msg::node_frame2::ConstPtr& msgInput){
    stream.clear();  
    stream.str("");
    printf("now in callback");
    if(msgInput->role == 2){
        stream << msgInput->id;
        agent_name = stream.str();


        agent_pose_points.x = msgInput->position.x;
        //agent_pose_points.x = 2.0f;
        std::cout << msgInput->position.x <<"msg"<< std::endl;
        std::cout << agent_pose_points.x << std::endl;


        agent_pose_points.y = msgInput->position.y;
        agent_pose_points.z = msgInput->position.z;

        agent_quaternion.x = msgInput->quaternions[0]; 
        agent_quaternion.y = msgInput->quaternions[1]; 
        agent_quaternion.z = msgInput->quaternions[2]; 
        agent_quaternion.w = msgInput->quaternions[3];   
        agent_states.name[msgInput->id] = agent_name;
        agent_states.pose[msgInput->id].position = agent_pose_points;
        agent_states.pose[msgInput->id].orientation = agent_quaternion;
        agent_states.twist[msgInput->id].linear.x = msgInput->velocity.x;
        agent_states.twist[msgInput->id].linear.y = msgInput->velocity.y;
        agent_states.twist[msgInput->id].linear.z = msgInput->velocity.z;
    }
    chatter_pub.publish(agent_states);

}

int main(int argc, char **argv){

    ros::init(argc, argv, "master_msgtrans");

    if(argc!=0){
        // intStream << argv[0];
        // intStream >> agent_number;
        // intStream.clear();
        // intStream.str("");
        for(int i =0;i<agent_number;i++){
            agent_states.name.push_back("");
            agent_states.pose.push_back(void_pose);
            agent_states.twist.push_back(void_twist);
        }
    }else{
        for(int i =0;i<agent_number;i++){
            agent_states.name.push_back("");
            agent_states.pose.push_back(void_pose);
            agent_states.twist.push_back(void_twist);
        }
    }
    
    ros::NodeHandle n;
    ros::Subscriber agents_sub1 = n.subscribe("/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub2 = n.subscribe("/Slave02/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub3 = n.subscribe("/Slave03/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub4 = n.subscribe("/Slave04/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub5 = n.subscribe("/Slave05/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub6 = n.subscribe("/Slave06/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub7 = n.subscribe("/Slave07/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub8 = n.subscribe("/Slave08/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub9 = n.subscribe("/Slave09/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub10 = n.subscribe("/Slave10/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    
    chatter_pub = n.advertise<gazebo_msgs::ModelStates>("agent_status",1000);

    ros::Rate loop_rate(10);

    while(ros::ok()){
        ros::spinOnce();
        loop_rate.sleep();
    
    }
    return 0;
}


