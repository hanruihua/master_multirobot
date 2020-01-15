import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation

'''
parameter: 
    keep: whether keep the past trajectory 

'''

fmt_list = ['b-', 'g-', 'r-', 'c-', 'm-', 'y-', 'k-', 'w-']

class animate_path:

    def __init__(self, fig, ax, num_agent, name='', keep = False,line_len = 20, window_len = 500, interval=1, mode='2d', ylim = [4, 12]):

        # plt property
        self.fig = fig
        self.ax = ax
        self.num_agent = num_agent

        if mode=='2d':
            self.line_list = [self.ax.plot([], [], '-', label = name + '{}'.format(i+1))[0] for i in range(self.num_agent)]
            self.point_list = [self.ax.plot(0, 0, 'o', markersize=5)[0] for i in range(self.num_agent)]
            self.x_data = [[] for i in range(20)]
            self.y_data = [[] for i in range(20)]

        if mode == '1d':
            self.line_1d_list =  [self.ax.plot([], [], label= name + '{}'.format(i))[0] for i in range(self.num_agent)]
            self.data_1d_list = [[] for i in range(20)]
            self.x_arrange = [[] for i in range(20)]

        self.interval = interval   # speed
        self.line_len = line_len
        self.window_len = window_len

        self.keep = keep
         
        # new coordinate
        self.coordinate_list = [[0, 0] for i in range(self.num_agent)]
        self.data_1d = [[] for i in range(self.num_agent)]

        self.mode = mode

        self.ylim = ylim

    def update_coordinate(self, coordinate_list):
        self.coordinate_list = coordinate_list

    def update_data_1d(self, data_1d):
        self.data_1d = data_1d

    def ani_plot(self):

        self.anim = animation.FuncAnimation(
            self.fig, self.animate, init_func=self.init_ani, interval=self.interval, save_count=50)

    def init_ani(self):

        if self.mode == '2d':
            
            self.ax.set_xlim(0, 10)
            self.ax.set_ylim(0, 10)
            self.ax.legend(loc='upper right')
            self.ax.grid()

        elif self.mode == '1d':     

            self.ax.set_ylim(self.ylim[0], self.ylim[1], auto=True)
            self.ax.set_xlim(0, self.window_len)
            self.ax.legend(loc='upper left')

    def animate(self, j):

        if self.mode == '2d':
            for i in range(self.num_agent):
                
                xp = self.coordinate_list[i][0]
                yp = self.coordinate_list[i][1]

                self.x_data[i].append(xp)
                self.y_data[i].append(yp)

                if len(self.x_data[i]) > self.line_len and self.keep == False:
                    self.x_data[i].pop(0)
                    self.y_data[i].pop(0)
                         
                self.line_list[i].set_data(self.x_data[i], self.y_data[i])
                self.point_list[i].set_data(xp, yp)

        elif self.mode == '1d':
            
            for i in range(self.num_agent):
                
                data_one = self.data_1d[i]

                self.data_1d_list[i].append(data_one)

                self.x_arrange[i].append(j)

                if (len(self.x_arrange) > self.window_len):
                    self.x_arrange[i].pop(0)
                    self.data_1d_list[i].pop(0)

                # self.ax.plot(x_arrange[i], data_1d_list[i], 'g-')
                if (j > self.window_len):
                    self.ax.set_xlim(j - self.window_len + 20 , j + 20)

                self.line_1d_list[i].set_data(self.x_arrange[i], self.data_1d_list[i])

                



