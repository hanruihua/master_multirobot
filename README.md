# Multiple Robots Master
The program of multiple robot platform running in master computer

In the real experiment, please run the [Slave program](https://github.com/hanruihua/slave_multirobot) in slave robot
 
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
> git clone https://github.com/hanruihua/master_multirobot.git  
> cd ~/catkin_ws  
> catkin_make  

planning algorithm ORCA:

> cd ~/catkin_ws/src  
> git clone https://github.com/hanruihua/rvo_ros.git  
> cd ~/catkin_ws    
> catkin_make   


### Configuration
Before run the launch file for the real experiment, you should allocate the ROS_MASTER_URI, ROS_HOSTNAME, ROS_IP for this master robot(in .zshrc or .bashrc)

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

### keyboard telecontrol  
> roslaunch master_teleop master_keyboard.launch --screen 

### simulation   

- Turtlebot(rvo)  
> roslaunch master_simulation rvo_turtlebot_gazebo2.launch  
> roslaunch master_simulation rvo2.launch   
> rosrun rvo_ros set_goals_client random 0 4 0 4  

**Note**: (1) the command of the rvo_ros should refer to the [rvo readme](https://github.com/hanruihua/rvo_ros/blob/master/readme.md)  
          (2) if there is the error like the "unused args [ROBOT_INITIAL_POSE, model]", please replace your kobuki.launch file in the path    turtlebot_simulator/turtlebot_gazebo/launch/includes by the file [kobuki.launch](https://github.com/hanruihua/master_multirobot/blob/master/master_simulation/kobuki.launch.xml)  


### real experiment

rvo real experiment (turtlebot should run the [slave robot program](https://github.com/hanruihua/slave_multirobot.git))  
> roslaunch master_launch rvo_turtlebot_exp.launch  

**Attention**: All the slave robots and master should connect to the same ros master. 
               Our system is currently capable to perform collision avoidance and navigation for 10 slave robots at the same time. If you want to control more than 10 robots, you need to add new my_inc0[X].sh file.

## Authors

**Han** - [Han](https://github.com/hanruihua)  
**Chen** - [Chen](https://github.com/chenshengduo)

## License

This project is licensed under the MIT License

