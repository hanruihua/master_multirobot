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

## Run 
**Attention**: All the slave robots and master should connect to the same ros master.

keyboard telecontrol
> roslaunch master_teleop multi_keyboard.launch

simulation

- omnidirectional(rvo)
> roslaunch master_simulation rvo_agent_gazebo.launch

- differential(rvo)
> roslaunch master_simulation rvo_turtlebot_gazebo.launch

rvo experiment (turtlebot should run the [slave robot program](https://github.com/hanruihua/slave_multirobot.git))
> roslaunch master_launch rvo_turtlebot_exp.launch





