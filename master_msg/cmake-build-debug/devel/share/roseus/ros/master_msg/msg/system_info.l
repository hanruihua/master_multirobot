;; Auto-generated. Do not edit!


(when (boundp 'master_msg::system_info)
  (if (not (find-package "MASTER_MSG"))
    (make-package "MASTER_MSG"))
  (shadow 'system_info (find-package "MASTER_MSG")))
(unless (find-package "MASTER_MSG::SYSTEM_INFO")
  (make-package "MASTER_MSG::SYSTEM_INFO"))

(in-package "ROS")
;;//! \htmlinclude system_info.msg.html


(defclass master_msg::system_info
  :super ros::object
  :slots (_product_name _hardware_version _firmware_version _baudrate ))

(defmethod master_msg::system_info
  (:init
   (&key
    ((:product_name __product_name) "")
    ((:hardware_version __hardware_version) "")
    ((:firmware_version __firmware_version) "")
    ((:baudrate __baudrate) 0)
    )
   (send-super :init)
   (setq _product_name (string __product_name))
   (setq _hardware_version (string __hardware_version))
   (setq _firmware_version (string __firmware_version))
   (setq _baudrate (round __baudrate))
   self)
  (:product_name
   (&optional __product_name)
   (if __product_name (setq _product_name __product_name)) _product_name)
  (:hardware_version
   (&optional __hardware_version)
   (if __hardware_version (setq _hardware_version __hardware_version)) _hardware_version)
  (:firmware_version
   (&optional __firmware_version)
   (if __firmware_version (setq _firmware_version __firmware_version)) _firmware_version)
  (:baudrate
   (&optional __baudrate)
   (if __baudrate (setq _baudrate __baudrate)) _baudrate)
  (:serialization-length
   ()
   (+
    ;; string _product_name
    4 (length _product_name)
    ;; string _hardware_version
    4 (length _hardware_version)
    ;; string _firmware_version
    4 (length _firmware_version)
    ;; int32 _baudrate
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _product_name
       (write-long (length _product_name) s) (princ _product_name s)
     ;; string _hardware_version
       (write-long (length _hardware_version) s) (princ _hardware_version s)
     ;; string _firmware_version
       (write-long (length _firmware_version) s) (princ _firmware_version s)
     ;; int32 _baudrate
       (write-long _baudrate s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _product_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _product_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _hardware_version
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _hardware_version (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _firmware_version
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _firmware_version (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _baudrate
     (setq _baudrate (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get master_msg::system_info :md5sum-) "7aebdbbdd195647dad628f7de30a6855")
(setf (get master_msg::system_info :datatype-) "master_msg/system_info")
(setf (get master_msg::system_info :definition-)
      "string product_name
string hardware_version
string firmware_version
int32 baudrate

")



(provide :master_msg/system_info "7aebdbbdd195647dad628f7de30a6855")


