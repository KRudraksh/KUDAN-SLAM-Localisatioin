;; Auto-generated. Do not edit!


(when (boundp 'kdlidar_ros_msgs::SaveMap)
  (if (not (find-package "KDLIDAR_ROS_MSGS"))
    (make-package "KDLIDAR_ROS_MSGS"))
  (shadow 'SaveMap (find-package "KDLIDAR_ROS_MSGS")))
(unless (find-package "KDLIDAR_ROS_MSGS::SAVEMAP")
  (make-package "KDLIDAR_ROS_MSGS::SAVEMAP"))
(unless (find-package "KDLIDAR_ROS_MSGS::SAVEMAPREQUEST")
  (make-package "KDLIDAR_ROS_MSGS::SAVEMAPREQUEST"))
(unless (find-package "KDLIDAR_ROS_MSGS::SAVEMAPRESPONSE")
  (make-package "KDLIDAR_ROS_MSGS::SAVEMAPRESPONSE"))

(in-package "ROS")





(defclass kdlidar_ros_msgs::SaveMapRequest
  :super ros::object
  :slots (_name ))

(defmethod kdlidar_ros_msgs::SaveMapRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass kdlidar_ros_msgs::SaveMapResponse
  :super ros::object
  :slots (_success ))

(defmethod kdlidar_ros_msgs::SaveMapResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass kdlidar_ros_msgs::SaveMap
  :super ros::object
  :slots ())

(setf (get kdlidar_ros_msgs::SaveMap :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get kdlidar_ros_msgs::SaveMap :datatype-) "kdlidar_ros_msgs/SaveMap")
(setf (get kdlidar_ros_msgs::SaveMap :request) kdlidar_ros_msgs::SaveMapRequest)
(setf (get kdlidar_ros_msgs::SaveMap :response) kdlidar_ros_msgs::SaveMapResponse)

(defmethod kdlidar_ros_msgs::SaveMapRequest
  (:response () (instance kdlidar_ros_msgs::SaveMapResponse :init)))

(setf (get kdlidar_ros_msgs::SaveMapRequest :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get kdlidar_ros_msgs::SaveMapRequest :datatype-) "kdlidar_ros_msgs/SaveMapRequest")
(setf (get kdlidar_ros_msgs::SaveMapRequest :definition-)
      "string name
---
bool success
")

(setf (get kdlidar_ros_msgs::SaveMapResponse :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get kdlidar_ros_msgs::SaveMapResponse :datatype-) "kdlidar_ros_msgs/SaveMapResponse")
(setf (get kdlidar_ros_msgs::SaveMapResponse :definition-)
      "string name
---
bool success
")



(provide :kdlidar_ros_msgs/SaveMap "d08a3b641c2f8680fbdfb1ea2e17a3e1")


