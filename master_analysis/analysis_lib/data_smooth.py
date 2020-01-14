import numpy as np
from scipy.ndimage import gaussian_filter1d

class smooth_data:
    def __init__(self,input_data, mode = '1d'):

        self.input_data = input_data 
        self.mode = mode   
    
    def convolution_window_1d(self, window_len = 10, window='hanning'):

        x = np.array(self.input_data)
   
        if x.ndim != 1:
            raise ValueError("smooth only accepts 1 dimension arrays.")

        if x.size < window_len:
            raise ValueError("Input vector needs to be bigger than window size.")

        if window_len<3:
            return x

        if not window in ['flat', 'hanning', 'hamming', 'bartlett', 'blackman']:
            raise ValueError("Window is on of 'flat', 'hanning', 'hamming', 'bartlett', 'blackman'")

        s = np.r_[x[window_len-1:0:-1],x,x[-2:-window_len-1:-1]]
        # x2 = x[70:-70]
        #print(len(s))
        if window == 'flat': #moving average
            w=np.ones(window_len,'d')
        else:
            w=eval('np.'+window+'(window_len)')

        # y = np.convolve(w/w.sum(), s, mode='valid')
        y = np.convolve(w/w.sum(), x, mode='valid')

        return y

    # def smooth_curve2d(xp, yp):

    #     #delete the duplicated value
    #     okay = np.where(np.abs(np.diff(xp)) + np.abs(np.diff(yp)) > 0)
    #     xp = np.r_[xp[okay], xp[-1]]
    #     yp = np.r_[yp[okay], yp[-1]]

    #     # cut off the weird part
    #     jump = np.sqrt(np.diff(xp)**2 + np.diff(yp)**2) 
    #     smooth_jump = 
    #     (jump, 5, mode='wrap') 
    #     limit = 2* np.median(smooth_jump)

    #     xn, yn = xp[:-1], yp[:-1]
    #     xn = xn[(jump > 0) & (smooth_jump < limit)]
    #     yn = yn[(jump > 0) & (smooth_jump < limit)]

    #     return xn, yn
