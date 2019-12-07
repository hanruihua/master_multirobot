; Auto-generated. Do not edit!


(cl:in-package master_msg-msg)


;//! \htmlinclude node0_t.msg.html

(cl:defclass <node0_t> (roslisp-msg-protocol:ros-message)
  ((role
    :reader role
    :initarg :role
    :type cl:fixnum
    :initform 0)
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (dataArray
    :reader dataArray
    :initarg :dataArray
    :type cl:string
    :initform ""))
)

(cl:defclass node0_t (<node0_t>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <node0_t>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'node0_t)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name master_msg-msg:<node0_t> is deprecated: use master_msg-msg:node0_t instead.")))

(cl:ensure-generic-function 'role-val :lambda-list '(m))
(cl:defmethod role-val ((m <node0_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:role-val is deprecated.  Use master_msg-msg:role instead.")
  (role m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <node0_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:id-val is deprecated.  Use master_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'dataArray-val :lambda-list '(m))
(cl:defmethod dataArray-val ((m <node0_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:dataArray-val is deprecated.  Use master_msg-msg:dataArray instead.")
  (dataArray m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node0_t>) ostream)
  "Serializes a message object of type '<node0_t>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'dataArray))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'dataArray))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node0_t>) istream)
  "Deserializes a message object of type '<node0_t>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dataArray) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'dataArray) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<node0_t>)))
  "Returns string type for a message object of type '<node0_t>"
  "master_msg/node0_t")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'node0_t)))
  "Returns string type for a message object of type 'node0_t"
  "master_msg/node0_t")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<node0_t>)))
  "Returns md5sum for a message object of type '<node0_t>"
  "6857f2f154d6c47296b16a1f8ce2144e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node0_t)))
  "Returns md5sum for a message object of type 'node0_t"
  "6857f2f154d6c47296b16a1f8ce2144e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node0_t>)))
  "Returns full string definition for message of type '<node0_t>"
  (cl:format cl:nil "uint8 role~%uint8 id~%string dataArray~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node0_t)))
  "Returns full string definition for message of type 'node0_t"
  (cl:format cl:nil "uint8 role~%uint8 id~%string dataArray~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node0_t>))
  (cl:+ 0
     1
     1
     4 (cl:length (cl:slot-value msg 'dataArray))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <node0_t>))
  "Converts a ROS message object to a list"
  (cl:list 'node0_t
    (cl:cons ':role (role msg))
    (cl:cons ':id (id msg))
    (cl:cons ':dataArray (dataArray msg))
))
