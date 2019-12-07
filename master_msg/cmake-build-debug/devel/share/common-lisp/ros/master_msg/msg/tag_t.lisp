; Auto-generated. Do not edit!


(cl:in-package master_msg-msg)


;//! \htmlinclude tag_t.msg.html

(cl:defclass <tag_t> (roslisp-msg-protocol:ros-message)
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
   (anchors
    :reader anchors
    :initarg :anchors
    :type (cl:vector master_msg-msg:tag_to_anchor_dis_t)
   :initform (cl:make-array 4 :element-type 'master_msg-msg:tag_to_anchor_dis_t :initial-element (cl:make-instance 'master_msg-msg:tag_to_anchor_dis_t))))
)

(cl:defclass tag_t (<tag_t>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <tag_t>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'tag_t)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name master_msg-msg:<tag_t> is deprecated: use master_msg-msg:tag_t instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <tag_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:id-val is deprecated.  Use master_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <tag_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:position-val is deprecated.  Use master_msg-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'anchors-val :lambda-list '(m))
(cl:defmethod anchors-val ((m <tag_t>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader master_msg-msg:anchors-val is deprecated.  Use master_msg-msg:anchors instead.")
  (anchors m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <tag_t>) ostream)
  "Serializes a message object of type '<tag_t>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'anchors))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <tag_t>) istream)
  "Deserializes a message object of type '<tag_t>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (cl:setf (cl:slot-value msg 'anchors) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'anchors)))
    (cl:dotimes (i 4)
    (cl:setf (cl:aref vals i) (cl:make-instance 'master_msg-msg:tag_to_anchor_dis_t))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<tag_t>)))
  "Returns string type for a message object of type '<tag_t>"
  "master_msg/tag_t")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'tag_t)))
  "Returns string type for a message object of type 'tag_t"
  "master_msg/tag_t")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<tag_t>)))
  "Returns md5sum for a message object of type '<tag_t>"
  "4358caa9602ca48b1d884eff71f8bc31")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'tag_t)))
  "Returns md5sum for a message object of type 'tag_t"
  "4358caa9602ca48b1d884eff71f8bc31")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<tag_t>)))
  "Returns full string definition for message of type '<tag_t>"
  (cl:format cl:nil "uint8 id~%vector3d_t position~%tag_to_anchor_dis_t[4] anchors~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: master_msg/tag_to_anchor_dis_t~%uint8 id~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'tag_t)))
  "Returns full string definition for message of type 'tag_t"
  (cl:format cl:nil "uint8 id~%vector3d_t position~%tag_to_anchor_dis_t[4] anchors~%~%================================================================================~%MSG: master_msg/vector3d_t~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: master_msg/tag_to_anchor_dis_t~%uint8 id~%float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <tag_t>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'anchors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <tag_t>))
  "Converts a ROS message object to a list"
  (cl:list 'tag_t
    (cl:cons ':id (id msg))
    (cl:cons ':position (position msg))
    (cl:cons ':anchors (anchors msg))
))
