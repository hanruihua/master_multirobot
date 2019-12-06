#include "msg_trans_turtlebot.h"

void rvo_callback(const gazebo_msgs::ModelStates::ConstPtr& msg)
{
    num_robots = msg->twist.size();

    for (int i=1; i<num_robots+1; i++)
    {
        geometry_msgs::Twist twist;
        twist = msg->twist[i];
        
        turtlebot_pub[i].publish(twist);
    }

    ROS_INFO("successful");
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "msg_trans_turtlebot");
    ros::NodeHandle n;

    for (int i = 0; i < max_agent; i++)
    {
        std::string topic_name;
        if (i<10)
            topic_name = "Slave0" + std::to_string(i) + "/cmd_vel_mux/input/teleop";   
        else
            topic_name = "Slave" + std::to_string(i) + "/cmd_vel_mux/input/teleop";

        ros::Publisher pub = n.advertise<geometry_msgs::Twist>(topic_name, 1000);   

        turtlebot_pub.push_back(pub);    
    }

    ros::Subscriber sub = n.subscribe("rvo_vel", 1000, rvo_callback);
    ros::Rate loop_rate(10);

    while (ros::ok())
    {
         
        ros::spinOnce();
        loop_rate.sleep(); 
    }

}







