include_directories(${GAZEBO_INCLUDE_DIRS})
link_directories(${GAZEBO_LIBRARY_DIRS})
list(APPEND CMAKE_CXX_FLAGS "${GAZEBO_CXX_FLAGS}")

add_library(multi_obs SHARED world_multi_obs.cc)
target_link_libraries(multi_obs ${GAZEBO_LIBRARIES})
