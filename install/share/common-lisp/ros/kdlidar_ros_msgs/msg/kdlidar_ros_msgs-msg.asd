
(cl:in-package :asdf)

(defsystem "kdlidar_ros_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "TrackingState" :depends-on ("_package_TrackingState"))
    (:file "_package_TrackingState" :depends-on ("_package"))
  ))