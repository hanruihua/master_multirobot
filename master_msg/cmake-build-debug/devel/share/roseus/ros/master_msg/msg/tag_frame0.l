;; Auto-generated. Do not edit!


(when (boundp 'master_msg::tag_frame0)
  (if (not (find-package "MASTER_MSG"))
    (make-package "MASTER_MSG"))
  (shadow 'tag_frame0 (find-package "MASTER_MSG")))
(unless (find-package "MASTER_MSG::TAG_FRAME0")
  (make-package "MASTER_MSG::TAG_FRAME0"))

(in-package "ROS")
;;//! \htmlinclude tag_frame0.msg.html


(defclass master_msg::tag_frame0
  :super ros::object
  :slots (_id _position _velocity _distances _imuGyro _imuAcc _angle _quaternions _systemTime _accWorkNormal _accIsOnLine _gyroWorkNormal _gyroIsOnLine _eop _supplyVoltage ))

(defmethod master_msg::tag_frame0
  (:init
   (&key
    ((:id __id) 0)
    ((:position __position) (instance master_msg::vector3d_t :init))
    ((:velocity __velocity) (instance master_msg::vector3d_t :init))
    ((:distances __distances) (make-array 8 :initial-element 0.0 :element-type :float))
    ((:imuGyro __imuGyro) (instance master_msg::vector3d_t :init))
    ((:imuAcc __imuAcc) (instance master_msg::vector3d_t :init))
    ((:angle __angle) (instance master_msg::vector3d_t :init))
    ((:quaternions __quaternions) (make-array 4 :initial-element 0.0 :element-type :float))
    ((:systemTime __systemTime) 0)
    ((:accWorkNormal __accWorkNormal) 0)
    ((:accIsOnLine __accIsOnLine) 0)
    ((:gyroWorkNormal __gyroWorkNormal) 0)
    ((:gyroIsOnLine __gyroIsOnLine) 0)
    ((:eop __eop) (instance master_msg::vector3d_t :init))
    ((:supplyVoltage __supplyVoltage) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _position __position)
   (setq _velocity __velocity)
   (setq _distances __distances)
   (setq _imuGyro __imuGyro)
   (setq _imuAcc __imuAcc)
   (setq _angle __angle)
   (setq _quaternions __quaternions)
   (setq _systemTime (round __systemTime))
   (setq _accWorkNormal (round __accWorkNormal))
   (setq _accIsOnLine (round __accIsOnLine))
   (setq _gyroWorkNormal (round __gyroWorkNormal))
   (setq _gyroIsOnLine (round __gyroIsOnLine))
   (setq _eop __eop)
   (setq _supplyVoltage (float __supplyVoltage))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
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
  (:systemTime
   (&optional __systemTime)
   (if __systemTime (setq _systemTime __systemTime)) _systemTime)
  (:accWorkNormal
   (&optional __accWorkNormal)
   (if __accWorkNormal (setq _accWorkNormal __accWorkNormal)) _accWorkNormal)
  (:accIsOnLine
   (&optional __accIsOnLine)
   (if __accIsOnLine (setq _accIsOnLine __accIsOnLine)) _accIsOnLine)
  (:gyroWorkNormal
   (&optional __gyroWorkNormal)
   (if __gyroWorkNormal (setq _gyroWorkNormal __gyroWorkNormal)) _gyroWorkNormal)
  (:gyroIsOnLine
   (&optional __gyroIsOnLine)
   (if __gyroIsOnLine (setq _gyroIsOnLine __gyroIsOnLine)) _gyroIsOnLine)
  (:eop
   (&rest __eop)
   (if (keywordp (car __eop))
       (send* _eop __eop)
     (progn
       (if __eop (setq _eop (car __eop)))
       _eop)))
  (:supplyVoltage
   (&optional __supplyVoltage)
   (if __supplyVoltage (setq _supplyVoltage __supplyVoltage)) _supplyVoltage)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; master_msg/vector3d_t _position
    (send _position :serialization-length)
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
    ;; uint32 _systemTime
    4
    ;; uint8 _accWorkNormal
    1
    ;; uint8 _accIsOnLine
    1
    ;; uint8 _gyroWorkNormal
    1
    ;; uint8 _gyroIsOnLine
    1
    ;; master_msg/vector3d_t _eop
    (send _eop :serialization-length)
    ;; float32 _supplyVoltage
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; master_msg/vector3d_t _position
       (send _position :serialize s)
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
     ;; uint32 _systemTime
       (write-long _systemTime s)
     ;; uint8 _accWorkNormal
       (write-byte _accWorkNormal s)
     ;; uint8 _accIsOnLine
       (write-byte _accIsOnLine s)
     ;; uint8 _gyroWorkNormal
       (write-byte _gyroWorkNormal s)
     ;; uint8 _gyroIsOnLine
       (write-byte _gyroIsOnLine s)
     ;; master_msg/vector3d_t _eop
       (send _eop :serialize s)
     ;; float32 _supplyVoltage
       (sys::poke _supplyVoltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; master_msg/vector3d_t _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
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
   ;; uint32 _systemTime
     (setq _systemTime (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _accWorkNormal
     (setq _accWorkNormal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _accIsOnLine
     (setq _accIsOnLine (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gyroWorkNormal
     (setq _gyroWorkNormal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gyroIsOnLine
     (setq _gyroIsOnLine (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; master_msg/vector3d_t _eop
     (send _eop :deserialize buf ptr-) (incf ptr- (send _eop :serialization-length))
   ;; float32 _supplyVoltage
     (setq _supplyVoltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get master_msg::tag_frame0 :md5sum-) "50810e8ed732bc3be1c295ba94186d48")
(setf (get master_msg::tag_frame0 :datatype-) "master_msg/tag_frame0")
(setf (get master_msg::tag_frame0 :definition-)
      "uint8 id
vector3d_t position
vector3d_t velocity
float32[8] distances
vector3d_t imuGyro
vector3d_t imuAcc
vector3d_t angle
float32[4] quaternions
uint32 systemTime
uint8 accWorkNormal
uint8 accIsOnLine
uint8 gyroWorkNormal
uint8 gyroIsOnLine
vector3d_t eop
float32 supplyVoltage

================================================================================
MSG: master_msg/vector3d_t
float32 x
float32 y
float32 z

")



(provide :master_msg/tag_frame0 "50810e8ed732bc3be1c295ba94186d48")


