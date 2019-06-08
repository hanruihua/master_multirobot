# Multiple Robots Master
The program of multiple robot running in master computer

Please run the [Master program](https://github.com/hanruihua/slave_multirobot) in slave robot
 
## Environment and device

- motion capture -- Optitrack
- platform -- ros kinetic

## Requirement 

#### For master telegram operator

> sudo pip install pynput

#### Run 
*Attention*: All the slave robots and master should connect to the same ros master. 

Control the multiple slave robots
> rosrun master_teleop multi_keyboard_py 



