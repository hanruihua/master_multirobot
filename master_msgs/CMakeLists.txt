cmake_minimum_required(VERSION 2.8)
project(master_msgs)

set(CMAKE_CXX_STANDARD 14)

find_package(catkin REQUIRED COMPONENTS
  nav_msgs
  geometry_msgs
  roscpp
  rospy
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES robohan
#  CATKIN_DEPENDS geometry_msgs nav_msgs roscpp rospy tf
  DEPENDS 
    roscpp 
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

# file(GLOB RVO_LIB_DIRS "rvo_lib/nav_rvo.cpp")

# add_library(msg_trans_turtlebot SHARED rvo_lib/nav_rvo.cpp rvo_lib/RVOSimulator.cpp rvo_lib/Agent.cpp rvo_lib/KdTree.cpp rvo_lib/Obstacle.cpp)

add_executable(msg_trans_turtlebot msg_trans_turtlebot.cpp)
target_link_libraries(msg_trans_turtlebot ${catkin_LIBRARIES})

#target_link_libraries(rvo_test RVO)
