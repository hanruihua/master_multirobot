import math
import numpy as np


class trans2d:

    def __init__(self, pre_points, tar_points):

        self.pre_points = pre_points
        self.tar_points = tar_points

        if (self.pre_points.shape[0] != 2 or self.tar_points.shape[0] != 2):
            print('error dimension input')

    def transform_2d(self):
  
        centroids_pre = [[np.average(self.pre_points[0, :])], [np.average(self.pre_points[1, :])]]
        centroids_tar = [[np.average(self.tar_points[0, :])], [np.average(self.tar_points[1, :])]]

        diff_pre = self.pre_points - centroids_pre
        diff_tar = self.tar_points - centroids_tar

        H = np.dot(diff_pre, np.transpose(diff_tar))

        u, s, v = np.linalg.svd(H)
        R = np.dot(v, np.transpose(u))

        if np.linalg.det(R) < 0:
            ur, sr, vr = np.linalg.svd(R)
            vr = vr[:, 1] * -1
            R = np.dot(vr, np.transpose(ur))

        T = centroids_tar - np.dot(R, centroids_pre)

        print('transition matrix')
        print(T)
        print('rotation matrix')
        print(R)
        theta = np.arcsin(R[1, 0])
        print('theta\n', theta)

        return T, R, theta                                                                                      

        