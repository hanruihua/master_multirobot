import numpy as np
import math
from scipy import stats
from scipy.stats import multivariate_normal

class particle_filter:

    def __init__(self, particle_num, var_weight, init_range):
        self.particle_num = particle_num
        self.var_weight = var_weight
        self.particle_pos =  np.zeros((particle_num, 2))
        self.particle_angle =  np.zeros(particle_num)
        self.weight = np.ones(particle_num) / particle_num

        for i in range(self.particle_num):
            angle = i * 2 * math.pi / (self.particle_num - 1)
            self.particle_angle[i] = angle
            self.particle_pos[i, 0] = init_range * math.cos(angle)
            self.particle_pos[i, 1] = init_range * math.sin(angle)
    
    def distance(self, point):
        dis = np.sqrt(point[0] ** 2 + point[1] ** 2)
        return dis


    def particle_weight(self, cur_range):
        parti_range_diff = list(map(lambda x: self.distance(x) - cur_range, self.particle_pos))
        weight = stats.norm(0, self.var_weight).pdf(parti_range_diff)
        weight = weight / np.sum(weight)
        self.weight = weight

    def particle_weight2(self, cur_range, cur_angle):
        parti_range_diff = list(map(lambda x: self.distance(x) - cur_range, self.particle_pos))
        parti_angle_diff = list(map(lambda x: np.arctan2(x[1], x[0]) - cur_angle, self.particle_pos))

        diff_sum = list(map(lambda x, y: x + y, parti_range_diff, parti_angle_diff))
        # weight = multivariate_normal.pdf(np.array([parti_range_diff, parti_angle_diff]), mean=0, cov=0.05)
        weight = stats.norm(0, self.var_weight).pdf(diff_sum)
        weight = weight / np.sum(weight)
        self.weight = weight

    def resample(self):

        parti_num_inv = 1.0 / self.particle_num
        new_particle = []
        c = self.weight[0]
        r = np.random.random_sample() * parti_num_inv
        i = 0

        for m in range(1, self.particle_num + 1):
            U = r + (m - 1) * parti_num_inv
            while U > c:
                i = i + 1
                c = c + self.weight[i]

            new_particle.append(self.particle_pos[i, :])

        self.particle_pos = np.array(new_particle)

    def motion_particle(self, vel, time_step):
        self.particle_pos = self.particle_pos + vel * time_step
    
    def trans_angle(self):
         self.particle_angle = np.array(list(map(lambda x: np.arctan2(x[1], x[0]), self.particle_pos)))

    def reinit(self, cur_range):
        mean_angle = np.mean(self.particle_angle)
        for i in range(self.particle_num):
            angle = (i * 0.2) / (self.particle_num/10 - 1) + mean_angle - 0.1
            self.particle_pos[i, 0] = cur_range * math.cos(angle)
            self.particle_pos[i, 1] = cur_range * math.sin(angle)