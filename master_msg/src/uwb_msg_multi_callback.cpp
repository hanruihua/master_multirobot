#include <ros/ros.h>
#include <iostream>
#include "std_msgs/String.h"
#include "msg_utils.h"
#include "master_msg/node_frame2.h"
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Vector3.h>
#include "geometry_msgs/Twist.h"
#include <ros/callback_queue.h>
#include "geometry_msgs/PoseArray.h"


int agent_number = 10;
std::vector<int> flags;
geometry_msgs::Pose void_pose;
geometry_msgs::Twist void_twist;

geometry_msgs::Point  agent_pose_points;
geometry_msgs::Quaternion  agent_quaternion;

uint32_t my_seq = 0;

geometry_msgs::PoseArray agent_states;
ros::Publisher chatter_pub;
msg_utils transfer_tool;
std::vector<ros::CallbackQueue*> sub_queue_list;
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



void subscribe_callback(const master_msg::node_frame2::ConstPtr& msgInput){
    if(msgInput->role == 2){
        agent_pose_points.x = msgInput->position.x;
        agent_pose_points.y = msgInput->position.y;
        agent_pose_points.z = msgInput->position.z;
        agent_quaternion.x = msgInput->quaternions[0];
        agent_quaternion.y = msgInput->quaternions[1];
        agent_quaternion.z = msgInput->quaternions[2];
        agent_quaternion.w = msgInput->quaternions[3];
        agent_states.poses[msgInput->id-1].position = agent_pose_points;
        agent_states.poses[msgInput->id-1].orientation = agent_quaternion;
        flags[msgInput->id-1] = flags[msgInput->id-1] + 1;
    }
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

    std::vector<ros::Subscriber> agent_subs;
    std::string topic_name;
    std::string sub_name;
    sub_queue_list.push_back(&sub_queue1);
    sub_queue_list.push_back(&sub_queue2);
    sub_queue_list.push_back(&sub_queue3);
    sub_queue_list.push_back(&sub_queue4);
    sub_queue_list.push_back(&sub_queue5);
    sub_queue_list.push_back(&sub_queue6);
    sub_queue_list.push_back(&sub_queue7);
    sub_queue_list.push_back(&sub_queue8);
    sub_queue_list.push_back(&sub_queue9);
    sub_queue_list.push_back(&sub_queue10);
    for (int j = 1; j < agent_number+1; ++j) {
        ros::NodeHandle n;
        n.setCallbackQueue(sub_queue_list[j-1]);
        topic_name = "/Slave0" + transfer_tool.int2string(j) + "/nlink_linktrack_nodeframe2";
        sub_name = "agents_sub"+ transfer_tool.int2string(j) + "";
        ros::Subscriber sub_name = n.subscribe(topic_name, 100, subscribe_callback);
        agent_subs.push_back(sub_name);
        //sub_queue_list.push_back(&sub_queue);
    }
    ros::NodeHandle n;

//    ros::Subscriber agents_sub1 = n1.subscribe("/Slave01/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
//    ros::Subscriber agents_sub2 = n2.subscribe("/Slave02/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
//    ros::Subscriber agents_sub3 = n3.subscribe("/Slave03/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    //ros::Subscriber agents_sub4 = n4.subscribe("/Slave04/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    //ros::Subscriber agents_sub5 = n.subscribe("/Slave05/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub6 = n.subscribe("/Slave06/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub7 = n.subscribe("/Slave07/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub8 = n.subscribe("/Slave08/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub9 = n.subscribe("/Slave09/nlink_linktrack_nodeframe2", 1000, subscribe_callback);
    // ros::Subscriber agents_sub10 = n.subscribe("/Slave10/nlink_linktrack_nodeframe2", 1000, subscribe_callback);

    chatter_pub = n.advertise<geometry_msgs::PoseArray>("agent_states",1000);

    ros::Rate loop_rate(50);

    while(ros::ok()){
        int update = 0;

        for(int j = 0; j< agent_number;j++){
            //loop_rate.sleep();
            sub_queue_list[j]->callOne(ros::WallDuration(0));
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

        agent_states.header.frame_id="1";
        ros::Time current_time = ros::Time::now();
        agent_states.header.stamp = current_time;
        agent_states.header.seq = my_seq;
        chatter_pub.publish(agent_states);
        my_seq = my_seq+1;
        
        loop_rate.sleep();
//        if(update==agent_number-1){
//            chatter_pub.publish(agent_states);
//            loop_rate.sleep();
//        }

    }
    return 0;
}
