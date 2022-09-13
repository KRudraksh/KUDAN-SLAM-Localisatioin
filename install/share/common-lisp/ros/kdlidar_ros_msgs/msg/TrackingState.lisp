; Auto-generated. Do not edit!


(cl:in-package kdlidar_ros_msgs-msg)


;//! \htmlinclude TrackingState.msg.html

(cl:defclass <TrackingState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (tracking_state
    :reader tracking_state
    :initarg :tracking_state
    :type cl:fixnum
    :initform 0)
   (msg
    :reader msg
    :initarg :msg
    :type cl:string
    :initform ""))
)

(cl:defclass TrackingState (<TrackingState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrackingState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrackingState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kdlidar_ros_msgs-msg:<TrackingState> is deprecated: use kdlidar_ros_msgs-msg:TrackingState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TrackingState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdlidar_ros_msgs-msg:header-val is deprecated.  Use kdlidar_ros_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'tracking_state-val :lambda-list '(m))
(cl:defmethod tracking_state-val ((m <TrackingState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdlidar_ros_msgs-msg:tracking_state-val is deprecated.  Use kdlidar_ros_msgs-msg:tracking_state instead.")
  (tracking_state m))

(cl:ensure-generic-function 'msg-val :lambda-list '(m))
(cl:defmethod msg-val ((m <TrackingState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdlidar_ros_msgs-msg:msg-val is deprecated.  Use kdlidar_ros_msgs-msg:msg instead.")
  (msg m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<TrackingState>)))
    "Constants for message type '<TrackingState>"
  '((:INITIALISING . 1)
    (:TRACKING . 2)
    (:LOST . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'TrackingState)))
    "Constants for message type 'TrackingState"
  '((:INITIALISING . 1)
    (:TRACKING . 2)
    (:LOST . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrackingState>) ostream)
  "Serializes a message object of type '<TrackingState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tracking_state)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrackingState>) istream)
  "Deserializes a message object of type '<TrackingState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tracking_state)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrackingState>)))
  "Returns string type for a message object of type '<TrackingState>"
  "kdlidar_ros_msgs/TrackingState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrackingState)))
  "Returns string type for a message object of type 'TrackingState"
  "kdlidar_ros_msgs/TrackingState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrackingState>)))
  "Returns md5sum for a message object of type '<TrackingState>"
  "24ce8050df75d306a134249a22b4b324")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrackingState)))
  "Returns md5sum for a message object of type 'TrackingState"
  "24ce8050df75d306a134249a22b4b324")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrackingState>)))
  "Returns full string definition for message of type '<TrackingState>"
  (cl:format cl:nil "# Tracking state from kdlidar~%~%# System is currently initialising / in need of initialisation~%uint8 INITIALISING = 1~%# Tracking is happening~%uint8 TRACKING = 2~%# Tracking is lost - relocalisation required~%uint8 LOST = 3~%~%~%Header header~%uint8 tracking_state~%string msg~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrackingState)))
  "Returns full string definition for message of type 'TrackingState"
  (cl:format cl:nil "# Tracking state from kdlidar~%~%# System is currently initialising / in need of initialisation~%uint8 INITIALISING = 1~%# Tracking is happening~%uint8 TRACKING = 2~%# Tracking is lost - relocalisation required~%uint8 LOST = 3~%~%~%Header header~%uint8 tracking_state~%string msg~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrackingState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4 (cl:length (cl:slot-value msg 'msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrackingState>))
  "Converts a ROS message object to a list"
  (cl:list 'TrackingState
    (cl:cons ':header (header msg))
    (cl:cons ':tracking_state (tracking_state msg))
    (cl:cons ':msg (msg msg))
))
