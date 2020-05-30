#!/bin/bash
rosrun rvo_ros set_goals_client default 4 7 4 6 4 5 4 4 4 3 4 2 4 1 5 1 6 1 7 2 8 2   # init, L

sleep 10

rosrun rvo_ros set_goals_client default 4 7 5 7 3 7 4 5 3 6 3 5 3 3 4 3 5 3 5 4 5 5     # S

sleep 10

rosrun rvo_ros set_goals_client default 5 6 5 7 3 7 3 4 3 6 3 5 3 3 4 3 5 3 5 4 5 5     # U

sleep 4

rosrun rvo_ros set_goals_client default 4 7 5 7 3 7 4 5 3 6 3 5 3 3 4 3 5 3 5 4 5 5    # S

sleep 4
//
rosrun rvo_ros set_goals_client default 4 7 5 7 3 7 4 5 2 7 4 6 4 3 4 4 7 2 8 2 6 7    # T

sleep 6

rosrun rvo_ros set_goals_client default 4 7 5 7 3 7 3 4 3 6 3 5 4 3 3 3 5 3 5 5 4 5   # E

sleep 8

rosrun rvo_ros set_goals_client default 4 7 5 7 3 7 3 4 3 6 3 5 4 3 3 3 5 3 7 2 8 2    # C

sleep 6

rosrun rvo_ros set_goals_client default 5 6 5 7 3 7 3 4 3 6 3 5 4 5 3 3 5 3 5 4 5 5   # H

rosrun rvo_ros set_goals_client default 2 1 3 1 4 1 5 1 6 1 7 1 2 2 3 2 4 2 5 2 6 2    # end