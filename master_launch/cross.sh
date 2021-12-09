sleep 5
rosrun rvo_ros set_goals_client default 2 2 2 4 2 6 6 2 6 4 6 6 5 5 3 3 #go
sleep 7
rosrun rvo_ros set_goals_client default 2 6 2 4 2 2 6 6 6 4 6 2 5 5 3 3 #go
sleep 14
rosrun rvo_ros set_goals_client default 6 2 6 4 6 6 2 2 2 4 2 6 5 5 4 3 #back
sleep 7
rosrun rvo_ros set_goals_client default 6 6 6 4 6 2 2 6 2 4 2 2 5 5 4 3 #back


