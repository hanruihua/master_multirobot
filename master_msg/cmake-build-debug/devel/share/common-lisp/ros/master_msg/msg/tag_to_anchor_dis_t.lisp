; Auto-generated. Do not edit!


(cl:in-package master_msg-msg)


;//! \htmlinclude tag_to_anchor_dis_t.msg.html

(cl:defclass <tag_to_anchor_dis_t> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass tag_to_anchor_dis_t (<tag_to_anchor_dis_t>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <tag_to_anchor_dis_t>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'tag_to_anchor_dis_t)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name master_msg-msg:<tag_to_anchor_dis_t> is deprecated: use master_msg-msg:tag_to_anchor_dis_t instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <tag_to_anchor_dis_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:id-val is deprecated.  Use master_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <tag_to_anchor_dis_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:distance-val is deprecated.  Use master_msg-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <tag_to_anchor_dis_t>) ostream)
  "Serializes a message object of type '<tag_to_anchor_dis_t>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <tag_to_anchor_dis_t>) istream)
  "Deserializes a message object of type '<tag_to_anchor_dis_t>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<tag_to_anchor_dis_t>)))
  "Returns string type for a message object of type '<tag_to_anchor_dis_t>"
  "master_msg/tag_to_anchor_dis_t")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'tag_to_anchor_dis_t)))
  "Returns string type for a message object of type 'tag_to_anchor_dis_t"
  "master_msg/tag_to_anchor_dis_t")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<tag_to_anchor_dis_t>)))
  "Returns md5sum for a message object of type '<tag_to_anchor_dis_t>"
  "d7f9d6771ae699c9f6d5196923d19a43")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'tag_to_anchor_dis_t)))
  "Returns md5sum for a message object of type 'tag_to_anchor_dis_t"
  "d7f9d6771ae699c9f6d5196923d19a43")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<tag_to_anchor_dis_t>)))
  "Returns full string definition for message of type '<tag_to_anchor_dis_t>"
  (cl:format cl:nil "uint8 id~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'tag_to_anchor_dis_t)))
  "Returns full string definition for message of type 'tag_to_anchor_dis_t"
  (cl:format cl:nil "uint8 id~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <tag_to_anchor_dis_t>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <tag_to_anchor_dis_t>))
  "Converts a ROS message object to a list"
  (cl:list 'tag_to_anchor_dis_t
    (cl:cons ':id (id msg))
    (cl:cons ':distance (distance msg))
))
