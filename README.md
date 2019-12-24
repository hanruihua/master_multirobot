# Multiple Robots Master
The program of multiple robot running in master computer

Please run the [Slave program](https://github.com/hanruihua/slave_multirobot) in slave robot
 
## Environment and device

- motion capture -- Optitrack
- platform -- ros kinetic

## Requirement 

#### For master telegram operator

> sudo pip install pynput

## Configuration
Before run the launch file, you should allocate the ROS_MASTER_URI, ROS_HOSTNAME, ROS_IP for this master robot(in .zshrc or .bashrc)

template:

> echo "export ROS_MASTER_URI=http://localhost_ip:11311" >> ~/.zshrc   
> echo "export ROS_HOSTNAME=localhost_ip" >> ~/.zshrc  
> echo "export ROS_IP=localhost_ip" >> ~/.zshrc   
> source ~/.zshrc  

example:
- In .zshrc or .bashrc:

    - export ROS_MASTER_URI=http://192.168.0.111:11311  
    - export ROS_HOSTNAME=192.168.0.111  
    - export ROS_IP=192.168.0.111

## Run 
**Attention**: All the slave robots and master should connect to the same ros master. 
               Our system is currently capable to perform collision avoidance and navigation for 10 slave robots at the same time. If you want to control more than 10 robots, you need to add new my_inc0[X].sh file.

1. Control the multiple slave robots by keyboard

> roslaunch master_teleop master_keyboard.launch 

2. Make the slave robots automaticly navigate to the target position.

> roslaunch rvo_turtlebot_exp.launch

3. Reset the target position of the slave robots

> 

4. Run the multi_robot simulation in gazebo

>



