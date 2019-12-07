;; Auto-generated. Do not edit!


(when (boundp 'master_msg::node1_t)
  (if (not (find-package "MASTER_MSG"))
    (make-package "MASTER_MSG"))
  (shadow 'node1_t (find-package "MASTER_MSG")))
(unless (find-package "MASTER_MSG::NODE1_T")
  (make-package "MASTER_MSG::NODE1_T"))

(in-package "ROS")
;;//! \htmlinclude node1_t.msg.html


(defclass master_msg::node1_t
  :super ros::object
  :slots (_role _id _position ))

(defmethod master_msg::node1_t
  (:init
   (&key
    ((:role __role) 0)
    ((:id __id) 0)
    ((:position __position) (instance master_msg::vector3d_t :init))
    )
   (send-super :init)
   (setq _role (round __role))
   (setq _id (round __id))
   (setq _position __position)
   self)
  (:role
   (&optional __role)
   (if __role (setq _role __role)) _role)
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
  (:serialization-length
   ()
   (+
    ;; uint8 _role
    1
    ;; uint8 _id
    1
    ;; master_msg/vector3d_t _position
    (send _position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _role
       (write-byte _role s)
     ;; uint8 _id
       (write-byte _id s)
     ;; master_msg/vector3d_t _position
       (send _position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _role
     (setq _role (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; master_msg/vector3d_t _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;;
   self)
  )

(setf (get master_msg::node1_t :md5sum-) "42a9f741955d80d74eefc92f8a50668d")
(setf (get master_msg::node1_t :datatype-) "master_msg/node1_t")
(setf (get master_msg::node1_t :definition-)
      "uint8 role
uint8 id
vector3d_t position

================================================================================
MSG: master_msg/vector3d_t
float32 x
float32 y
float32 z

")



(provide :master_msg/node1_t "42a9f741955d80d74eefc92f8a50668d")


