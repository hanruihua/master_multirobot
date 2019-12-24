# Multiple Robots Master
The program of multiple robot platform running in master computer

Please run the [Slave program](https://github.com/hanruihua/slave_multirobot) in slave robot
 
## Test Environment

- system -- ubuntu 16.06
- platform -- ros kinetic/melodic

## Installation

### requirement

turtlebot package

> sudo apt-get update  
> sudo apt-get install ros-kinetic-turtlebot ros-kinetic-turtlebot-apps ros-kinetic-turtlebot-interactions ros-kinetic-turtlebot-simulator ros-kinetic-kobuki-ftdi ros-kinetic-rocon-* ros-kinetic-ar-track-alvar-msgs  

keyboard control:
> sudo pip install pynput

build
> cd ~/catkin_ws/src  
> git clone https://github.com/hanruihua/master_multirobot.git --recursive 
> cd ~/catkin_ws  
> catkin_make  


### Configuration
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

keyboard telecontrol  
> roslaunch master_teleop multi_keyboard.launch  

simulation  

- omnidirectional(rvo)  
> roslaunch master_simulation rvo_agent_gazebo.launch  

- differential(rvo)  
> roslaunch master_simulation rvo_turtlebot_gazebo.launch  

rvo experiment (turtlebot should run the [slave robot program](https://github.com/hanruihua/slave_multirobot.git))  
> roslaunch master_launch rvo_turtlebot_exp.launch  






