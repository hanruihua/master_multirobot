from math import sin, cos, pi,tan, atan2,log
import math
from itertools import groupby
from operator import itemgetter
import tf
import rospy
import numpy as np
from geometry_msgs.msg import TransformStamped
from geometry_msgs.msg import PointStamped

class distance_obj:
    def __init__(self,dis)
        self.distance[] = dis

class localmap:
    def __init__(self, height, width, resolution,morigin):
        self.height=height
        self.width=width
        self.resolution=resolution
        self.punknown=-1.0

        self.distancemap = [distance_obj]*int(self.width/self.resolution)*int(self.height/self.resolution)

        # self.localmap=[self.punknown]*int(self.width/self.resolution)*int(self.height/self.resolution)
        self.origin=int(math.ceil(morigin[0]/resolution))+int(math.ceil(width/resolution)*math.ceil(morigin[1]/resolution))
        # self.pfree=log(0.3/0.7)
        # self.pocc=log(0.9/0.1)
        # self.prior=log(0.5/0.5)
        # self.max_logodd=100.0
        # self.max_logodd_belief=10.0
        # self.max_scan_range=1.0
        self.map_origin=morigin

    def updatemap(self,dis,pose):
        x = pose[0]
        y = pose[1]
        self.distancemap[x][y] = dis

