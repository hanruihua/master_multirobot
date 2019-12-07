; Auto-generated. Do not edit!


(cl:in-package master_msg-msg)


;//! \htmlinclude tag_frame0.msg.html

(cl:defclass <tag_frame0> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (position
    :reader position
    :initarg :position
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
   (systemTime
    :reader systemTime
    :initarg :systemTime
    :type cl:integer
    :initform 0)
   (accWorkNormal
    :reader accWorkNormal
    :initarg :accWorkNormal
    :type cl:fixnum
    :initform 0)
   (accIsOnLine
    :reader accIsOnLine
    :initarg :accIsOnLine
    :type cl:fixnum
    :initform 0)
   (gyroWorkNormal
    :reader gyroWorkNormal
    :initarg :gyroWorkNormal
    :type cl:fixnum
    :initform 0)
   (gyroIsOnLine
    :reader gyroIsOnLine
    :initarg :gyroIsOnLine
    :type cl:fixnum
    :initform 0)
   (eop
    :reader eop
    :initarg :eop
    :type master_msg-msg:vector3d_t
    :initform (cl:make-instance 'master_msg-msg:vector3d_t))
   (supplyVoltage
    :reader supplyVoltage
    :initarg :supplyVoltage
    :type cl:float
    :initform 0.0))
)

(cl:defclass tag_frame0 (<tag_frame0>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <tag_frame0>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'tag_frame0)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name master_msg-msg:<tag_frame0> is deprecated: use master_msg-msg:tag_frame0 instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:id-val is deprecated.  Use master_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:position-val is deprecated.  Use master_msg-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:velocity-val is deprecated.  Use master_msg-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'distances-val :lambda-list '(m))
(cl:defmethod distances-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:distances-val is deprecated.  Use master_msg-msg:distances instead.")
  (distances m))

(cl:ensure-generic-function 'imuGyro-val :lambda-list '(m))
(cl:defmethod imuGyro-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:imuGyro-val is deprecated.  Use master_msg-msg:imuGyro instead.")
  (imuGyro m))

(cl:ensure-generic-function 'imuAcc-val :lambda-list '(m))
(cl:defmethod imuAcc-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:imuAcc-val is deprecated.  Use master_msg-msg:imuAcc instead.")
  (imuAcc m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:angle-val is deprecated.  Use master_msg-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'quaternions-val :lambda-list '(m))
(cl:defmethod quaternions-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:quaternions-val is deprecated.  Use master_msg-msg:quaternions instead.")
  (quaternions m))

(cl:ensure-generic-function 'systemTime-val :lambda-list '(m))
(cl:defmethod systemTime-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:systemTime-val is deprecated.  Use master_msg-msg:systemTime instead.")
  (systemTime m))

(cl:ensure-generic-function 'accWorkNormal-val :lambda-list '(m))
(cl:defmethod accWorkNormal-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:accWorkNormal-val is deprecated.  Use master_msg-msg:accWorkNormal instead.")
  (accWorkNormal m))

(cl:ensure-generic-function 'accIsOnLine-val :lambda-list '(m))
(cl:defmethod accIsOnLine-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:accIsOnLine-val is deprecated.  Use master_msg-msg:accIsOnLine instead.")
  (accIsOnLine m))

(cl:ensure-generic-function 'gyroWorkNormal-val :lambda-list '(m))
(cl:defmethod gyroWorkNormal-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:gyroWorkNormal-val is deprecated.  Use master_msg-msg:gyroWorkNormal instead.")
  (gyroWorkNormal m))

(cl:ensure-generic-function 'gyroIsOnLine-val :lambda-list '(m))
(cl:defmethod gyroIsOnLine-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:gyroIsOnLine-val is deprecated.  Use master_msg-msg:gyroIsOnLine instead.")
  (gyroIsOnLine m))

(cl:ensure-generic-function 'eop-val :lambda-list '(m))
(cl:defmethod eop-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:eop-val is deprecated.  Use master_msg-msg:eop instead.")
  (eop m))

(cl:ensure-generic-function 'supplyVoltage-val :lambda-list '(m))
(cl:defmethod supplyVoltage-val ((m <tag_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:supplyVoltage-val is deprecated.  Use master_msg-msg:supplyVoltage instead.")
  (supplyVoltage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <tag_frame0>) ostream)
  "Serializes a message object of type '<tag_frame0>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accWorkNormal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accIsOnLine)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gyroWorkNormal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gyroIsOnLine)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'eop) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'supplyVoltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <tag_frame0>) istream)
  "Deserializes a message object of type '<tag_frame0>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accWorkNormal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accIsOnLine)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gyroWorkNormal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gyroIsOnLine)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'eop) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'supplyVoltage) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<tag_frame0>)))
  "Returns string type for a message object of type '<tag_frame0>"
  "master_msg/tag_frame0")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'tag_frame0)))
  "Returns string type for a message object of type 'tag_frame0"
  "master_msg/tag_frame0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<tag_frame0>)))
  "Returns md5sum for a message object of type '<tag_frame0>"
  "50810e8ed732bc3be1c295ba94186d48")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'tag_frame0)))
  "Returns md5sum for a message object of type 'tag_frame0"
  "50810e8ed732bc3be1c295ba94186d48")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<tag_frame0>)))
  "Returns full string definition for message of type '<tag_frame0>"
  (cl:format cl:nil "uint8 id~%vector3d_t position~%vector3d_t velocity~%float32[8] distances~%vector3d_t imuGyro~%vector3d_t imuAcc~%vector3d_t angle~%float32[4] quaternions~%uint32 systemTime~%uint8 accWorkNormal~%uint8 accIsOnLine~%uint8 gyroWorkNormal~%uint8 gyroIsOnLine~%vector3d_t eop~%float32 supplyVoltage~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'tag_frame0)))
  "Returns full string definition for message of type 'tag_frame0"
  (cl:format cl:nil "uint8 id~%vector3d_t position~%vector3d_t velocity~%float32[8] distances~%vector3d_t imuGyro~%vector3d_t imuAcc~%vector3d_t angle~%float32[4] quaternions~%uint32 systemTime~%uint8 accWorkNormal~%uint8 accIsOnLine~%uint8 gyroWorkNormal~%uint8 gyroIsOnLine~%vector3d_t eop~%float32 supplyVoltage~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <tag_frame0>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'distances) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'imuGyro))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'imuAcc))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angle))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'quaternions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     1
     1
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'eop))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <tag_frame0>))
  "Converts a ROS message object to a list"
  (cl:list 'tag_frame0
    (cl:cons ':id (id msg))
    (cl:cons ':position (position msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':distances (distances msg))
    (cl:cons ':imuGyro (imuGyro msg))
    (cl:cons ':imuAcc (imuAcc msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':quaternions (quaternions msg))
    (cl:cons ':systemTime (systemTime msg))
    (cl:cons ':accWorkNormal (accWorkNormal msg))
    (cl:cons ':accIsOnLine (accIsOnLine msg))
    (cl:cons ':gyroWorkNormal (gyroWorkNormal msg))
    (cl:cons ':gyroIsOnLine (gyroIsOnLine msg))
    (cl:cons ':eop (eop msg))
    (cl:cons ':supplyVoltage (supplyVoltage msg))
))
