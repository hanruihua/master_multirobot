//
// Created by ubuntu on 19-12-12.
//
//
// Created by Carlos on 19-6-13.
//
#include <ros/ros.h>
#include <iostream>
#include "std_msgs/String.h"
#include "msg_utils.h"
#include <gazebo_msgs/ModelStates.h>
#include "master_msg/node_frame2.h"
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Vector3.h>
#include "geometry_msgs/Twist.h"

int agent_number = 10;
std::vector<int> flags;
geometry_msgs::Pose void_pose;
geometry_msgs::Twist void_twist;

geometry_msgs::Point  agent_pose_points;
geometry_msgs::Quaternion  agent_quaternion;
geometry_msgs::Twist twist;
std::string agent_name;

gazebo_msgs::ModelStates agent_states;
ros::Publisher chatter_pub;
msg_utils transfer_tool;

void subscribe_callback(const master_msg::node_frame2::ConstPtr& msgInput){

    int update = 0;
    if(msgInput->role == 2){
        agent_name = "agent" + transfer_tool.int2string(msgInput->id) + "";

        agent_pose_points.x = msgInput->position.x;
        //agent_pose_points.x = 2.0f;
        // std::cout << msgInput->position.x <<"msg"<< std::endl;
        // std::cout << agent_pose_points.x << std::endl;
        agent_pose_points.y = msgInput->position.y;
        agent_pose_points.z = msgInput->position.z;
        agent_quaternion.x = msgInput->quaternions[0];
        agent_quaternion.y = msgInput->quaternions[1];
        agent_quaternion.z = msgInput->quaternions[2];
        agent_quaternion.w = msgInput->quaternions[3];
        agent_states.name[msgInput->id-1] = agent_name;
        agent_states.pose[msgInput->id-1].position = agent_pose_points;
        agent_states.pose[msgInput->id-1].orientation = agent_quaternion;
        agent_states.twist[msgInput->id-1].linear.x = msgInput->velocity.x;
        agent_states.twist[msgInput->id-1].linear.y = msgInput->velocity.y;
        agent_states.twist[msgInput->id-1].linear.z = msgInput->velocity.z;
        flags[msgInput->id-1] = flags[msgInput->id-1] + 1;
    }
    std::cout << agent_name << "is added into buffer" << std::endl;
    for(int i = 0;i<flags.size()-1;i++){
        if((flags[i]==flags[i+1])&&(flags[1]!=flags[i+1]+1000)){
            update = (update+1)%1000;
        }
    }
    if(update==agent_number-1){
        chatter_pub.publish(agent_states);
    }

}
void subscribe_callback2(const master_msg::node_frame2::ConstPtr& msgInput){

    int update = 0;
    if(msgInput->role == 2){
        agent_name = "agent" + transfer_tool.int2string(msgInput->id) + "";

        agent_pose_points.x = msgInput->position.x;
        //agent_pose_points.x = 2.0f;
        // std::cout << msgInput->position.x <<"msg"<< std::endl;
        // std::cout << agent_pose_points.x << std::endl;
        agent_pose_points.y = msgInput->position.y;
        agent_pose_points.z = msgInput->position.z;
        agent_quaternion.x = msgInput->quaternions[0];
        agent_quaternion.y = msgInput->quaternions[1];
        agent_quaternion.z = msgInput->quaternions[2];
        agent_quaternion.w = msgInput->quaternions[3];
        agent_states.name[msgInput->id-1] = agent_name;
        agent_states.pose[msgInput->id-1].position = agent_pose_points;
        agent_states.pose[msgInput->id-1].orientation = agent_quaternion;
        agent_states.twist[msgInput->id-1].linear.x = msgInput->velocity.x;
        agent_states.twist[msgInput->id-1].linear.y = msgInput->velocity.y;
        agent_states.twist[msgInput->id-1].linear.z = msgInput->velocity.z;
        flags[msgInput->id-1] = flags[msgInput->id-1] + 1;
    }
    std::cout << agent_name << "is added into buffer" << std::endl;
    for(int i = 0;i<flags.size()-1;i++){
        if((flags[i]==flags[i+1])&&(flags[1]!=flags[i+1]+1000)){
            update = (update+1)%1000;
        }
    }
    if(update==agent_number-1){
        chatter_pub.publish(agent_states);
    }

}
void subscribe_callback3(const master_msg::node_frame2::ConstPtr& msgInput){

    int update = 0;
    if(msgInput->role == 2){
        agent_name = "agent" + transfer_tool.int2string(msgInput->id) + "";

        agent_pose_points.x = msgInput->position.x;
        //agent_pose_points.x = 2.0f;
        // std::cout << msgInput->position.x <<"msg"<< std::endl;
        // std::cout << agent_pose_points.x << std::endl;
        agent_pose_points.y = msgInput->position.y;
        agent_pose_points.z = msgInput->position.z;
        agent_quaternion.x = msgInput->quaternions[0];
        agent_quaternion.y = msgInput->quaternions[1];
        agent_quaternion.z = msgInput->quaternions[2];
        agent_quaternion.w = msgInput->quaternions[3];
        agent_states.name[msgInput->id-1] = agent_name;
        agent_states.pose[msgInput->id-1].position = agent_pose_points;
        agent_states.pose[msgInput->id-1].orientation = agent_quaternion;
        agent_states.twist[msgInput->id-1].linear.x = msgInput->velocity.x;
        agent_states.twist[msgInput->id-1].linear.y = msgInput->velocity.y;
        agent_states.twist[msgInput->id-1].linear.z = msgInput->velocity.z;
        flags[msgInput->id-1] = flags[msgInput->id-1] + 1;
    }
    std::cout << agent_name << "is added into buffer" << std::endl;
    for(int i = 0;i<flags.size()-1;i++){
        if((flags[i]==flags[i+1])&&(flags[1]!=flags[i+1]+1000)){
            update = (update+1)%1000;
        }
    }
    if(update==agent_number-1){
        chatter_pub.publish(agent_states);
    }

}

int main(int argc, char **argv){

    ros::init(argc, argv, "uwb_msg_node");


    if(argc >= 2){

        agent_number = transfer_tool.string2int(argv[1]);

        for(int i =0;i<agent_number;i++){
            agent_states.name.push_back("");
            agent_states.pose.push_back(void_pose);
            agent_states.twist.push_back(void_twist);
            flags.push_back(0);
        }
    }else{
        for(int i =0;i<agent_number;i++){
            agent_states.name.push_back("");
            agent_states.pose.push_back(void_pose);
            agent_states.twist.push_back(void_twist);
            flags.push_back(0);
        }
    }

    ros::NodeHandle n;
//    std::vector<ros::Subscriber> agent_subs;
//    std::string topic_name;
//    std::string sub_name;
//    for (int j = 1; j < agent_number+1; ++j) {
//        topic_name = "/Slave0" + transfer_tool.int2string(j) + "/nlink_linktrack_nodeframe2";
//        sub_name = "agents_sub"+ transfer_tool.int2string(j) + "";
//        ros::Subscriber sub_name = n.subscribe(topic_name, 1000, subscribe_callback);
//        agent_subs.push_back(sub_name);
//    }

    ros::Subscriber agents_sub1 = n.subscribe("/Slave01/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    ros::Subscriber agents_sub2 = n.subscribe("/Slave02/nlink_linktrack_nodeframe2", 1000, subscribe_callback2);
    ros::Subscriber agents_sub3 = n.subscribe("/Slave03/nlink_linktrack_nodeframe2", 1000, subscribe_callback3);
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



