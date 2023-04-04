#! /usr/bin/env python3

import rospy
from grsim_ros_bridge_msgs.msg import *
from krssg_ssl_msgs.msg import *
def callback(data):
    rospy.loginfo('cb: ' + data.data)

def runTopic():
    rospy.init_node("ball", anonymous=False)
    ball_subs = rospy.Subscriber('/vision', SSL_DetectionFrame, callback)
    ball_pub = rospy.Publisher('/ball', Ball, queue_size=10)

    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        ball_msg = Ball()
        rospy.loginfo(ball_msg)
        pub.publish()
        rate.sleep()

if __name__ == '__main__':
    try:
        runTopic()
    except rospy.ROSInterruptException:
        pass
