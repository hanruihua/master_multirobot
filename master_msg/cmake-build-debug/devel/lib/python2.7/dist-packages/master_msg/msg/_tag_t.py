# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from master_msg/tag_t.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import master_msg.msg

class tag_t(genpy.Message):
  _md5sum = "4358caa9602ca48b1d884eff71f8bc31"
  _type = "master_msg/tag_t"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """uint8 id
vector3d_t position
tag_to_anchor_dis_t[4] anchors

================================================================================
MSG: master_msg/vector3d_t
float32 x
float32 y
float32 z

================================================================================
MSG: master_msg/tag_to_anchor_dis_t
uint8 id
float32 distance
"""
  __slots__ = ['id','position','anchors']
  _slot_types = ['uint8','master_msg/vector3d_t','master_msg/tag_to_anchor_dis_t[4]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       id,position,anchors

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(tag_t, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.id is None:
        self.id = 0
      if self.position is None:
        self.position = master_msg.msg.vector3d_t()
      if self.anchors is None:
        self.anchors = [master_msg.msg.tag_to_anchor_dis_t() for _ in range(4)]
    else:
      self.id = 0
      self.position = master_msg.msg.vector3d_t()
      self.anchors = [master_msg.msg.tag_to_anchor_dis_t() for _ in range(4)]

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_B3f().pack(_x.id, _x.position.x, _x.position.y, _x.position.z))
      for val1 in self.anchors:
        _x = val1
        buff.write(_get_struct_Bf().pack(_x.id, _x.distance))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.position is None:
        self.position = master_msg.msg.vector3d_t()
      if self.anchors is None:
        self.anchors = None
      end = 0
      _x = self
      start = end
      end += 13
      (_x.id, _x.position.x, _x.position.y, _x.position.z,) = _get_struct_B3f().unpack(str[start:end])
      self.anchors = []
      for i in range(0, 4):
        val1 = master_msg.msg.tag_to_anchor_dis_t()
        _x = val1
        start = end
        end += 5
        (_x.id, _x.distance,) = _get_struct_Bf().unpack(str[start:end])
        self.anchors.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_B3f().pack(_x.id, _x.position.x, _x.position.y, _x.position.z))
      for val1 in self.anchors:
        _x = val1
        buff.write(_get_struct_Bf().pack(_x.id, _x.distance))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.position is None:
        self.position = master_msg.msg.vector3d_t()
      if self.anchors is None:
        self.anchors = None
      end = 0
      _x = self
      start = end
      end += 13
      (_x.id, _x.position.x, _x.position.y, _x.position.z,) = _get_struct_B3f().unpack(str[start:end])
      self.anchors = []
      for i in range(0, 4):
        val1 = master_msg.msg.tag_to_anchor_dis_t()
        _x = val1
        start = end
        end += 5
        (_x.id, _x.distance,) = _get_struct_Bf().unpack(str[start:end])
        self.anchors.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B3f = None
def _get_struct_B3f():
    global _struct_B3f
    if _struct_B3f is None:
        _struct_B3f = struct.Struct("<B3f")
    return _struct_B3f
_struct_Bf = None
def _get_struct_Bf():
    global _struct_Bf
    if _struct_Bf is None:
        _struct_Bf = struct.Struct("<Bf")
    return _struct_Bf