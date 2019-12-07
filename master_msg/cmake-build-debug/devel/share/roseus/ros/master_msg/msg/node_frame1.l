;; Auto-generated. Do not edit!


(when (boundp 'master_msg::node_frame1)
  (if (not (find-package "MASTER_MSG"))
    (make-package "MASTER_MSG"))
  (shadow 'node_frame1 (find-package "MASTER_MSG")))
(unless (find-package "MASTER_MSG::NODE_FRAME1")
  (make-package "MASTER_MSG::NODE_FRAME1"))

(in-package "ROS")
;;//! \htmlinclude node_frame1.msg.html


(defclass master_msg::node_frame1
  :super ros::object
  :slots (_role _id _systemTime _supplyVoltage _nodes ))

(defmethod master_msg::node_frame1
  (:init
   (&key
    ((:role __role) 0)
    ((:id __id) 0)
    ((:systemTime __systemTime) 0)
    ((:supplyVoltage __supplyVoltage) 0.0)
    ((:nodes __nodes) (let (r) (dotimes (i 0) (push (instance master_msg::node1_t :init) r)) r))
    )
   (send-super :init)
   (setq _role (round __role))
   (setq _id (round __id))
   (setq _systemTime (round __systemTime))
   (setq _supplyVoltage (float __supplyVoltage))
   (setq _nodes __nodes)
   self)
  (:role
   (&optional __role)
   (if __role (setq _role __role)) _role)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:systemTime
   (&optional __systemTime)
   (if __systemTime (setq _systemTime __systemTime)) _systemTime)
  (:supplyVoltage
   (&optional __supplyVoltage)
   (if __supplyVoltage (setq _supplyVoltage __supplyVoltage)) _supplyVoltage)
  (:nodes
   (&rest __nodes)
   (if (keywordp (car __nodes))
       (send* _nodes __nodes)
     (progn
       (if __nodes (setq _nodes (car __nodes)))
       _nodes)))
  (:serialization-length
   ()
   (+
    ;; uint8 _role
    1
    ;; uint8 _id
    1
    ;; uint32 _systemTime
    4
    ;; float32 _supplyVoltage
    4
    ;; master_msg/node1_t[] _nodes
    (apply #'+ (send-all _nodes :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _role
       (write-byte _role s)
     ;; uint8 _id
       (write-byte _id s)
     ;; uint32 _systemTime
       (write-long _systemTime s)
     ;; float32 _supplyVoltage
       (sys::poke _supplyVoltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; master_msg/node1_t[] _nodes
     (write-long (length _nodes) s)
     (dolist (elem _nodes)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _role
     (setq _role (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _systemTime
     (setq _systemTime (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _supplyVoltage
     (setq _supplyVoltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; master_msg/node1_t[] _nodes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _nodes (let (r) (dotimes (i n) (push (instance master_msg::node1_t :init) r)) r))
     (dolist (elem- _nodes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get master_msg::node_frame1 :md5sum-) "0ed118520974e3023cb1cc203f2d31a4")
(setf (get master_msg::node_frame1 :datatype-) "master_msg/node_frame1")
(setf (get master_msg::node_frame1 :definition-)
      "uint8 role
uint8 id
uint32 systemTime
float32 supplyVoltage
node1_t[] nodes

================================================================================
MSG: master_msg/node1_t
uint8 role
uint8 id
vector3d_t position

================================================================================
MSG: master_msg/vector3d_t
float32 x
float32 y
float32 z

")



(provide :master_msg/node_frame1 "0ed118520974e3023cb1cc203f2d31a4")


