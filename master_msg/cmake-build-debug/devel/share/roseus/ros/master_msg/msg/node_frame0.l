;; Auto-generated. Do not edit!


(when (boundp 'master_msg::node_frame0)
  (if (not (find-package "MASTER_MSG"))
    (make-package "MASTER_MSG"))
  (shadow 'node_frame0 (find-package "MASTER_MSG")))
(unless (find-package "MASTER_MSG::NODE_FRAME0")
  (make-package "MASTER_MSG::NODE_FRAME0"))

(in-package "ROS")
;;//! \htmlinclude node_frame0.msg.html


(defclass master_msg::node_frame0
  :super ros::object
  :slots (_role _id _nodes ))

(defmethod master_msg::node_frame0
  (:init
   (&key
    ((:role __role) 0)
    ((:id __id) 0)
    ((:nodes __nodes) (let (r) (dotimes (i 0) (push (instance master_msg::node0_t :init) r)) r))
    )
   (send-super :init)
   (setq _role (round __role))
   (setq _id (round __id))
   (setq _nodes __nodes)
   self)
  (:role
   (&optional __role)
   (if __role (setq _role __role)) _role)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
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
    ;; master_msg/node0_t[] _nodes
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
     ;; master_msg/node0_t[] _nodes
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
   ;; master_msg/node0_t[] _nodes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _nodes (let (r) (dotimes (i n) (push (instance master_msg::node0_t :init) r)) r))
     (dolist (elem- _nodes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get master_msg::node_frame0 :md5sum-) "1a31a1c9604cc1cd484ef5fa110de454")
(setf (get master_msg::node_frame0 :datatype-) "master_msg/node_frame0")
(setf (get master_msg::node_frame0 :definition-)
      "uint8 role
uint8 id
node0_t[] nodes

================================================================================
MSG: master_msg/node0_t
uint8 role
uint8 id
string dataArray


")



(provide :master_msg/node_frame0 "1a31a1c9604cc1cd484ef5fa110de454")


