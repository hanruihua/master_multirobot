;; Auto-generated. Do not edit!


(when (boundp 'master_msg::node2_t)
  (if (not (find-package "MASTER_MSG"))
    (make-package "MASTER_MSG"))
  (shadow 'node2_t (find-package "MASTER_MSG")))
(unless (find-package "MASTER_MSG::NODE2_T")
  (make-package "MASTER_MSG::NODE2_T"))

(in-package "ROS")
;;//! \htmlinclude node2_t.msg.html


(defclass master_msg::node2_t
  :super ros::object
  :slots (_role _id _distance _fpRssi _rxRssi _systemTime ))

(defmethod master_msg::node2_t
  (:init
   (&key
    ((:role __role) 0)
    ((:id __id) 0)
    ((:distance __distance) 0.0)
    ((:fpRssi __fpRssi) 0.0)
    ((:rxRssi __rxRssi) 0.0)
    ((:systemTime __systemTime) 0)
    )
   (send-super :init)
   (setq _role (round __role))
   (setq _id (round __id))
   (setq _distance (float __distance))
   (setq _fpRssi (float __fpRssi))
   (setq _rxRssi (float __rxRssi))
   (setq _systemTime (round __systemTime))
   self)
  (:role
   (&optional __role)
   (if __role (setq _role __role)) _role)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:fpRssi
   (&optional __fpRssi)
   (if __fpRssi (setq _fpRssi __fpRssi)) _fpRssi)
  (:rxRssi
   (&optional __rxRssi)
   (if __rxRssi (setq _rxRssi __rxRssi)) _rxRssi)
  (:systemTime
   (&optional __systemTime)
   (if __systemTime (setq _systemTime __systemTime)) _systemTime)
  (:serialization-length
   ()
   (+
    ;; uint8 _role
    1
    ;; uint8 _id
    1
    ;; float32 _distance
    4
    ;; float32 _fpRssi
    4
    ;; float32 _rxRssi
    4
    ;; uint32 _systemTime
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _role
       (write-byte _role s)
     ;; uint8 _id
       (write-byte _id s)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _fpRssi
       (sys::poke _fpRssi (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rxRssi
       (sys::poke _rxRssi (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _systemTime
       (write-long _systemTime s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _role
     (setq _role (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _fpRssi
     (setq _fpRssi (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rxRssi
     (setq _rxRssi (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _systemTime
     (setq _systemTime (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get master_msg::node2_t :md5sum-) "c3cbbfcb8abc98223a4404f5d43ad497")
(setf (get master_msg::node2_t :datatype-) "master_msg/node2_t")
(setf (get master_msg::node2_t :definition-)
      "uint8 role
uint8 id
float32 distance
float32 fpRssi
float32 rxRssi
uint32 systemTime

")



(provide :master_msg/node2_t "c3cbbfcb8abc98223a4404f5d43ad497")


