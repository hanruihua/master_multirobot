;; Auto-generated. Do not edit!


(when (boundp 'master_msg::node0_t)
  (if (not (find-package "MASTER_MSG"))
    (make-package "MASTER_MSG"))
  (shadow 'node0_t (find-package "MASTER_MSG")))
(unless (find-package "MASTER_MSG::NODE0_T")
  (make-package "MASTER_MSG::NODE0_T"))

(in-package "ROS")
;;//! \htmlinclude node0_t.msg.html


(defclass master_msg::node0_t
  :super ros::object
  :slots (_role _id _dataArray ))

(defmethod master_msg::node0_t
  (:init
   (&key
    ((:role __role) 0)
    ((:id __id) 0)
    ((:dataArray __dataArray) "")
    )
   (send-super :init)
   (setq _role (round __role))
   (setq _id (round __id))
   (setq _dataArray (string __dataArray))
   self)
  (:role
   (&optional __role)
   (if __role (setq _role __role)) _role)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:dataArray
   (&optional __dataArray)
   (if __dataArray (setq _dataArray __dataArray)) _dataArray)
  (:serialization-length
   ()
   (+
    ;; uint8 _role
    1
    ;; uint8 _id
    1
    ;; string _dataArray
    4 (length _dataArray)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _role
       (write-byte _role s)
     ;; uint8 _id
       (write-byte _id s)
     ;; string _dataArray
       (write-long (length _dataArray) s) (princ _dataArray s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _role
     (setq _role (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _dataArray
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _dataArray (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get master_msg::node0_t :md5sum-) "6857f2f154d6c47296b16a1f8ce2144e")
(setf (get master_msg::node0_t :datatype-) "master_msg/node0_t")
(setf (get master_msg::node0_t :definition-)
      "uint8 role
uint8 id
string dataArray


")



(provide :master_msg/node0_t "6857f2f154d6c47296b16a1f8ce2144e")


