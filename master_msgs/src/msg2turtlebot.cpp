#include "msg2turtlebot.h"

void rvo_callback(const gazebo_msgs::ModelStates::ConstPtr &msg)
{
    num_robots = msg->twist.size();
    std::vector<geometry_msgs::Twist> vector_twist;

    for (int i = 0; i < num_robots; i++)
    {
        geometry_msgs::Twist twist;
        float rvo_x = msg->twist[i].linear.x;
        float rvo_y = msg->twist[i].linear.y;

        if (rvo_x == 0.0f && rvo_y == 0.0f)
        {
            twist.linear.x = 0;
            twist.angular.z = 0;
        }
        else
        {
            double speed = sqrt(pow(rvo_x, 2) + pow(rvo_y, 2));

            if (speed < 0.01)
                twist.linear.x = 0;
            else
                twist.linear.x = speed;

            float angle_yaw = cal_yaw(msg->pose[i].orientation);
            float angle_vel = atan2(rvo_y, rvo_x);
            
            float diff = angle_yaw - angle_vel;

            // twist.angular.z = (diff > 0.02) ? (diff < 3.1415926 ? -0.5 : 0.5) : (diff < );    
            if (angle_yaw - angle_vel > 0.05)
                twist.angular.z = diff < 3.1415926 ? -0.5 : 0.5;
            else if (angle_yaw - angle_vel < -0.05)
                twist.angular.z = diff < -3.1415926 ? -0.5 : 0.5;
            else
                twist.angular.z = 0;

        }
        vector_twist.push_back(twist);
    }

    int num_twist = vector_twist.size();

    for (int j = 0; j < num_twist; j++)
    {
        turtlebot_pub[j + 1].publish(vector_twist[j]);
    }
    vector_twist.clear();
    ROS_INFO("successful publish");
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

int main(int argc, char **argv)
{
    ros::init(argc, argv, "msg2turtlebot");
    ros::NodeHandle n;

    for (int i = 0; i < max_agent; i++)
    {
        std::string topic_name;
        if (i < 10)
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
