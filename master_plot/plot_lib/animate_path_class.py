import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation

x_data = [[] for i in range(20)]
y_data = [[] for i in range(20)]

data_1d_list = [[] for i in range(20)]
x_arrange = [[] for i in range(20)]
'''
parameter: 
    keep: whether keep the past trajectory 

'''

fmt_list = ['b-', 'g-', 'r-', 'c-', 'm-', 'y-', 'k-', 'w-']

class animate_path:

    def __init__(self, fig, ax, num_agent, name='', keep = False,line_len = 20, window_len = 500, interval=3, mode='2d'):

        # plt property
        self.fig = fig
        self.ax = ax
        self.num_agent = num_agent

        if mode=='2d':
            self.line_list = [self.ax.plot([], [], 'r-')[0] for i in range(self.num_agent)]
            self.point_list = [self.ax.plot(0, 0, 'ok', markersize=5)[0] for i in range(self.num_agent)]

        if mode == '1d':
            self.line_1d_list =  [self.ax.plot([], [], label= name + 'toAnchor {}'.format(i))[0] for i in range(self.num_agent)]
        
        self.interval = interval   # speed
        self.line_len = line_len
        self.window_len = window_len

        self.keep = keep
         
        # new coordinate
        self.coordinate_list = [[0, 0] for i in range(self.num_agent)]
        self.data_1d = [[] for i in range(self.num_agent)]

        self.mode = mode

    def update_coordinate(self, coordinate_list):
        self.coordinate_list = coordinate_list

    def update_data_1d(self, data_1d):
        self.data_1d = data_1d

    def ani_plot(self):

        self.anim = animation.FuncAnimation(
            self.fig, self.animate, init_func=self.init_ani, interval=self.interval, save_count=50)

    def init_ani(self):

        if self.mode == '2d':
            
            # self.ax.clear()
            self.ax.set_xlim(0, 10)
            self.ax.set_ylim(0, 10)

        elif self.mode == '1d':     
            # self.ax.margins(2, 2)
            # self.ax.set_xlim(0, 1000)
            self.ax.set_ylim(4, 12, auto=True)
            self.ax.set_xlim(0, self.window_len)
            self.ax.legend(loc='upper left')
            # self.ax.autoscale(True)
            # self.ax.set_ylim(5, 9)

            # return self.line_1d_list

    def animate(self, j):

        if self.mode == '2d':
            for i in range(self.num_agent):
                
                xp = self.coordinate_list[i][0]
                yp = self.coordinate_list[i][1]

                x_data[i].append(xp)
                y_data[i].append(yp)

                if len(x_data[i]) > self.line_len and self.keep == False:
                    x_data[i].pop(0)
                    y_data[i].pop(0)
                         
                self.line_list[i].set_data(x_data[i], y_data[i])
                self.point_list[i].set_data(xp, yp)

        elif self.mode == '1d':
            
            for i in range(self.num_agent):
                
                data_one = self.data_1d[i]

                data_1d_list[i].append(data_one)

                x_arrange[i].append(j)

                if (len(x_arrange) > self.window_len):
                    x_arrange[i].pop(0)
                    data_1d_list[i].pop(0)

                # self.ax.plot(x_arrange[i], data_1d_list[i], 'g-')
                if (j > self.window_len):
                    self.ax.set_xlim(j - self.window_len + 20 , j + 20)

                self.line_1d_list[i].set_data(x_arrange[i], data_1d_list[i])

            # window_len = np.arange(j, j+1000)

            # self.ax.set_xticklabels(window_len)
                



