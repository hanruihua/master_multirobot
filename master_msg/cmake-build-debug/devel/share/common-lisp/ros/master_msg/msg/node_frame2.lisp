; Auto-generated. Do not edit!


(cl:in-package master_msg-msg)


;//! \htmlinclude node_frame2.msg.html

(cl:defclass <node_frame2> (roslisp-msg-protocol:ros-message)
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
   (position
    :reader position
    :initarg :position
    :type master_msg-msg:vector3d_t
    :initform (cl:make-instance 'master_msg-msg:vector3d_t))
   (eop
    :reader eop
    :initarg :eop
    :type master_msg-msg:vector3d_t
    :initform (cl:make-instance 'master_msg-msg:vector3d_t))
   (velocity
    :reader velocity
    :initarg :velocity
    :type master_msg-msg:vector3d_t
    :initform (cl:make-instance 'master_msg-msg:vector3d_t))
   (distances
    :reader distances
    :initarg :distances
    :type (cl:vector cl:float)
   :initform (cl:make-array 8 :element-type 'cl:float :initial-element 0.0))
   (imuGyro
    :reader imuGyro
    :initarg :imuGyro
    :type master_msg-msg:vector3d_t
    :initform (cl:make-instance 'master_msg-msg:vector3d_t))
   (imuAcc
    :reader imuAcc
    :initarg :imuAcc
    :type master_msg-msg:vector3d_t
    :initform (cl:make-instance 'master_msg-msg:vector3d_t))
   (angle
    :reader angle
    :initarg :angle
    :type master_msg-msg:vector3d_t
    :initform (cl:make-instance 'master_msg-msg:vector3d_t))
   (quaternions
    :reader quaternions
    :initarg :quaternions
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0))
   (supplyVoltage
    :reader supplyVoltage
    :initarg :supplyVoltage
    :type cl:float
    :initform 0.0)
   (nodes
    :reader nodes
    :initarg :nodes
    :type (cl:vector master_msg-msg:node2_t)
   :initform (cl:make-array 0 :element-type 'master_msg-msg:node2_t :initial-element (cl:make-instance 'master_msg-msg:node2_t))))
)

(cl:defclass node_frame2 (<node_frame2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <node_frame2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'node_frame2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name master_msg-msg:<node_frame2> is deprecated: use master_msg-msg:node_frame2 instead.")))

(cl:ensure-generic-function 'role-val :lambda-list '(m))
(cl:defmethod role-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:role-val is deprecated.  Use master_msg-msg:role instead.")
  (role m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:id-val is deprecated.  Use master_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'systemTime-val :lambda-list '(m))
(cl:defmethod systemTime-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:systemTime-val is deprecated.  Use master_msg-msg:systemTime instead.")
  (systemTime m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:position-val is deprecated.  Use master_msg-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'eop-val :lambda-list '(m))
(cl:defmethod eop-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:eop-val is deprecated.  Use master_msg-msg:eop instead.")
  (eop m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:velocity-val is deprecated.  Use master_msg-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'distances-val :lambda-list '(m))
(cl:defmethod distances-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:distances-val is deprecated.  Use master_msg-msg:distances instead.")
  (distances m))

(cl:ensure-generic-function 'imuGyro-val :lambda-list '(m))
(cl:defmethod imuGyro-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:imuGyro-val is deprecated.  Use master_msg-msg:imuGyro instead.")
  (imuGyro m))

(cl:ensure-generic-function 'imuAcc-val :lambda-list '(m))
(cl:defmethod imuAcc-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:imuAcc-val is deprecated.  Use master_msg-msg:imuAcc instead.")
  (imuAcc m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:angle-val is deprecated.  Use master_msg-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'quaternions-val :lambda-list '(m))
(cl:defmethod quaternions-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:quaternions-val is deprecated.  Use master_msg-msg:quaternions instead.")
  (quaternions m))

(cl:ensure-generic-function 'supplyVoltage-val :lambda-list '(m))
(cl:defmethod supplyVoltage-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:supplyVoltage-val is deprecated.  Use master_msg-msg:supplyVoltage instead.")
  (supplyVoltage m))

(cl:ensure-generic-function 'nodes-val :lambda-list '(m))
(cl:defmethod nodes-val ((m <node_frame2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:nodes-val is deprecated.  Use master_msg-msg:nodes instead.")
  (nodes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node_frame2>) ostream)
  "Serializes a message object of type '<node_frame2>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'systemTime)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'eop) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'distances))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'imuGyro) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'imuAcc) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angle) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'quaternions))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node_frame2>) istream)
  "Deserializes a message object of type '<node_frame2>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'eop) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
  (cl:setf (cl:slot-value msg 'distances) (cl:make-array 8))
  (cl:let ((vals (cl:slot-value msg 'distances)))
    (cl:dotimes (i 8)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'imuGyro) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'imuAcc) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angle) istream)
  (cl:setf (cl:slot-value msg 'quaternions) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'quaternions)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
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
    (cl:setf (cl:aref vals i) (cl:make-instance 'master_msg-msg:node2_t))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<node_frame2>)))
  "Returns string type for a message object of type '<node_frame2>"
  "master_msg/node_frame2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'node_frame2)))
  "Returns string type for a message object of type 'node_frame2"
  "master_msg/node_frame2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<node_frame2>)))
  "Returns md5sum for a message object of type '<node_frame2>"
  "2bd4695057836d171d8201257d601e34")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node_frame2)))
  "Returns md5sum for a message object of type 'node_frame2"
  "2bd4695057836d171d8201257d601e34")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node_frame2>)))
  "Returns full string definition for message of type '<node_frame2>"
  (cl:format cl:nil "uint8 role~%uint8 id~%uint32 systemTime~%vector3d_t position~%vector3d_t eop~%vector3d_t velocity~%float32[8] distances~%vector3d_t imuGyro~%vector3d_t imuAcc~%vector3d_t angle~%float32[4] quaternions~%float32 supplyVoltage~%node2_t[] nodes~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: master_msg/node2_t~%uint8 role~%uint8 id~%float32 distance~%float32 fpRssi~%float32 rxRssi~%uint32 systemTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node_frame2)))
  "Returns full string definition for message of type 'node_frame2"
  (cl:format cl:nil "uint8 role~%uint8 id~%uint32 systemTime~%vector3d_t position~%vector3d_t eop~%vector3d_t velocity~%float32[8] distances~%vector3d_t imuGyro~%vector3d_t imuAcc~%vector3d_t angle~%float32[4] quaternions~%float32 supplyVoltage~%node2_t[] nodes~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: master_msg/node2_t~%uint8 role~%uint8 id~%float32 distance~%float32 fpRssi~%float32 rxRssi~%uint32 systemTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node_frame2>))
  (cl:+ 0
     1
     1
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'eop))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'distances) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'imuGyro))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'imuAcc))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angle))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'quaternions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'nodes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <node_frame2>))
  "Converts a ROS message object to a list"
  (cl:list 'node_frame2
    (cl:cons ':role (role msg))
    (cl:cons ':id (id msg))
    (cl:cons ':systemTime (systemTime msg))
    (cl:cons ':position (position msg))
    (cl:cons ':eop (eop msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':distances (distances msg))
    (cl:cons ':imuGyro (imuGyro msg))
    (cl:cons ':imuAcc (imuAcc msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':quaternions (quaternions msg))
    (cl:cons ':supplyVoltage (supplyVoltage msg))
    (cl:cons ':nodes (nodes msg))
))
