;; Auto-generated. Do not edit!


(when (boundp 'master_msg::tag_t)
  (if (not (find-package "MASTER_MSG"))
    (make-package "MASTER_MSG"))
  (shadow 'tag_t (find-package "MASTER_MSG")))
(unless (find-package "MASTER_MSG::TAG_T")
  (make-package "MASTER_MSG::TAG_T"))

(in-package "ROS")
;;//! \htmlinclude tag_t.msg.html


(defclass master_msg::tag_t
  :super ros::object
  :slots (_id _position _anchors ))

(defmethod master_msg::tag_t
  (:init
   (&key
    ((:id __id) 0)
    ((:position __position) (instance master_msg::vector3d_t :init))
    ((:anchors __anchors) (let (r) (dotimes (i 4) (push (instance master_msg::tag_to_anchor_dis_t :init) r)) r))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _position __position)
   (setq _anchors __anchors)
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
  (:anchors
   (&rest __anchors)
   (if (keywordp (car __anchors))
       (send* _anchors __anchors)
     (progn
       (if __anchors (setq _anchors (car __anchors)))
       _anchors)))
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; master_msg/vector3d_t _position
    (send _position :serialization-length)
    ;; master_msg/tag_to_anchor_dis_t[4] _anchors
    (apply #'+ (send-all _anchors :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; master_msg/vector3d_t _position
       (send _position :serialize s)
     ;; master_msg/tag_to_anchor_dis_t[4] _anchors
     (dolist (elem _anchors)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; master_msg/vector3d_t _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; master_msg/tag_to_anchor_dis_t[4] _anchors
   (dotimes (i 4)
     (send (elt _anchors i) :deserialize buf ptr-) (incf ptr- (send (elt _anchors i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get master_msg::tag_t :md5sum-) "4358caa9602ca48b1d884eff71f8bc31")
(setf (get master_msg::tag_t :datatype-) "master_msg/tag_t")
(setf (get master_msg::tag_t :definition-)
      "uint8 id
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



(provide :master_msg/tag_t "4358caa9602ca48b1d884eff71f8bc31")


