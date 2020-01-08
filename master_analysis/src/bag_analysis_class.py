import rosbag
import matplotlib.pyplot as plt
import numpy as np
from scipy import interpolate 

class bag_analysis:
    
    def __init__(self, path):
        self.bag = rosbag.Bag(path)


    def topic_read(self, topic_name_list):
        agent1_ground = self.bag.read_messages(topics=topic_name_list)
