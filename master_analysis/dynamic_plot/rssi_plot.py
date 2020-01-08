import rospy
from master_msgs.msg import node_frame2
import matplotlib.pyplot as plt
import numpy as np
import threading

fpRssi1 = []
rxRssi1 = []
dis1 = []

fpRssi2 = []
rxRssi2 = []
dis2 = []

fpRssi3 = []
rxRssi3 = []
dis3 = []

fpRssi4 = []
rxRssi4 = []
dis4 = []

fpRssi1 = []
rxRssi1 = []
dis1 = []

x = 0
x_axis = []

px = []
py = []
dis = []
distance = 0
dis_rssi = []

def rssi_callback(data):
    global x
    global distance
    global fpRssi0
    global rxRssi0
    global x_axis

    # for i in range(4):
    #     if i == 0:
            # fpRssi0.append(data.nodes[i].fpRssi)
            # rxRssi0.append(data.nodes[i].rxRssi)
    if data.id == 2:
        # fpRssi1.append(data.nodes[0].fpRssi)
        # rxRssi1.append(data.nodes[0].rxRssi)
        dis1.append(data.nodes[0].distance)
        dis2.append(data.nodes[1].distance)
        dis3.append(data.nodes[2].distance)
        dis4.append(data.nodes[3].distance)
    
    # if data.id == 8:
    #     fpRssi2.append(data.nodes[0].fpRssi)
    #     rxRssi2.append(data.nodes[0].rxRssi)
    #     dis2.append(data.nodes[0].distance)

    # if data.id == 7:
    #     fpRssi3.append(data.nodes[0].fpRssi)
    #     rxRssi3.append(data.nodes[0].rxRssi)
    #     dis3.append(data.nodes[0].distance)

    # if data.id == 1:
    #     fpRssi4.append(data.nodes[0].fpRssi)
    #     rxRssi4.append(data.nodes[0].rxRssi)
    #     dis4.append(data.nodes[0].distance)


        # dis_rssi.append(abs(data.nodes[0].fpRssi - data.nodes[0].rxRssi))
    
    
    # if x == 1000:
    #     fpRssi0 = []
    #     rxRssi0 = []
    #     x = 0
    #     plt.clf()
    #     plt.axis([0, 1000, -90, -70])


def thread_job():
    rospy.spin()


if __name__=="__main__":

    rospy.init_node('rssi_plot')
    rospy.Subscriber('/agent1/nlink_linktrack_nodeframe2', node_frame2, rssi_callback)
    rospy.Subscriber('/agent2/nlink_linktrack_nodeframe2', node_frame2, rssi_callback)
    rospy.Subscriber('/agent3/nlink_linktrack_nodeframe2', node_frame2, rssi_callback)
    rospy.Subscriber('/agent4/nlink_linktrack_nodeframe2', node_frame2, rssi_callback)

    add_thread = threading.Thread(target = thread_job)
    add_thread.start()
    rate = rospy.Rate(10)
    plt.ylim(3,10)
    # px.append(data.position.x)
    # py = data.position.y

    # plt.plot(px, py)
    # plt.pause(0.05)

    while not rospy.is_shutdown():
        # plt.plot(x_axis, dis)
        
        # dis.append(distance)
        fp = np.copy(fpRssi1)
        rx = np.copy(rxRssi1)
        # dis_rssi_copy = np.copy(dis_rssi)
        copy1 = np.copy(dis1)
        length1 = len(copy1)
        x_axis1 = np.arange(length1)

        copy2 = np.copy(dis2)
        length2 = len(copy2)
        x_axis2 = np.arange(length2)

        copy3 = np.copy(dis3)
        copy_fpRssi3 = np.copy(fpRssi3)
        copy_rxRssi3 = np.copy(rxRssi3)
        length3 = len(copy3)
        x_axis3 = np.arange(length3)

        copy4 = np.copy(dis4)
        length4 = len(copy4)
        x_axis4 = np.arange(length4)
        
        plt.plot(x_axis1, copy1, 'r-', x_axis2, copy2, x_axis3, copy3, x_axis4, copy4)
        # plt.plot(x_axis3, copy_fpRssi3, x_axis3, copy_rxRssi3)
        # print(distance)
        plt.pause(0.01)
        
    
    







