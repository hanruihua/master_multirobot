;; Auto-generated. Do not edit!


(when (boundp 'master_msg::tag_to_anchor_dis_t)
  (if (not (find-package "MASTER_MSG"))
    (make-package "MASTER_MSG"))
  (shadow 'tag_to_anchor_dis_t (find-package "MASTER_MSG")))
(unless (find-package "MASTER_MSG::TAG_TO_ANCHOR_DIS_T")
  (make-package "MASTER_MSG::TAG_TO_ANCHOR_DIS_T"))

(in-package "ROS")
;;//! \htmlinclude tag_to_anchor_dis_t.msg.html


(defclass master_msg::tag_to_anchor_dis_t
  :super ros::object
  :slots (_id _distance ))

(defmethod master_msg::tag_to_anchor_dis_t
  (:init
   (&key
    ((:id __id) 0)
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _distance (float __distance))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; float32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get master_msg::tag_to_anchor_dis_t :md5sum-) "d7f9d6771ae699c9f6d5196923d19a43")
(setf (get master_msg::tag_to_anchor_dis_t :datatype-) "master_msg/tag_to_anchor_dis_t")
(setf (get master_msg::tag_to_anchor_dis_t :definition-)
      "uint8 id
float32 distance

")



(provide :master_msg/tag_to_anchor_dis_t "d7f9d6771ae699c9f6d5196923d19a43")


