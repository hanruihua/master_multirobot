from reciprocal_vel_obs import reciprocal_vel_obs
import numpy as np
from math import sin, cos, atan2, asin, pi, inf


class rvo_obs(reciprocal_vel_obs):

    def __init__(self, state, moving_state_list = []):
        super().__init__(state, moving_state_list)

    def config_rvo_obs(self):
        
        rvo_list = []

        for moving in self.moving_state_list:  
            rvo = self.config_rvo_obs_mode(moving)
            rvo_list.append(rvo)

        return rvo_list 

    def config_rvo_obs_mode(self, obstacle):
        
        x = self.state[0]
        y = self.state[1]
        vx = self.state[2]
        vy = self.state[3]
        r = self.state[4]
        
        mx = obstacle[0]
        my = obstacle[1]
        mvx = obstacle[2]
        mvy = obstacle[3]
        mr = obstacle[4]
            
        if mvx == 0 and mvy == 0:
            rvo_apex = [mvx, mvy]
        else:
            rvo_apex = [(vx + mvx)/2, (vy + mvy)/2]

        dis_mr = np.sqrt((my - y)**2 + (mx - x)**2)
        
        angle_mr = atan2(my - y, mx - x)
        dis_mr_rel = np.sqrt((my - y)**2 + (mx - x)**2)
        obstacle_inf = [dis_mr_rel, angle_mr]
        # obstacle_inf = [dis_mr_rel]

        if dis_mr < r + mr:
            dis_mr = r + mr

        ratio = (r + mr)/dis_mr

        half_angle = asin( ratio ) 
        line_left_ori = angle_mr + half_angle
        line_right_ori = angle_mr - half_angle

        line_left_vector = [cos(line_left_ori), sin(line_left_ori)]
        line_right_vector = [cos(line_right_ori), sin(line_right_ori)]
        
        return [rvo_apex, line_left_vector, line_right_vector, obstacle_inf]


    def config_rvo_obs2(self):

        rvo_list = []

        for moving in self.moving_state_list:  
            rvo = self.config_rvo_obs_mode2(moving)
            rvo_list.append(rvo)

        return rvo_list 

    def config_rvo_obs3(self):

        rvo_list = []

        for moving in self.moving_state_list:  
            rvo = self.config_rvo_obs_mode3(moving)
            rvo_list.append(rvo)

        return rvo_list 

    def config_rvo_obs4(self):

        rvo_list = []

        for moving in self.moving_state_list:  
            rvo = self.config_rvo_obs_mode4(moving)
            rvo_list.append(rvo)

        return rvo_list 

    def config_rvo_obs5(self, vx, vy):

        for moving in self.moving_state_list:  
            rvo = self.config_rvo_obs_mode5(moving, vx, vy)

        




    def config_rvo_obs_mode2(self, obstacle):
        
        x = self.state[0]
        y = self.state[1]
        vx = self.state[2]
        vy = self.state[3]
        r = self.state[4]
        
        mx = obstacle[0]
        my = obstacle[1]
        mvx = obstacle[2]
        mvy = obstacle[3]
        mr = obstacle[4]
            
        if mvx == 0 and mvy == 0:
            rvo_apex = [mvx, mvy]
        else:
            rvo_apex = [(vx + mvx)/2, (vy + mvy)/2]

        dis_mr = np.sqrt((my - y)**2 + (mx - x)**2)
        
        angle_mr = atan2(my - y, mx - x)
        dis_mr_rel = np.sqrt((my - y)**2 + (mx - x)**2)
        # obstacle_inf = [dis_mr_rel, angle_mr]
        obstacle_inf = [dis_mr_rel]

        if dis_mr < r + mr:
            dis_mr = r + mr

        ratio = (r + mr)/dis_mr

        half_angle = asin( ratio ) 
        line_left_ori = angle_mr + half_angle
        line_right_ori = angle_mr - half_angle

        line_left_vector = [cos(line_left_ori), sin(line_left_ori)]
        line_right_vector = [cos(line_right_ori), sin(line_right_ori)]

        rel_vector = [vx - rvo_apex[0], vy - rvo_apex[1]]

        cross_vector = self.cross_product_vector(line_left_vector, line_right_vector, rel_vector)

        rvo = cross_vector + obstacle_inf

        return rvo

    def config_rvo_obs_mode3(self, obstacle):
        
        x = self.state[0]
        y = self.state[1]
        vx = self.state[2]
        vy = self.state[3]
        r = self.state[4]
        
        mx = obstacle[0]
        my = obstacle[1]
        mvx = obstacle[2]
        mvy = obstacle[3]
        mr = obstacle[4]
            
        if mvx == 0 and mvy == 0:
            rvo_apex = [mvx, mvy]
        else:
            rvo_apex = [(vx + mvx)/2, (vy + mvy)/2]

        dis_mr = np.sqrt((my - y)**2 + (mx - x)**2)
        
        angle_mr = atan2(my - y, mx - x)
        dis_mr_rel = np.sqrt((my - y)**2 + (mx - x)**2)
        # obstacle_inf = [dis_mr_rel, angle_mr]
        obstacle_inf = [dis_mr_rel, angle_mr]

        if dis_mr < r + mr:
            dis_mr = r + mr

        ratio = (r + mr)/dis_mr

        half_angle = asin( ratio ) 
        line_left_ori = round(angle_mr + half_angle, 2)
        line_right_ori = round(angle_mr - half_angle, 2)

        line_left_vector = [cos(line_left_ori), sin(line_left_ori)]
        line_right_vector = [cos(line_right_ori), sin(line_right_ori)]

        rvo = rvo_apex + line_left_vector + line_right_vector + obstacle_inf

        return rvo

    def config_rvo_obs_mode4(self, obstacle):
        
        x = self.state[0]
        y = self.state[1]
        vx = self.state[2]
        vy = self.state[3]
        r = self.state[4]
        
        mx = obstacle[0]
        my = obstacle[1]
        mvx = obstacle[2]
        mvy = obstacle[3]
        mr = obstacle[4]
            
        if mvx == 0 and mvy == 0:
            rvo_apex = [mvx, mvy]
        else:
            rvo_apex = [(vx + mvx)/2, (vy + mvy)/2]

        dis_mr = np.sqrt((my - y)**2 + (mx - x)**2)
        
        angle_mr = atan2(my - y, mx - x)
        dis_mr_rel = np.sqrt((my - y)**2 + (mx - x)**2)
        # obstacle_inf = [dis_mr_rel, angle_mr]
        obstacle_inf = [dis_mr_rel, angle_mr]

        if dis_mr < r + mr:
            dis_mr = r + mr

        ratio = (r + mr)/dis_mr

        half_angle = asin( ratio ) 
        line_left_ori = round(angle_mr + half_angle, 2)
        line_right_ori = round(angle_mr - half_angle, 2)

        line_left_vector = [cos(line_left_ori), sin(line_left_ori)]
        line_right_vector = [cos(line_right_ori), sin(line_right_ori)]

        rvo = rvo_apex + line_left_vector + line_right_vector + obstacle_inf

        return rvo

    def config_rvo_obs_mode5(self, obstacle, vx, vy):
        
        x = self.state[0]
        y = self.state[1]
        ovx = self.state[2]
        ovy = self.state[3]
        r = self.state[4]
        
        mx = obstacle[0]
        my = obstacle[1]
        mvx = obstacle[2]
        mvy = obstacle[3]
        mr = obstacle[4]
            
        if mvx == 0 and mvy == 0:
            rvo_apex = [mvx, mvy]
        else:
            rvo_apex = [(ovx + mvx)/2, (ovy + mvy)/2]

        dis_mr = np.sqrt((my - y)**2 + (mx - x)**2)
        
        angle_mr = atan2(my - y, mx - x)
        dis_mr_rel = np.sqrt((my - y)**2 + (mx - x)**2)
        # obstacle_inf = [dis_mr_rel, angle_mr]
        obstacle_inf = [dis_mr_rel, angle_mr]

        if dis_mr < r + mr:
            dis_mr = r + mr

        ratio = (r + mr)/dis_mr

        half_angle = asin( ratio ) 
        line_left_ori = round(angle_mr + half_angle, 2)
        line_right_ori = round(angle_mr - half_angle, 2)

        line_left_vector = [cos(line_left_ori), sin(line_left_ori)]
        line_right_vector = [cos(line_right_ori), sin(line_right_ori)]

        rel_line_vector = [vx - rvo_apex[0], vy - rvo_apex[1]]

        exp_time = inf

        if self.between_vector_jud(line_left_vector, line_right_vector, rel_line_vector):
            rvo_out = False

            rel_x = x - mx
            rel_y = y - my

            # rel_vx = vx - mvx
            # rel_vy = vy - mvy

            if mvx == 0 and mvy == 0:
                rel_vx = vx 
                rel_vy = vy
            else:
                rel_vx = 2 * vx - ovx - mvx
                rel_vy = 2 * vy - ovy - mvy

            if dis_mr_rel > r + mr:
                exp_time = rvo_obs.cal_exp_tim(rel_x, rel_y, rel_vx, rel_vy, r, mr)
            else:
                exp_time = 0

        else:
            rvo_out = True

        rvo = [rvo_out, exp_time]
        return rvo

    def between_vector_jud(self, line_left_vector, line_right_vector, line_vector):

        cross_left =  super().cross_product(line_left_vector, line_vector) 
        cross_right = super().cross_product(line_right_vector, line_vector)

        if cross_left < 0 and cross_right > 0:
            return True
        
        return False

    def cross_product_vector(self, line_left_vector, line_right_vector, line_vector):

        cross_left =  super().cross_product(line_left_vector, line_vector) 
        cross_right = super().cross_product(line_right_vector, line_vector)

        return [cross_left, cross_right]

    def vo_out_pen(self, vx, vy):

        vo_flag = True
        exp_tim_min = inf

        for moving in self.moving_state_list:  
            rvo = self.config_rvo_obs_mode5(moving, vx, vy)
            rvo_out = rvo[0]
            exp_tim = rvo[1]
            if not rvo_out:
                vo_flag = False
                if exp_tim < exp_tim_min:
                    exp_tim_min = exp_tim

        return vo_flag, exp_tim_min

    @staticmethod
    def cal_exp_tim(rel_x, rel_y, rel_vx, rel_vy, r, mr):
        
        a = rel_vx ** 2 + rel_vy ** 2
        b = 2* rel_x * rel_vx + 2* rel_y * rel_vy
        c = rel_x ** 2 + rel_y ** 2 - (r + mr) ** 2

        temp = b ** 2 - 4 * a * c
        
        if temp < 0:
            t = inf
        else:
            t = ( -b + np.sqrt(b ** 2 - 4 * a * c) ) / (2 * a)
       
        return t
        
    @staticmethod
    def vo_out_cross(obs, feature_size=3):
        
        rvo_array = obs[5:]
        vo_flag = True
        min_distance = inf

        if rvo_array.shape[0] == feature_size:

            if rvo_array[0] < 0 and rvo_array[1] > 0:
                
                vo_flag = False
                distance = rvo_array[2]

                if distance < min_distance:
                    min_distance = distance 
        else:
            rvo_array_re = rvo_array.reshape(-1, feature_size)

            for rvo_cross in rvo_array_re[:, :]:
                if rvo_cross[0] < 0 and rvo_cross[1] > 0:
                    vo_flag = False
                    distance = rvo_cross[2]

                    if distance < min_distance:
                        min_distance = distance

        return vo_flag, min_distance


    @staticmethod
    def vo_out_angle(obs, state_size=6, feature_size=6):
        
        rvo_array = obs[state_size:]
        vx = obs[0] 
        vy = obs[1] 

        vo_flag = True
        min_distance = inf

        if rvo_array.shape[0] == feature_size:
            
            dis = rvo_array[4]
            cross_left, cross_right = rvo_obs.between_angle(rvo_array, vx, vy)
            
            if cross_left < 0 and cross_right > 0:
                vo_flag = False
                if dis < min_distance:
                    min_distance = dis 
        else:
            rvo_array_re = rvo_array.reshape(-1, feature_size)

            for rvo_angle in rvo_array_re[:, :]:

                dis = rvo_angle[4]
                cross_left, cross_right = rvo_obs.between_angle(rvo_angle, vx, vy)
            
                if cross_left < 0 and cross_right > 0:
                    vo_flag = False
                    if dis < min_distance:
                        min_distance = dis 

        return vo_flag, min_distance

    @staticmethod
    def vo_out_vector(obs, state_size=6, feature_size=8):
        
        rvo_array = obs[state_size:]
        vx = obs[0] 
        vy = obs[1] 

        vo_flag = True
        min_distance = inf

        if rvo_array.shape[0] == feature_size:
            
            dis = rvo_array[-2]
            cross_left, cross_right = rvo_obs.between_vector(rvo_array, vx, vy)
            
            if cross_left < 0 and cross_right > 0:
                vo_flag = False
                if dis < min_distance:
                    min_distance = dis 
        else:
            rvo_array_re = rvo_array.reshape(-1, feature_size)

            for rvo_vector in rvo_array_re[:, :]:

                dis = rvo_vector[-2]
                cross_left, cross_right = rvo_obs.between_vector(rvo_vector, vx, vy)
            
                if cross_left < 0 and cross_right > 0:
                    vo_flag = False
                    if dis < min_distance:
                        min_distance = dis 

        return vo_flag, min_distance

    @staticmethod
    def cross_product(vector1, vector2): 
        return float(vector1[0] * vector2[1] - vector2[0] * vector1[1])

    @staticmethod
    def between_angle(rvo_array, vx, vy):

        apx = rvo_array[0]
        apy = rvo_array[1]
        ori_left = rvo_array[2]
        ori_right = rvo_array[3]
        
        line_vector = [vx - apx, vy - apy]
        line_left_vector = [cos(ori_left), sin(ori_left)]
        line_right_vector = [cos(ori_right), sin(ori_right)]

        cross_left = rvo_obs.cross_product(line_left_vector, line_vector) 
        cross_right = rvo_obs.cross_product(line_right_vector, line_vector) 

        return cross_left, cross_right

    @staticmethod
    def between_vector(rvo_array, vx, vy):

        apx = rvo_array[0]
        apy = rvo_array[1]
        
        line_vector = [vx - apx, vy - apy]

        line_left_vector = rvo_array[2:4]
        line_right_vector = rvo_array[4:6]

        cross_left = rvo_obs.cross_product(line_left_vector, line_vector) 
        cross_right = rvo_obs.cross_product(line_right_vector, line_vector) 

        return cross_left, cross_right