# rosrun rvo_ros set_goals_client default 3 3 4.5 3 6 3 3 4.5 6 4.5 3 6 4.5 6 6 6 2 1 3 1 4 1 # init
# sleep 30

rosrun rvo_ros set_goals_client default 6 6 4.5 6 3 6 6 4.5 3 4.5 6 3 4.5 3 3 3 2 1 3 1 4 1 # init inverse
# sleep 8
# rosrun rvo_ros set_goals_client default 6 3 6 4.5 3 3 4.5 6 4.5 3 6 6 3 4.5 3 6 2 1 3 1 4 1 # init inverse
sleep 30

rosrun rvo_ros set_goals_client default 3 3 4.5 3 6 3 3 4.5 6 4.5 3 6 4.5 6 6 6 2 1 3 1 4 1 # init
sleep 30

rosrun rvo_ros set_goals_client default 4 6 5 6 3 6 4 4 3 5 3 4 3 2 4 2 5 2 5 3 5 4     # S

sleep 24

rosrun rvo_ros set_goals_client default 3 6 5 6 3 5 5 4 3 4 3 3 3 2 4 2 5 2 5 3 5 5    # U

sleep 20

rosrun rvo_ros set_goals_client default 4 6 5 6 3 6 4 4 3 5 3 4 3 2 4 2 5 2 5 3 5 4     # S

sleep 20

rosrun rvo_ros set_goals_client default 4 6 6 6 3 6 4 5 2 6 4 4 4 3 4 2 7 3 7 4 5 6   # T

sleep 20

rosrun rvo_ros set_goals_client default 4 6 5 4 3 5 3 4 3 6 3 3 4 2 3 2 5 2 4 4 5 6   # E
sleep 20

rosrun rvo_ros set_goals_client default 4 6 7 3 3 5 3 4 3 6 3 3 4 2 3 2 5 2 7 4 5 6    # C

sleep 20

rosrun rvo_ros set_goals_client default 5 5 5 4 3 5 3 4 3 6 3 3 5 3 3 2 5 2 4 4 5 6   # H
