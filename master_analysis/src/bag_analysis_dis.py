import rosbag
import matplotlib.pyplot as plt
import numpy as np
from scipy import interpolate 
import time
from scipy.ndimage import gaussian_filter1d
from tempfile import TemporaryFile

def convolution_window(x, window_len=11, window='hanning'):

    #  """smooth the data using a window with requested size.
    
    # This method is based on the convolution of a scaled window with the signal.
    # The signal is prepared by introducing reflected copies of the signal 
    # (with the window size) in both ends so that transient parts are minimized
    # in the begining and end part of the output signal.
    
    # input:
    #     x: the input signal 
    #     window_len: the dimension of the smoothing window; should be an odd integer
    #     window: the type of window from 'flat', 'hanning', 'hamming', 'bartlett', 'blackman'
    #         flat window will produce a moving average smoothing.

    # output:
    #     the smoothed signal
        
    # example:

    # t=linspace(-2,2,0.1)
    # x=sin(t)+randn(len(t))*0.1
    # y=smooth(x)
    
    # see also: 
    
    # numpy.hanning, numpy.hamming, numpy.bartlett, numpy.blackman, numpy.convolve
    # scipy.signal.lfilter
 
    # TODO: the window parameter could be the window itself if an array instead of a string
    # NOTE: length(output) != length(input), to correct this: return y[(window_len/2-1):-(window_len/2)] instead of just y.
    # """

    if x.ndim != 1:
        raise ValueError("smooth only accepts 1 dimension arrays.")

    if x.size < window_len:
        raise ValueError("Input vector needs to be bigger than window size.")

    if window_len<3:
        return x

    if not window in ['flat', 'hanning', 'hamming', 'bartlett', 'blackman']:
        raise ValueError("Window is on of 'flat', 'hanning', 'hamming', 'bartlett', 'blackman'")

    s=np.r_[x[window_len-1:0:-1],x,x[-2:-window_len-1:-1]]
    print()
    # s = x
    #print(len(s))
    if window == 'flat': #moving average
        w=np.ones(window_len,'d')
    else:
        w=eval('np.'+window+'(window_len)')

    y=np.convolve(w/w.sum(),s,mode='valid')
    return y


def smooth_curve2d(xp, yp):

    #delete the duplicated value
    okay = np.where(np.abs(np.diff(xp)) + np.abs(np.diff(yp)) > 0)
    xp = np.r_[xp[okay], xp[-1]]
    yp = np.r_[yp[okay], yp[-1]]

    # cut off the weird part
    jump = np.sqrt(np.diff(xp)**2 + np.diff(yp)**2) 
    smooth_jump = gaussian_filter1d(jump, 5, mode='wrap') 
    limit = 2* np.median(smooth_jump)

    xn, yn = xp[:-1], yp[:-1]
    xn = xn[(jump > 0) & (smooth_jump < limit)]
    yn = yn[(jump > 0) & (smooth_jump < limit)]

    return xn, yn

def plot_dis_list(agent_dis, name):

    agent_dis_smooth = []
    for distance in agent_dis:

        x_arrange = np.arange(len(distance))
        distance = np.array(distance)

        # distance_smooth = convolution_window(distance, 1)
        # agent_dis_smooth.append(distance_smooth)
        # x_arrange_smooth = np.arange(len(distance_smooth))

        plt.plot(x_arrange,distance, label=name)
        # plt.plot(x_arrange_smooth, distance_smooth, label='smooth_'+name)
    
    # np.save(name, np.array(agent_dis))
    # np.save(name+'smooth', np.array(agent_dis_smooth))

bag = rosbag.Bag("/home/han/catkin_ws/src/master_multirobot/record/static2020-01-08-17-45-20.bag")
#bag = rosbag.Bag("/home/han/catkin_ws/src/master_multirobot/record/dyna_2020-01-08-17-47-22.bag")

agent_uwb = bag.read_messages(topics=['/agent1/nlink_linktrack_nodeframe2'])
    
agent1_dis = [[] for i in range(4)]
agent2_dis = [[] for i in range(4)]
agent3_dis = [[] for i in range(4)]
agent4_dis = [[] for i in range(4)]

for topic, msg, t in agent_uwb:
    
    if (topic == "/agent1/nlink_linktrack_nodeframe2"):
        for j in range(len(msg.nodes)): 
           distance = msg.nodes[j].distance
           agent1_dis[j].append(distance)

    if (topic == "/agent2/nlink_linktrack_nodeframe2"):
        for j in range(len(msg.nodes)): 
           distance = msg.nodes[j].distance
           agent2_dis[j].append(distance)

    if (topic == "/agent3/nlink_linktrack_nodeframe2"):
        for j in range(len(msg.nodes)): 
           distance = msg.nodes[j].distance
           agent3_dis[j].append(distance)
    
    if (topic == "/agent4/nlink_linktrack_nodeframe2"):
        for j in range(len(msg.nodes)): 
           distance = msg.nodes[j].distance
           agent4_dis[j].append(distance)

plot_dis_list(agent1_dis, 'agent1_dis')
plot_dis_list(agent2_dis, 'agent2_dis')
plot_dis_list(agent3_dis, 'agent3_dis')
plot_dis_list(agent4_dis, 'agent4_dis')

plt.legend()
plt.show()
bag.close()


