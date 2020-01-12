import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation
# a = np.array([1, 2, 3, 4, 5, 6])
# b = np.array([1,2])
# c = np.array([[1,1], [2,2], [3,3]])

# d = c[b]

# print(d)

# num_agent = 10
# fig, ax = plt.subplots()
# line = ax.plot(0, 0)[0]
# line2, = ax.plot(0, 0)
# print(line, line2)
# # line_list, = [ax.plot([], [], 'r-') for i in range(num_agent)]
# # point_list, = [ax.plot(0, 0, 'ok', markersize=5) for i in range(num_agent)]

# # line_list = [ax.plot([], [], 'r-') for i in range(num_agent)]
# # point_list = ax.plot(0, 0, 'ok', markersize=5)

# import datetime as dt
# import matplotlib.pyplot as plt
# import matplotlib.animation as animation
# from random import random

# import numpy as np
# import matplotlib.pyplot as plt
# import matplotlib.animation as animation

# x = np.linspace(0,15,100)

# fig = plt.figure()
# p1 = fig.add_subplot(111)

# p1.set_xlim([0,15])
# p1.set_ylim([0,100])

# # set up empty lines to be updates later on
# l1, = p1.plot([],[],'b')
# l2, = p1.plot([],[],'r')

# def gen1():
#     i = 0.5
#     while(True):
#         yield i
#         i += 0.1

# def gen2():
#     j = 0
#     while(True):
#         yield j
#         j += 1

# def run1(c):
#     y = c*x
#     l1.set_data(x,y)

# def run2(c):
#     y = c*x
#     l2.set_data(x,y)

# ani1 = animation.FuncAnimation(fig,run1,gen1,interval=1)
# ani2 = animation.FuncAnimation(fig,run2,gen2,interval=1)
# plt.show()


# class Animate:

#     def __init__(self, sensor):
#         # Create figure for plotting
#         self.fig = plt.figure()
#         self.ax = self.fig.add_subplot(1, 1, 1)
#         self.xs = []
#         self.ys = []
#         self.ylabel = sensor
#         self.readings = 20

#     # This function is called periodically from FuncAnimation
#     def _update(self, i):

#         # Read temperature (Celsius) from TMP102
#         temp_c = random()

#         # Add x and y to lists
#         self.xs.append(dt.datetime.now().strftime('%H:%M:%S.%f'))
#         self.ys.append(temp_c)

#         # Limit x and y lists to 20 items
#         self.xs = self.xs[-self.readings:]
#         self.ys = self.ys[-self.readings:]

#         # Draw x and y lists
#         self.ax.clear()
#         self.ax.plot(self.xs, self.ys)

#         # Format plot
#         plt.xticks(rotation=45, ha='right')
#         plt.subplots_adjust(bottom=0.30)
#         plt.title(self.ylabel + ' over Time')
#         plt.ylabel(self.ylabel)

#     def start(self):
#         print('Starting')
#         # Set up plot to call animate() function periodically
#         self.anim = animation.FuncAnimation(self.fig, self._update, interval=200)
#         plt.show()


# rand = Animate('Torque')
# rand.start()

import matplotlib.pyplot as plt
import numpy as np
import matplotlib.animation as animation

class some():
    def __init__(self):
        self.fig = plt.figure()
        self.ax = self.fig.add_subplot(111)
        self.line,  = self.ax.plot([],[], color="red", linestyle="-")
        self.scat, = self.ax.plot([],[], color="orange", marker="s", linestyle="")

        self.data = np.random.rand(1000)
        self.times = np.arange(1000)

        self.stepsize = 10
        self.showntimes = np.arange(self.stepsize)
        self.ax.set_ylim([0,1])
        self.ax.set_xlim([self.showntimes[0],self.showntimes[-1]])

        self.ani = animation.FuncAnimation(self.fig, self._upd_plot, blit=False, interval=60, repeat=False)
        plt.show()

    def _upd_plot(self,i):
        print (i)
        if i < len(self.data)-self.stepsize:
            self.scat.set_data(self.showntimes, self.data[i:i+self.stepsize])
            self.line.set_data(self.showntimes, self.data[i:i+self.stepsize].mean()*np.ones(len(self.showntimes)) )
            self.ax.set_xticklabels(self.times[i:i+self.stepsize])
        else:
            self.ani.event_source.stop()

if __name__ == '__main__':
    s = some()
