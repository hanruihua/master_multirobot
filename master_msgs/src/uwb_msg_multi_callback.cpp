#include <ros/ros.h>
#include <iostream>
#include "std_msgs/String.h"
#include "msg_utils.h"
#include "master_msgs/node_frame2.h"
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Vector3.h>
#include "geometry_msgs/Twist.h"
#include <ros/callback_queue.h>
#include "geometry_msgs/PoseArray.h"
#include "gazebo_msgs/ModelStates.h"
#include "nav_msgs/Odometry.h"


int agent_number = 10;
std::vector<int> flags;
geometry_msgs::Pose void_pose;
geometry_msgs::Twist void_twist;

geometry_msgs::Point  agent_pose_points;
geometry_msgs::Quaternion  agent_quaternion;

uint32_t my_seq = 0;

//geometry_msgs::PoseArray agent_states;
gazebo_msgs::ModelStates agent_states;

ros::Publisher chatter_pub;
msg_utils transfer_tool;
std::vector<ros::CallbackQueue*> uwb_sub_queue_list;
std::vector<ros::CallbackQueue*> odom_sub_queue_list;
ros::CallbackQueue sub_queue1;
ros::CallbackQueue sub_queue2;
ros::CallbackQueue sub_queue3;
ros::CallbackQueue sub_queue4;
ros::CallbackQueue sub_queue5;
ros::CallbackQueue sub_queue6;
ros::CallbackQueue sub_queue7;
ros::CallbackQueue sub_queue8;
ros::CallbackQueue sub_queue9;
ros::CallbackQueue sub_queue10;
ros::CallbackQueue sub_queue_odom_1;
ros::CallbackQueue sub_queue_odom_2;
ros::CallbackQueue sub_queue_odom_3;
ros::CallbackQueue sub_queue_odom_4;
ros::CallbackQueue sub_queue_odom_5;
ros::CallbackQueue sub_queue_odom_6;
ros::CallbackQueue sub_queue_odom_7;
ros::CallbackQueue sub_queue_odom_8;
ros::CallbackQueue sub_queue_odom_9;
ros::CallbackQueue sub_queue_odom_10;




void uwb_subscribe_callback(const master_msgs::node_frame2::ConstPtr& msgInput){
    if(msgInput->role == 2){
        agent_pose_points.x = msgInput->position.x;
        agent_pose_points.y = msgInput->position.y;
        agent_pose_points.z = msgInput->position.z;
        //agent_quaternion.x = msgInput->quaternions[0];
        //agent_quaternion.y = msgInput->quaternions[1];
        //agent_quaternion.z = msgInput->quaternions[2];
        //agent_quaternion.w = msgInput->quaternions[3];
        agent_states.pose[msgInput->id-1].position = agent_pose_points;
        //agent_states.poses[msgInput->id-1].orientation = agent_quaternion;
        flags[msgInput->id-1] = flags[msgInput->id-1] + 1;
    }
    //std::cout << agent_name << "is added into buffer" << std::endl;
    //ROS_INFO("Called callback\n");
}

void odom_subscribe_callback(const nav_msgs::Odometry::ConstPtr& msgInput){

    //agent_pose_points.x = msgInput->position.x;
   // agent_pose_points.y = msgInput->position.y;
    //agent_pose_points.z = msgInput->position.z;
    // agent_quaternion.x = msgInput->pose.orientation;
    // agent_quaternion.y = msgInput->quaternions[1];
    // agent_quaternion.z = msgInput->quaternions[2];
    // agent_quaternion.w = msgInput->quaternions[3];
    // agent_states.poses[msgInput->id-1].position = agent_pose_points;
    // agent_states.poses[msgInput->id-1].orientation = agent_quaternion;
    agent_states.pose.[msgInput->id-1]
    flags[msgInput->id-1] = flags[msgInput->id-1] + 1;
    
    //std::cout << agent_name << "is added into buffer" << std::endl;
    //ROS_INFO("Called callback\n");
}

int main(int argc, char **argv){

    ros::init(argc, argv, "uwb_msg_node");

    if(argc >= 2){

        agent_number = transfer_tool.string2int(argv[1]);

        for(int i =0;i<agent_number;i++){
            agent_states.poses.push_back(void_pose);
            flags.push_back(0);
        }
    }else{
        for(int i =0;i<agent_number;i++){
            agent_states.poses.push_back(void_pose);
            flags.push_back(0);
        }
    }

    std::vector<ros::Subscriber> uwb_subs;
    std::vector<ros::Subscriber> odom_subs;
    std::string topic_name;
    std::string sub_name;
    uwb_sub_queue_list.push_back(&sub_queue1);
    uwb_sub_queue_list.push_back(&sub_queue2);
    uwb_sub_queue_list.push_back(&sub_queue3);
    uwb_sub_queue_list.push_back(&sub_queue4);
    uwb_sub_queue_list.push_back(&sub_queue5);
    uwb_sub_queue_list.push_back(&sub_queue6);
    uwb_sub_queue_list.push_back(&sub_queue7);
    uwb_sub_queue_list.push_back(&sub_queue8);
    uwb_sub_queue_list.push_back(&sub_queue9);
    uwb_sub_queue_list.push_back(&sub_queue10);

    odom_sub_queue_list.push_back(&sub_queue_odom_1);
    odom_sub_queue_list.push_back(&sub_queue_odom_2);
    odom_sub_queue_list.push_back(&sub_queue_odom_3);
    odom_sub_queue_list.push_back(&sub_queue_odom_4);
    odom_sub_queue_list.push_back(&sub_queue_odom_5);
    odom_sub_queue_list.push_back(&sub_queue_odom_6);
    odom_sub_queue_list.push_back(&sub_queue_odom_7);
    odom_sub_queue_list.push_back(&sub_queue_odom_8);
    odom_sub_queue_list.push_back(&sub_queue_odom_9);
    odom_sub_queue_list.push_back(&sub_queue_odom_10);

    for (int j = 1; j < agent_number+1; ++j) {
        ros::NodeHandle n1;
        n1.setCallbackQueue(uwb_sub_queue_list[j-1]);
        ros::NodeHandle n2;
        n2.setCallbackQueue(odom_sub_queue_list[j-1]);

        topic_uwb = "/Slave0" + transfer_tool.int2string(j) + "/nlink_linktrack_nodeframe2";
        topic_odom = "/Slave0" + transfer_tool.int2string(j) + "/odom";
        ros::Subscriber sub_uwb = n.subscribe(topic_name, 100, subscribe_callback);
        uwb_subs.push_back(sub_uwb);
        ros::Subscriber sub_odom = n.subscribe(topic_name, 100, subscribe_callback);
        odom_subs.push_back(sub_odom);
        //sub_queue_list.push_back(&sub_queue);
    }
    ros::NodeHandle n;

//    ros::Subscriber agents_sub1 = n1.subscribe("/Slave01/nlink_linktrack_nodeframe2", 1000, subscribe_callback);

    chatter_pub = n.advertise<gazebo_msgs::ModelStates>("Model_States",1000);
    ros::Rate loop_rate(50);

    while(ros::ok()){
        int update = 0;

        for(int j = 0; j< agent_number;j++){
            //loop_rate.sleep();
            uwb_sub_queue_list[j]->callOne(ros::WallDuration(0));
            odom_sub_queue_list[j]->callOne(ros::WallDuration(0));
        }

//        loop_rate.sleep();
//        sub_queue1.callOne(ros::WallDuration(0));
//        loop_rate.sleep();
//        sub_queue2.callOne(ros::WallDuration(0));
//        loop_rate.sleep();
//        sub_queue3.callOne(ros::WallDuration(0));

        for(int i = 0;i<flags.size()-1;i++){
            if((flags[i]==flags[i+1])&&(flags[1]!=flags[i+1]+1000)){
                update = (update+1)%1000;
            }
        }
        std::cout << "flags are " + std::to_string(flags[0]) +","+ std::to_string(flags[1]) +","+ std::to_string(flags[2]) +","+ std::to_string(flags[3]) << std::endl;

        //agent_states.header.frame_id="1";
        //ros::Time current_time = ros::Time::now();
        //agent_states.header.stamp = current_time;
        //agent_states.header.seq = my_seq;
        chatter_pub.publish(agent_states);
        //my_seq = my_seq+1;
        
        loop_rate.sleep();
//        if(update==agent_number-1){
//            chatter_pub.publish(agent_states);
//            loop_rate.sleep();
//        }

    }
    return 0;
}
