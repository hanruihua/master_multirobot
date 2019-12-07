; Auto-generated. Do not edit!


(cl:in-package master_msg-msg)


;//! \htmlinclude node1_t.msg.html

(cl:defclass <node1_t> (roslisp-msg-protocol:ros-message)
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
   (position
    :reader position
    :initarg :position
    :type master_msg-msg:vector3d_t
    :initform (cl:make-instance 'master_msg-msg:vector3d_t)))
)

(cl:defclass node1_t (<node1_t>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <node1_t>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'node1_t)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name master_msg-msg:<node1_t> is deprecated: use master_msg-msg:node1_t instead.")))

(cl:ensure-generic-function 'role-val :lambda-list '(m))
(cl:defmethod role-val ((m <node1_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:role-val is deprecated.  Use master_msg-msg:role instead.")
  (role m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <node1_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:id-val is deprecated.  Use master_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <node1_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:position-val is deprecated.  Use master_msg-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node1_t>) ostream)
  "Serializes a message object of type '<node1_t>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node1_t>) istream)
  "Deserializes a message object of type '<node1_t>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<node1_t>)))
  "Returns string type for a message object of type '<node1_t>"
  "master_msg/node1_t")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'node1_t)))
  "Returns string type for a message object of type 'node1_t"
  "master_msg/node1_t")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<node1_t>)))
  "Returns md5sum for a message object of type '<node1_t>"
  "42a9f741955d80d74eefc92f8a50668d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node1_t)))
  "Returns md5sum for a message object of type 'node1_t"
  "42a9f741955d80d74eefc92f8a50668d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node1_t>)))
  "Returns full string definition for message of type '<node1_t>"
  (cl:format cl:nil "uint8 role~%uint8 id~%vector3d_t position~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node1_t)))
  "Returns full string definition for message of type 'node1_t"
  (cl:format cl:nil "uint8 role~%uint8 id~%vector3d_t position~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node1_t>))
  (cl:+ 0
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <node1_t>))
  "Converts a ROS message object to a list"
  (cl:list 'node1_t
    (cl:cons ':role (role msg))
    (cl:cons ':id (id msg))
    (cl:cons ':position (position msg))
))
