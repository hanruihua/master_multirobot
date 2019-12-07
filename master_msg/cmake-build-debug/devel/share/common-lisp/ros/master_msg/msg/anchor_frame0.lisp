; Auto-generated. Do not edit!


(cl:in-package master_msg-msg)


;//! \htmlinclude anchor_frame0.msg.html

(cl:defclass <anchor_frame0> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (supplyVoltage
    :reader supplyVoltage
    :initarg :supplyVoltage
    :type cl:float
    :initform 0.0)
   (systemTime
    :reader systemTime
    :initarg :systemTime
    :type cl:integer
    :initform 0)
   (tags
    :reader tags
    :initarg :tags
    :type (cl:vector master_msg-msg:tag_t)
   :initform (cl:make-array 0 :element-type 'master_msg-msg:tag_t :initial-element (cl:make-instance 'master_msg-msg:tag_t))))
)

(cl:defclass anchor_frame0 (<anchor_frame0>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <anchor_frame0>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'anchor_frame0)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name master_msg-msg:<anchor_frame0> is deprecated: use master_msg-msg:anchor_frame0 instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <anchor_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:id-val is deprecated.  Use master_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'supplyVoltage-val :lambda-list '(m))
(cl:defmethod supplyVoltage-val ((m <anchor_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:supplyVoltage-val is deprecated.  Use master_msg-msg:supplyVoltage instead.")
  (supplyVoltage m))

(cl:ensure-generic-function 'systemTime-val :lambda-list '(m))
(cl:defmethod systemTime-val ((m <anchor_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:systemTime-val is deprecated.  Use master_msg-msg:systemTime instead.")
  (systemTime m))

(cl:ensure-generic-function 'tags-val :lambda-list '(m))
(cl:defmethod tags-val ((m <anchor_frame0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:tags-val is deprecated.  Use master_msg-msg:tags instead.")
  (tags m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <anchor_frame0>) ostream)
  "Serializes a message object of type '<anchor_frame0>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'supplyVoltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'systemTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'systemTime)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'tags))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'tags))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <anchor_frame0>) istream)
  "Deserializes a message object of type '<anchor_frame0>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'supplyVoltage) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'systemTime)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'tags) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'tags)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'master_msg-msg:tag_t))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<anchor_frame0>)))
  "Returns string type for a message object of type '<anchor_frame0>"
  "master_msg/anchor_frame0")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'anchor_frame0)))
  "Returns string type for a message object of type 'anchor_frame0"
  "master_msg/anchor_frame0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<anchor_frame0>)))
  "Returns md5sum for a message object of type '<anchor_frame0>"
  "2256282624134041b30a05c8a25f1684")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'anchor_frame0)))
  "Returns md5sum for a message object of type 'anchor_frame0"
  "2256282624134041b30a05c8a25f1684")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<anchor_frame0>)))
  "Returns full string definition for message of type '<anchor_frame0>"
  (cl:format cl:nil "uint8 id~%float32 supplyVoltage~%uint32 systemTime~%tag_t[] tags~%~%~%================================================================================~%MSG: master_msg/tag_t~%uint8 id~%vector3d_t position~%tag_to_anchor_dis_t[4] anchors~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: master_msg/tag_to_anchor_dis_t~%uint8 id~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'anchor_frame0)))
  "Returns full string definition for message of type 'anchor_frame0"
  (cl:format cl:nil "uint8 id~%float32 supplyVoltage~%uint32 systemTime~%tag_t[] tags~%~%~%================================================================================~%MSG: master_msg/tag_t~%uint8 id~%vector3d_t position~%tag_to_anchor_dis_t[4] anchors~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: master_msg/tag_to_anchor_dis_t~%uint8 id~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <anchor_frame0>))
  (cl:+ 0
     1
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'tags) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <anchor_frame0>))
  "Converts a ROS message object to a list"
  (cl:list 'anchor_frame0
    (cl:cons ':id (id msg))
    (cl:cons ':supplyVoltage (supplyVoltage msg))
    (cl:cons ':systemTime (systemTime msg))
    (cl:cons ':tags (tags msg))
))
