; Auto-generated. Do not edit!


(cl:in-package master_msg-msg)


;//! \htmlinclude node2_t.msg.html

(cl:defclass <node2_t> (roslisp-msg-protocol:ros-message)
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
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (fpRssi
    :reader fpRssi
    :initarg :fpRssi
    :type cl:float
    :initform 0.0)
   (rxRssi
    :reader rxRssi
    :initarg :rxRssi
    :type cl:float
    :initform 0.0)
   (systemTime
    :reader systemTime
    :initarg :systemTime
    :type cl:integer
    :initform 0))
)

(cl:defclass node2_t (<node2_t>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <node2_t>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'node2_t)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name master_msg-msg:<node2_t> is deprecated: use master_msg-msg:node2_t instead.")))

(cl:ensure-generic-function 'role-val :lambda-list '(m))
(cl:defmethod role-val ((m <node2_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:role-val is deprecated.  Use master_msg-msg:role instead.")
  (role m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <node2_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:id-val is deprecated.  Use master_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <node2_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:distance-val is deprecated.  Use master_msg-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'fpRssi-val :lambda-list '(m))
(cl:defmethod fpRssi-val ((m <node2_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:fpRssi-val is deprecated.  Use master_msg-msg:fpRssi instead.")
  (fpRssi m))

(cl:ensure-generic-function 'rxRssi-val :lambda-list '(m))
(cl:defmethod rxRssi-val ((m <node2_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:rxRssi-val is deprecated.  Use master_msg-msg:rxRssi instead.")
  (rxRssi m))

(cl:ensure-generic-function 'systemTime-val :lambda-list '(m))
(cl:defmethod systemTime-val ((m <node2_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:systemTime-val is deprecated.  Use master_msg-msg:systemTime instead.")
  (systemTime m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node2_t>) ostream)
  "Serializes a message object of type '<node2_t>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fpRssi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rxRssi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'systemTime)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node2_t>) istream)
  "Deserializes a message object of type '<node2_t>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fpRssi) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rxRssi) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<node2_t>)))
  "Returns string type for a message object of type '<node2_t>"
  "master_msg/node2_t")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'node2_t)))
  "Returns string type for a message object of type 'node2_t"
  "master_msg/node2_t")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<node2_t>)))
  "Returns md5sum for a message object of type '<node2_t>"
  "c3cbbfcb8abc98223a4404f5d43ad497")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node2_t)))
  "Returns md5sum for a message object of type 'node2_t"
  "c3cbbfcb8abc98223a4404f5d43ad497")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node2_t>)))
  "Returns full string definition for message of type '<node2_t>"
  (cl:format cl:nil "uint8 role~%uint8 id~%float32 distance~%float32 fpRssi~%float32 rxRssi~%uint32 systemTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node2_t)))
  "Returns full string definition for message of type 'node2_t"
  (cl:format cl:nil "uint8 role~%uint8 id~%float32 distance~%float32 fpRssi~%float32 rxRssi~%uint32 systemTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node2_t>))
  (cl:+ 0
     1
     1
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <node2_t>))
  "Converts a ROS message object to a list"
  (cl:list 'node2_t
    (cl:cons ':role (role msg))
    (cl:cons ':id (id msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':fpRssi (fpRssi msg))
    (cl:cons ':rxRssi (rxRssi msg))
    (cl:cons ':systemTime (systemTime msg))
))
