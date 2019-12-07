;; Auto-generated. Do not edit!


(when (boundp 'master_msg::node_frame2)
  (if (not (find-package "MASTER_MSG"))
    (make-package "MASTER_MSG"))
  (shadow 'node_frame2 (find-package "MASTER_MSG")))
(unless (find-package "MASTER_MSG::NODE_FRAME2")
  (make-package "MASTER_MSG::NODE_FRAME2"))

(in-package "ROS")
;;//! \htmlinclude node_frame2.msg.html


(defclass master_msg::node_frame2
  :super ros::object
  :slots (_role _id _systemTime _position _eop _velocity _distances _imuGyro _imuAcc _angle _quaternions _supplyVoltage _nodes ))

(defmethod master_msg::node_frame2
  (:init
   (&key
    ((:role __role) 0)
    ((:id __id) 0)
    ((:systemTime __systemTime) 0)
    ((:position __position) (instance master_msg::vector3d_t :init))
    ((:eop __eop) (instance master_msg::vector3d_t :init))
    ((:velocity __velocity) (instance master_msg::vector3d_t :init))
    ((:distances __distances) (make-array 8 :initial-element 0.0 :element-type :float))
    ((:imuGyro __imuGyro) (instance master_msg::vector3d_t :init))
    ((:imuAcc __imuAcc) (instance master_msg::vector3d_t :init))
    ((:angle __angle) (instance master_msg::vector3d_t :init))
    ((:quaternions __quaternions) (make-array 4 :initial-element 0.0 :element-type :float))
    ((:supplyVoltage __supplyVoltage) 0.0)
    ((:nodes __nodes) (let (r) (dotimes (i 0) (push (instance master_msg::node2_t :init) r)) r))
    )
   (send-super :init)
   (setq _role (round __role))
   (setq _id (round __id))
   (setq _systemTime (round __systemTime))
   (setq _position __position)
   (setq _eop __eop)
   (setq _velocity __velocity)
   (setq _distances __distances)
   (setq _imuGyro __imuGyro)
   (setq _imuAcc __imuAcc)
   (setq _angle __angle)
   (setq _quaternions __quaternions)
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
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:eop
   (&rest __eop)
   (if (keywordp (car __eop))
       (send* _eop __eop)
     (progn
       (if __eop (setq _eop (car __eop)))
       _eop)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:distances
   (&optional __distances)
   (if __distances (setq _distances __distances)) _distances)
  (:imuGyro
   (&rest __imuGyro)
   (if (keywordp (car __imuGyro))
       (send* _imuGyro __imuGyro)
     (progn
       (if __imuGyro (setq _imuGyro (car __imuGyro)))
       _imuGyro)))
  (:imuAcc
   (&rest __imuAcc)
   (if (keywordp (car __imuAcc))
       (send* _imuAcc __imuAcc)
     (progn
       (if __imuAcc (setq _imuAcc (car __imuAcc)))
       _imuAcc)))
  (:angle
   (&rest __angle)
   (if (keywordp (car __angle))
       (send* _angle __angle)
     (progn
       (if __angle (setq _angle (car __angle)))
       _angle)))
  (:quaternions
   (&optional __quaternions)
   (if __quaternions (setq _quaternions __quaternions)) _quaternions)
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
    ;; master_msg/vector3d_t _position
    (send _position :serialization-length)
    ;; master_msg/vector3d_t _eop
    (send _eop :serialization-length)
    ;; master_msg/vector3d_t _velocity
    (send _velocity :serialization-length)
    ;; float32[8] _distances
    (* 4    8)
    ;; master_msg/vector3d_t _imuGyro
    (send _imuGyro :serialization-length)
    ;; master_msg/vector3d_t _imuAcc
    (send _imuAcc :serialization-length)
    ;; master_msg/vector3d_t _angle
    (send _angle :serialization-length)
    ;; float32[4] _quaternions
    (* 4    4)
    ;; float32 _supplyVoltage
    4
    ;; master_msg/node2_t[] _nodes
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
     ;; master_msg/vector3d_t _position
       (send _position :serialize s)
     ;; master_msg/vector3d_t _eop
       (send _eop :serialize s)
     ;; master_msg/vector3d_t _velocity
       (send _velocity :serialize s)
     ;; float32[8] _distances
     (dotimes (i 8)
       (sys::poke (elt _distances i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; master_msg/vector3d_t _imuGyro
       (send _imuGyro :serialize s)
     ;; master_msg/vector3d_t _imuAcc
       (send _imuAcc :serialize s)
     ;; master_msg/vector3d_t _angle
       (send _angle :serialize s)
     ;; float32[4] _quaternions
     (dotimes (i 4)
       (sys::poke (elt _quaternions i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _supplyVoltage
       (sys::poke _supplyVoltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; master_msg/node2_t[] _nodes
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
   ;; master_msg/vector3d_t _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; master_msg/vector3d_t _eop
     (send _eop :deserialize buf ptr-) (incf ptr- (send _eop :serialization-length))
   ;; master_msg/vector3d_t _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; float32[8] _distances
   (dotimes (i (length _distances))
     (setf (elt _distances i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; master_msg/vector3d_t _imuGyro
     (send _imuGyro :deserialize buf ptr-) (incf ptr- (send _imuGyro :serialization-length))
   ;; master_msg/vector3d_t _imuAcc
     (send _imuAcc :deserialize buf ptr-) (incf ptr- (send _imuAcc :serialization-length))
   ;; master_msg/vector3d_t _angle
     (send _angle :deserialize buf ptr-) (incf ptr- (send _angle :serialization-length))
   ;; float32[4] _quaternions
   (dotimes (i (length _quaternions))
     (setf (elt _quaternions i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _supplyVoltage
     (setq _supplyVoltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; master_msg/node2_t[] _nodes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _nodes (let (r) (dotimes (i n) (push (instance master_msg::node2_t :init) r)) r))
     (dolist (elem- _nodes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get master_msg::node_frame2 :md5sum-) "2bd4695057836d171d8201257d601e34")
(setf (get master_msg::node_frame2 :datatype-) "master_msg/node_frame2")
(setf (get master_msg::node_frame2 :definition-)
      "uint8 role
uint8 id
uint32 systemTime
vector3d_t position
vector3d_t eop
vector3d_t velocity
float32[8] distances
vector3d_t imuGyro
vector3d_t imuAcc
vector3d_t angle
float32[4] quaternions
float32 supplyVoltage
node2_t[] nodes

================================================================================
MSG: master_msg/vector3d_t
float32 x
float32 y
float32 z

================================================================================
MSG: master_msg/node2_t
uint8 role
uint8 id
float32 distance
float32 fpRssi
float32 rxRssi
uint32 systemTime

")



(provide :master_msg/node_frame2 "2bd4695057836d171d8201257d601e34")


