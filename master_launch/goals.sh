# robot number 4
## collision

3 3 3 5 5 3 5 5

5 5 5 3 3 5 3 3

# robot number 8
## collision

3 3 4.5 3 6 3 3 4.5 6 4.5 3 6 4.5 6 6 6

6 6 4.5 6 3 6 6 4.5 3 4.5 6 3 4.5 3 3 3

# robot number 12
## collision

3 2 4 2 5 2 6 2 3 3 6 3 3 4 6 4 3 5 4 5 5 5 6 5

3 5 4 5 5 5 6 5 6 3 3 3 6 4 3 4 3 2 4 2 5 2 6 2

# initiallize

2 1 3 1 4 1 5 1 6 1 7 1 2 1.5 3 1.5 4 1.5 5 1.5 6 1.5 7 1.5

# sustech

## s
rosrun rvo_ros set_goals_client default 4 7 5 7 3 7 4 5 3 6 3 5 3 3 4 3 5 3 5 4 5 5     # S

## u

rosrun rvo_ros set_goals_client default 5 6 5 7 3 7 3 4 3 6 3 5 3 3 4 3 5 3 5 4 5 5     # U

# s

rosrun rvo_ros set_goals_client default 4 7 5 7 3 7 4 5 3 6 3 5 3 3 4 3 5 3 5 4 5 5    # S

# t
rosrun rvo_ros set_goals_client default 4 7 5 7 3 7 4 5 2 7 4 6 4 3 4 4 7 2 8 2 6 7    # T

# e
rosrun rvo_ros set_goals_client default 4 7 5 7 3 7 3 4 3 6 3 5 4 3 3 3 5 3 5 5 4 5   # E

# c

rosrun rvo_ros set_goals_client default 4 7 5 7 3 7 3 4 3 6 3 5 4 3 3 3 5 3 7 2 8 2    # C

# H

rosrun rvo_ros set_goals_client default 5 6 5 7 3 7 3 4 3 6 3 5 4 5 3 3 5 3 5 4 5 5   # H