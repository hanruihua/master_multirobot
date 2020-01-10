import numpy as np
from scipy.ndimage import gaussian_filter1d

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