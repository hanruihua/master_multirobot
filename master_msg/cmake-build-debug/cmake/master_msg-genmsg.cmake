# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "master_msg: 12 messages, 0 services")

set(MSG_I_FLAGS "-Imaster_msg:/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(master_msg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg" "master_msg/tag_t:master_msg/vector3d_t:master_msg/tag_to_anchor_dis_t"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg" "master_msg/vector3d_t:master_msg/node1_t"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg" "master_msg/vector3d_t:master_msg/node2_t"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg" "master_msg/vector3d_t"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg" "master_msg/vector3d_t"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg" "master_msg/vector3d_t:master_msg/tag_to_anchor_dis_t"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg" "master_msg/node0_t"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg" NAME_WE)
add_custom_target(_master_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "master_msg" "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)
_generate_msg_cpp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
)

### Generating Services

### Generating Module File
_generate_module_cpp(master_msg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(master_msg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(master_msg_generate_messages master_msg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_cpp _master_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(master_msg_gencpp)
add_dependencies(master_msg_gencpp master_msg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS master_msg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)
_generate_msg_eus(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
)

### Generating Services

### Generating Module File
_generate_module_eus(master_msg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(master_msg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(master_msg_generate_messages master_msg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_eus _master_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(master_msg_geneus)
add_dependencies(master_msg_geneus master_msg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS master_msg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)
_generate_msg_lisp(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
)

### Generating Services

### Generating Module File
_generate_module_lisp(master_msg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(master_msg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(master_msg_generate_messages master_msg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_lisp _master_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(master_msg_genlisp)
add_dependencies(master_msg_genlisp master_msg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS master_msg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)
_generate_msg_nodejs(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
)

### Generating Services

### Generating Module File
_generate_module_nodejs(master_msg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(master_msg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(master_msg_generate_messages master_msg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_nodejs _master_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(master_msg_gennodejs)
add_dependencies(master_msg_gennodejs master_msg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS master_msg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg;/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg"
  "${MSG_I_FLAGS}"
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)
_generate_msg_py(master_msg
  "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
)

### Generating Services

### Generating Module File
_generate_module_py(master_msg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(master_msg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(master_msg_generate_messages master_msg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/anchor_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame1.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame2.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node0_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node1_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node_frame0.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/vector3d_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/system_info.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/node2_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg/tag_to_anchor_dis_t.msg" NAME_WE)
add_dependencies(master_msg_generate_messages_py _master_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(master_msg_genpy)
add_dependencies(master_msg_genpy master_msg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS master_msg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/master_msg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(master_msg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(master_msg_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/master_msg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(master_msg_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(master_msg_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/master_msg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(master_msg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(master_msg_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/master_msg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(master_msg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(master_msg_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/master_msg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(master_msg_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(master_msg_generate_messages_py geometry_msgs_generate_messages_py)
endif()
