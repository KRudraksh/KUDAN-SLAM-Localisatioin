;; Auto-generated. Do not edit!


(when (boundp 'kdlidar_ros_msgs::TrackingState)
  (if (not (find-package "KDLIDAR_ROS_MSGS"))
    (make-package "KDLIDAR_ROS_MSGS"))
  (shadow 'TrackingState (find-package "KDLIDAR_ROS_MSGS")))
(unless (find-package "KDLIDAR_ROS_MSGS::TRACKINGSTATE")
  (make-package "KDLIDAR_ROS_MSGS::TRACKINGSTATE"))

(in-package "ROS")
;;//! \htmlinclude TrackingState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*INITIALISING*" (find-package "KDLIDAR_ROS_MSGS::TRACKINGSTATE"))
(shadow '*INITIALISING* (find-package "KDLIDAR_ROS_MSGS::TRACKINGSTATE"))
(defconstant kdlidar_ros_msgs::TrackingState::*INITIALISING* 1)
(intern "*TRACKING*" (find-package "KDLIDAR_ROS_MSGS::TRACKINGSTATE"))
(shadow '*TRACKING* (find-package "KDLIDAR_ROS_MSGS::TRACKINGSTATE"))
(defconstant kdlidar_ros_msgs::TrackingState::*TRACKING* 2)
(intern "*LOST*" (find-package "KDLIDAR_ROS_MSGS::TRACKINGSTATE"))
(shadow '*LOST* (find-package "KDLIDAR_ROS_MSGS::TRACKINGSTATE"))
(defconstant kdlidar_ros_msgs::TrackingState::*LOST* 3)
(defclass kdlidar_ros_msgs::TrackingState
  :super ros::object
  :slots (_header _tracking_state _msg ))

(defmethod kdlidar_ros_msgs::TrackingState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:tracking_state __tracking_state) 0)
    ((:msg __msg) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _tracking_state (round __tracking_state))
   (setq _msg (string __msg))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:tracking_state
   (&optional __tracking_state)
   (if __tracking_state (setq _tracking_state __tracking_state)) _tracking_state)
  (:msg
   (&optional __msg)
   (if __msg (setq _msg __msg)) _msg)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _tracking_state
    1
    ;; string _msg
    4 (length _msg)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _tracking_state
       (write-byte _tracking_state s)
     ;; string _msg
       (write-long (length _msg) s) (princ _msg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _tracking_state
     (setq _tracking_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get kdlidar_ros_msgs::TrackingState :md5sum-) "24ce8050df75d306a134249a22b4b324")
(setf (get kdlidar_ros_msgs::TrackingState :datatype-) "kdlidar_ros_msgs/TrackingState")
(setf (get kdlidar_ros_msgs::TrackingState :definition-)
      "# Tracking state from kdlidar

# System is currently initialising / in need of initialisation
uint8 INITIALISING = 1
# Tracking is happening
uint8 TRACKING = 2
# Tracking is lost - relocalisation required
uint8 LOST = 3


Header header
uint8 tracking_state
string msg
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :kdlidar_ros_msgs/TrackingState "24ce8050df75d306a134249a22b4b324")


