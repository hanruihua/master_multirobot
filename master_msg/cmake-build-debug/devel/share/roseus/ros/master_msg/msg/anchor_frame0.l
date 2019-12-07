;; Auto-generated. Do not edit!


(when (boundp 'master_msg::anchor_frame0)
  (if (not (find-package "MASTER_MSG"))
    (make-package "MASTER_MSG"))
  (shadow 'anchor_frame0 (find-package "MASTER_MSG")))
(unless (find-package "MASTER_MSG::ANCHOR_FRAME0")
  (make-package "MASTER_MSG::ANCHOR_FRAME0"))

(in-package "ROS")
;;//! \htmlinclude anchor_frame0.msg.html


(defclass master_msg::anchor_frame0
  :super ros::object
  :slots (_id _supplyVoltage _systemTime _tags ))

(defmethod master_msg::anchor_frame0
  (:init
   (&key
    ((:id __id) 0)
    ((:supplyVoltage __supplyVoltage) 0.0)
    ((:systemTime __systemTime) 0)
    ((:tags __tags) (let (r) (dotimes (i 0) (push (instance master_msg::tag_t :init) r)) r))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _supplyVoltage (float __supplyVoltage))
   (setq _systemTime (round __systemTime))
   (setq _tags __tags)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:supplyVoltage
   (&optional __supplyVoltage)
   (if __supplyVoltage (setq _supplyVoltage __supplyVoltage)) _supplyVoltage)
  (:systemTime
   (&optional __systemTime)
   (if __systemTime (setq _systemTime __systemTime)) _systemTime)
  (:tags
   (&rest __tags)
   (if (keywordp (car __tags))
       (send* _tags __tags)
     (progn
       (if __tags (setq _tags (car __tags)))
       _tags)))
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; float32 _supplyVoltage
    4
    ;; uint32 _systemTime
    4
    ;; master_msg/tag_t[] _tags
    (apply #'+ (send-all _tags :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; float32 _supplyVoltage
       (sys::poke _supplyVoltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _systemTime
       (write-long _systemTime s)
     ;; master_msg/tag_t[] _tags
     (write-long (length _tags) s)
     (dolist (elem _tags)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _supplyVoltage
     (setq _supplyVoltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _systemTime
     (setq _systemTime (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; master_msg/tag_t[] _tags
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tags (let (r) (dotimes (i n) (push (instance master_msg::tag_t :init) r)) r))
     (dolist (elem- _tags)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get master_msg::anchor_frame0 :md5sum-) "2256282624134041b30a05c8a25f1684")
(setf (get master_msg::anchor_frame0 :datatype-) "master_msg/anchor_frame0")
(setf (get master_msg::anchor_frame0 :definition-)
      "uint8 id
float32 supplyVoltage
uint32 systemTime
tag_t[] tags


================================================================================
MSG: master_msg/tag_t
uint8 id
vector3d_t position
tag_to_anchor_dis_t[4] anchors

================================================================================
MSG: master_msg/vector3d_t
float32 x
float32 y
float32 z

================================================================================
MSG: master_msg/tag_to_anchor_dis_t
uint8 id
float32 distance

")



(provide :master_msg/anchor_frame0 "2256282624134041b30a05c8a25f1684")


