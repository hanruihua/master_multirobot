#include "msg2turtlebot.h"

void callback(const rvo_ros::rvo_vel::ConstPtr &msg)
{
    gazebo_msgs::ModelStates gazebo_model;
    num_robots = msg->twist.size();

    if (trans_model == "sim")
    {
        for (int i=0; i<num_robots; i++)
        {

        }
        geometry_msgs::Twist twist;


        gazebo_model.name 


    }

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
            // float angular_vel = fabsf(angular_max * float(diff/pi));

            if (diff > 0.1)
                twist.angular.z = diff < pi ? - angular_max : angular_max;
            else if (diff < -0.1)
                twist.angular.z = diff < -pi ? -angular_max : angular_max;
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
    ROS_INFO("msg2robot: publish new velocities successfully, current model:");
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "msg2robot");

    if (argc > 1)
        trans_model = argv[1];

    ros::NodeHandle n;
    ros::Publisher pub_exp = n.advertise<master_msgs::multi_vel>("/global/multi_vel", 100);
    ros::Publisher pub_sim = n.advertise<gazebo_msgs::ModelStates>("/obstacles_velocity", 100);

    ros::Subscriber sub = n.subscribe("/rvo_vel", 1000, callback);

    ros::Rate loop_rate(50);

    while (ros::ok())
    {
        ros::spinOnce();
        loop_rate.sleep();
    }
}
