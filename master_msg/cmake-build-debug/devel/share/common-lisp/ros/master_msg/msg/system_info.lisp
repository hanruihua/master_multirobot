; Auto-generated. Do not edit!


(cl:in-package master_msg-msg)


;//! \htmlinclude system_info.msg.html

(cl:defclass <system_info> (roslisp-msg-protocol:ros-message)
  ((product_name
    :reader product_name
    :initarg :product_name
    :type cl:string
    :initform "")
   (hardware_version
    :reader hardware_version
    :initarg :hardware_version
    :type cl:string
    :initform "")
   (firmware_version
    :reader firmware_version
    :initarg :firmware_version
    :type cl:string
    :initform "")
   (baudrate
    :reader baudrate
    :initarg :baudrate
    :type cl:integer
    :initform 0))
)

(cl:defclass system_info (<system_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <system_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'system_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name master_msg-msg:<system_info> is deprecated: use master_msg-msg:system_info instead.")))

(cl:ensure-generic-function 'product_name-val :lambda-list '(m))
(cl:defmethod product_name-val ((m <system_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:product_name-val is deprecated.  Use master_msg-msg:product_name instead.")
  (product_name m))

(cl:ensure-generic-function 'hardware_version-val :lambda-list '(m))
(cl:defmethod hardware_version-val ((m <system_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:hardware_version-val is deprecated.  Use master_msg-msg:hardware_version instead.")
  (hardware_version m))

(cl:ensure-generic-function 'firmware_version-val :lambda-list '(m))
(cl:defmethod firmware_version-val ((m <system_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:firmware_version-val is deprecated.  Use master_msg-msg:firmware_version instead.")
  (firmware_version m))

(cl:ensure-generic-function 'baudrate-val :lambda-list '(m))
(cl:defmethod baudrate-val ((m <system_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:baudrate-val is deprecated.  Use master_msg-msg:baudrate instead.")
  (baudrate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <system_info>) ostream)
  "Serializes a message object of type '<system_info>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'product_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'product_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'hardware_version))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'hardware_version))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'firmware_version))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'firmware_version))
  (cl:let* ((signed (cl:slot-value msg 'baudrate)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <system_info>) istream)
  "Deserializes a message object of type '<system_info>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'product_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'product_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hardware_version) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'hardware_version) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'firmware_version) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'firmware_version) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'baudrate) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<system_info>)))
  "Returns string type for a message object of type '<system_info>"
  "master_msg/system_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'system_info)))
  "Returns string type for a message object of type 'system_info"
  "master_msg/system_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<system_info>)))
  "Returns md5sum for a message object of type '<system_info>"
  "7aebdbbdd195647dad628f7de30a6855")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'system_info)))
  "Returns md5sum for a message object of type 'system_info"
  "7aebdbbdd195647dad628f7de30a6855")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<system_info>)))
  "Returns full string definition for message of type '<system_info>"
  (cl:format cl:nil "string product_name~%string hardware_version~%string firmware_version~%int32 baudrate~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'system_info)))
  "Returns full string definition for message of type 'system_info"
  (cl:format cl:nil "string product_name~%string hardware_version~%string firmware_version~%int32 baudrate~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <system_info>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'product_name))
     4 (cl:length (cl:slot-value msg 'hardware_version))
     4 (cl:length (cl:slot-value msg 'firmware_version))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <system_info>))
  "Converts a ROS message object to a list"
  (cl:list 'system_info
    (cl:cons ':product_name (product_name msg))
    (cl:cons ':hardware_version (hardware_version msg))
    (cl:cons ':firmware_version (firmware_version msg))
    (cl:cons ':baudrate (baudrate msg))
))
