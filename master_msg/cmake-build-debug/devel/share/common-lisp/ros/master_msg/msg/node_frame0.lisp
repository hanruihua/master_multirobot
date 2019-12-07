; Auto-generated. Do not edit!


(cl:in-package master_msg-msg)


;//! \htmlinclude node_frame0.msg.html

(cl:defclass <node_frame0> (roslisp-msg-protocol:ros-message)
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
   (nodes
    :reader nodes
    :initarg :nodes
    :type (cl:vector master_msg-msg:node0_t)
   :initform (cl:make-array 0 :element-type 'master_msg-msg:node0_t :initial-element (cl:make-instance 'master_msg-msg:node0_t))))
)

(cl:defclass node_frame0 (<node_frame0>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <node_frame0>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'node_frame0)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name master_msg-msg:<node_frame0> is deprecated: use master_msg-msg:node_frame0 instead.")))

(cl:ensure-generic-function 'role-val :lambda-list '(m))
(cl:defmethod role-val ((m <node_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:role-val is deprecated.  Use master_msg-msg:role instead.")
  (role m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <node_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:id-val is deprecated.  Use master_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'nodes-val :lambda-list '(m))
(cl:defmethod nodes-val ((m <node_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:nodes-val is deprecated.  Use master_msg-msg:nodes instead.")
  (nodes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node_frame0>) ostream)
  "Serializes a message object of type '<node_frame0>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'nodes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'nodes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node_frame0>) istream)
  "Deserializes a message object of type '<node_frame0>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'nodes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'nodes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'master_msg-msg:node0_t))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<node_frame0>)))
  "Returns string type for a message object of type '<node_frame0>"
  "master_msg/node_frame0")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'node_frame0)))
  "Returns string type for a message object of type 'node_frame0"
  "master_msg/node_frame0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<node_frame0>)))
  "Returns md5sum for a message object of type '<node_frame0>"
  "1a31a1c9604cc1cd484ef5fa110de454")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node_frame0)))
  "Returns md5sum for a message object of type 'node_frame0"
  "1a31a1c9604cc1cd484ef5fa110de454")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node_frame0>)))
  "Returns full string definition for message of type '<node_frame0>"
  (cl:format cl:nil "uint8 role~%uint8 id~%node0_t[] nodes~%~%================================================================================~%MSG: master_msg/node0_t~%uint8 role~%uint8 id~%string dataArray~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node_frame0)))
  "Returns full string definition for message of type 'node_frame0"
  (cl:format cl:nil "uint8 role~%uint8 id~%node0_t[] nodes~%~%================================================================================~%MSG: master_msg/node0_t~%uint8 role~%uint8 id~%string dataArray~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node_frame0>))
  (cl:+ 0
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'nodes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <node_frame0>))
  "Converts a ROS message object to a list"
  (cl:list 'node_frame0
    (cl:cons ':role (role msg))
    (cl:cons ':id (id msg))
    (cl:cons ':nodes (nodes msg))
))
