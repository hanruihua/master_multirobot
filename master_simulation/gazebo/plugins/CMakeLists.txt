include_directories(${GAZEBO_INCLUDE_DIRS})
link_directories(${GAZEBO_LIBRARY_DIRS})
list(APPEND CMAKE_CXX_FLAGS "${GAZEBO_CXX_FLAGS}")

add_library(master_multi_obs SHARED world_multi_obs.cc)
target_link_libraries(master_multi_obs ${GAZEBO_LIBRARIES} ${catkin_LIBRARIES})
# add_dependencies(master_multi_obs rvo_ros_gencpp ${${PROJECT_NAME}_EXPORTED_TARGETS}  ${catkin_EXPORTED_TARGETS})
