import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation
# # a = [1, 2, 3, 4, 5, 6]
# # b = [3,3,4,5]

# # # a = b

# # c = a + b
# # print(c)

# num_agent = 10
fig, ax = plt.subplots()
line = ax.plot(0, 0)[0]
line2, = ax.plot(0, 0)
print(line, line2)
# # line_list, = [ax.plot([], [], 'r-') for i in range(num_agent)]
# # point_list, = [ax.plot(0, 0, 'ok', markersize=5) for i in range(num_agent)]

# # line_list = [ax.plot([], [], 'r-') for i in range(num_agent)]
# # point_list = ax.plot(0, 0, 'ok', markersize=5)

# import datetime as dt
# import matplotlib.pyplot as plt
# import matplotlib.animation as animation
# from random import random


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