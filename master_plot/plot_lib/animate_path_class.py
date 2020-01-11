import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation

x_data = [[] for i in range(20)]
y_data = [[] for i in range(20)]

class animate_path:

    def __init__(self, fig, ax, num_agent, keep = False,line_len = 20, interval=3):

        # plt property
        self.fig = fig
        self.ax = ax
        self.num_agent = num_agent

        self.line_list = [self.ax.plot([], [], 'r-')[0] for i in range(self.num_agent)]
        self.point_list = [self.ax.plot(0, 0, 'ok', markersize=5)[0] for i in range(self.num_agent)]
        
        self.interval = interval   # speed
        self.line_len = line_len

        self.keep = keep
         
        # new coordinate
        self.coordinate_list = [[0, 0] for i in range(self.num_agent)]

    def update_coordinate(self, coordinate_list):
        self.coordinate_list = coordinate_list

    def ani_plot(self):

        self.anim = animation.FuncAnimation(
            self.fig, self.animate, init_func=self.init_ani, interval=self.interval, save_count=50)

        plt.show()

    def init_ani(self):

        self.ax.set_xlim(0, 10)
        self.ax.set_ylim(0, 10)

        return self.line_list + self.point_list

    def animate(self, j):
        
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

        return self.line_list + self.point_list



