import numpy as np
from math import sin, cos, pi, atan2



def relative(point1, point2):

    dis = np.sqrt( (point1[0] - point2[0])**2 + (point1[1] - point2[1])**2 )

    return dis

def check_collision(point_list, new_point, range):

        for point in point_list:
            dis = relative(point, new_point)
            if dis < range:
                return False
            
        return True

def random_start_goal(interval = 1, upper = 8, lower = 0, right=14):

        num = self.num_robot
        random_list = []

        for i in range(2 * num):

            new_point = np.random.uniform(low = [lower, lower], high = [right, upper], size = (2,))

            while not check_collision(random_list, new_point, interval):
                new_point = np.random.uniform(low = [lower, lower], high = [right, upper], size = (2,))

            random_list.append(new_point)

        start_list = random_list[0 : num]
        goal_list = random_list[num : 2 * num]
        start_bear_list = np.random.uniform(low = -pi, high = pi, size = (num, 1))

        return start_list, goal_list, start_bear_list


def start_goal_list(num_robot=10, mode = 3, interval = 1, upper = 8, lower = 0, left=0, right=14, circle_point=[5, 5], radius = 4):

    if mode == 2:
        random_list=[]
        count = 0
        for i in range(num_robot):
            new_point = np.random.uniform(low = [lower, lower], high = [right, upper], size = (2,))

            while not check_collision(random_list, new_point, interval):
                count += 1

                if count > 100:
                    print('loop in random point')
                    break
                    
                new_point = np.random.uniform(low = [lower, lower], high = [right, upper], size = (2,))

            count = 0

            random_list.append(new_point)
        
        return random_list

    if mode == 3:

        theta_step = 2*pi / num_robot
        theta = 0
        start_list = []
        goal_list = []

        while theta < 2*pi:

            start_x = circle_point[0] + cos(theta) * radius
            start_y = circle_point[1] + sin(theta) * radius

            goal_x = circle_point[0] + cos(theta+pi) * radius
            goal_y = circle_point[1] + sin(theta+pi) * radius

            start_list.append([start_x, start_y])
            goal_list.append([goal_x, goal_y])

            theta = theta + theta_step

        return start_list, goal_list

def cal_des_omni(position, goal_position, v_max):

	dif_x = goal_position[0] - position[0]
	dif_y = goal_position[1] - position[1]

	dis = np.sqrt( dif_x**2 + dif_y**2 )
	radian = atan2(dif_y, dif_x)

	if dis > 0.2:
		vx = v_max * cos(radian)
		vy = v_max * sin(radian)

	else:
		vx = 0
		vy = 0
	
	return vx, vy

def cal_yaw(quater):

	x = quater.x
	y = quater.y
	z = quater.z
	w = quater.w

	yaw = atan2(2 * (w * z + x * y), 1 - 2 * (pow(z, 2) + pow(y, 2)))

	return yaw

def omni2diff(vel_x, vel_y, robot_radians, guarantee_time = 0.2, tolerance = 0.15):

	speed = np.sqrt(vel_x ** 2 + vel_y ** 2)
	vel_radians = atan2(vel_y, vel_x)
	
	diff_radians = robot_radians - vel_radians

	if diff_radians > pi:
		diff_radians = diff_radians - 2*pi
	elif diff_radians < -pi:
		diff_radians = diff_radians + 2*pi

	if diff_radians < tolerance and diff_radians > -tolerance:
		w = 0
	else:
		w = -diff_radians / guarantee_time
		if w > w_max:
			w = w_max
		
	v = speed * cos(diff_radians)

	if v<0:
		v = 0
	
	if speed == 0:
		v = 0
		w = 0

	return v, w

def load_policy(filename, std_factor=1):

    model = torch.load(filename)
    model.eval()
    def get_action(x):
        with torch.no_grad():
            x = torch.as_tensor(x, dtype=torch.float32)
            action = model.act(x, factor=std_factor)
        return action

    return get_action


