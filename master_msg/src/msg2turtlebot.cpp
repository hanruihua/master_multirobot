#include "msg2turtlebot.h"

void rvo_callback(const gazebo_msgs::ModelStates::ConstPtr& msg)
{
    num_robots = msg->twist.size();

    for (int i=1; i<num_robots+1; i++)
    {
        geometry_msgs::Twist twist;
        float rvo_x = msg->twist[i].linear.x;
        float rvo_y = msg->twist[i].linear.y;

        if (rvo_x == 0 && rvo_y == 0)
        {
            twist.linear.x = 0;
            twist.angular.z = 0;
        }
        else
        {
            twist.linear.x = sqrt(pow(rvo_x, 2) + pow(rvo_y, 2));
            
            float angle_raw = cal_raw(msg->pose[i].orientation);
            float angle_vel = atan(rvo_y/rvo_x);

            if (angle_raw > angle_vel)
                twist.angular.z = -0.4;
            else if (angle_raw < angle_vel)
                twist.angular.z = 0.4;
        }
        
        turtlebot_pub[i].publish(twist);
    }

    ROS_INFO("successful");
}

float cal_raw(geometry_msgs::Quaternion quater)
{
    float x = quater.x;
    float y = quater.y;
    float z = quater.z;
    float w = quater.w;

    float raw = std::atan2(2*(w*z+x*y), 1-2*(pow(z, 2)+ pow(y, 2)));
    return raw;
}



int main(int argc, char **argv)
{
    ros::init(argc, argv, "msg2turtlebot");
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







