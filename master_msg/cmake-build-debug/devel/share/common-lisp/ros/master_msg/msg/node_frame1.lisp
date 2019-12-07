; Auto-generated. Do not edit!


(cl:in-package master_msg-msg)


;//! \htmlinclude node_frame1.msg.html

(cl:defclass <node_frame1> (roslisp-msg-protocol:ros-message)
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
   (systemTime
    :reader systemTime
    :initarg :systemTime
    :type cl:integer
    :initform 0)
   (supplyVoltage
    :reader supplyVoltage
    :initarg :supplyVoltage
    :type cl:float
    :initform 0.0)
   (nodes
    :reader nodes
    :initarg :nodes
    :type (cl:vector master_msg-msg:node1_t)
   :initform (cl:make-array 0 :element-type 'master_msg-msg:node1_t :initial-element (cl:make-instance 'master_msg-msg:node1_t))))
)

(cl:defclass node_frame1 (<node_frame1>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <node_frame1>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'node_frame1)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name master_msg-msg:<node_frame1> is deprecated: use master_msg-msg:node_frame1 instead.")))

(cl:ensure-generic-function 'role-val :lambda-list '(m))
(cl:defmethod role-val ((m <node_frame1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:role-val is deprecated.  Use master_msg-msg:role instead.")
  (role m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <node_frame1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:id-val is deprecated.  Use master_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'systemTime-val :lambda-list '(m))
(cl:defmethod systemTime-val ((m <node_frame1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:systemTime-val is deprecated.  Use master_msg-msg:systemTime instead.")
  (systemTime m))

(cl:ensure-generic-function 'supplyVoltage-val :lambda-list '(m))
(cl:defmethod supplyVoltage-val ((m <node_frame1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:supplyVoltage-val is deprecated.  Use master_msg-msg:supplyVoltage instead.")
  (supplyVoltage m))

(cl:ensure-generic-function 'nodes-val :lambda-list '(m))
(cl:defmethod nodes-val ((m <node_frame1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:nodes-val is deprecated.  Use master_msg-msg:nodes instead.")
  (nodes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node_frame1>) ostream)
  "Serializes a message object of type '<node_frame1>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'systemTime)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'supplyVoltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'nodes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'nodes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node_frame1>) istream)
  "Deserializes a message object of type '<node_frame1>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'supplyVoltage) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'nodes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'nodes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'master_msg-msg:node1_t))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<node_frame1>)))
  "Returns string type for a message object of type '<node_frame1>"
  "master_msg/node_frame1")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'node_frame1)))
  "Returns string type for a message object of type 'node_frame1"
  "master_msg/node_frame1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<node_frame1>)))
  "Returns md5sum for a message object of type '<node_frame1>"
  "0ed118520974e3023cb1cc203f2d31a4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node_frame1)))
  "Returns md5sum for a message object of type 'node_frame1"
  "0ed118520974e3023cb1cc203f2d31a4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node_frame1>)))
  "Returns full string definition for message of type '<node_frame1>"
  (cl:format cl:nil "uint8 role~%uint8 id~%uint32 systemTime~%float32 supplyVoltage~%node1_t[] nodes~%~%================================================================================~%MSG: master_msg/node1_t~%uint8 role~%uint8 id~%vector3d_t position~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node_frame1)))
  "Returns full string definition for message of type 'node_frame1"
  (cl:format cl:nil "uint8 role~%uint8 id~%uint32 systemTime~%float32 supplyVoltage~%node1_t[] nodes~%~%================================================================================~%MSG: master_msg/node1_t~%uint8 role~%uint8 id~%vector3d_t position~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node_frame1>))
  (cl:+ 0
     1
     1
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'nodes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <node_frame1>))
  "Converts a ROS message object to a list"
  (cl:list 'node_frame1
    (cl:cons ':role (role msg))
    (cl:cons ':id (id msg))
    (cl:cons ':systemTime (systemTime msg))
    (cl:cons ':supplyVoltage (supplyVoltage msg))
    (cl:cons ':nodes (nodes msg))
))
