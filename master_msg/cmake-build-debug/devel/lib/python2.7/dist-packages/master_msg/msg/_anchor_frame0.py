# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from master_msg/anchor_frame0.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import master_msg.msg

class anchor_frame0(genpy.Message):
  _md5sum = "2256282624134041b30a05c8a25f1684"
  _type = "master_msg/anchor_frame0"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """uint8 id
float32 supplyVoltage
uint32 systemTime
tag_t[] tags


================================================================================
MSG: master_msg/tag_t
uint8 id
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
  __slots__ = ['id','supplyVoltage','systemTime','tags']
  _slot_types = ['uint8','float32','uint32','master_msg/tag_t[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       id,supplyVoltage,systemTime,tags

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(anchor_frame0, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.id is None:
        self.id = 0
      if self.supplyVoltage is None:
        self.supplyVoltage = 0.
      if self.systemTime is None:
        self.systemTime = 0
      if self.tags is None:
        self.tags = []
    else:
      self.id = 0
      self.supplyVoltage = 0.
      self.systemTime = 0
      self.tags = []

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
      buff.write(_get_struct_BfI().pack(_x.id, _x.supplyVoltage, _x.systemTime))
      length = len(self.tags)
      buff.write(_struct_I.pack(length))
      for val1 in self.tags:
        buff.write(_get_struct_B().pack(val1.id))
        _v1 = val1.position
        _x = _v1
        buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
        for val2 in val1.anchors:
          _x = val2
          buff.write(_get_struct_Bf().pack(_x.id, _x.distance))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.tags is None:
        self.tags = None
      end = 0
      _x = self
      start = end
      end += 9
      (_x.id, _x.supplyVoltage, _x.systemTime,) = _get_struct_BfI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.tags = []
      for i in range(0, length):
        val1 = master_msg.msg.tag_t()
        start = end
        end += 1
        (val1.id,) = _get_struct_B().unpack(str[start:end])
        _v2 = val1.position
        _x = _v2
        start = end
        end += 12
        (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
        val1.anchors = []
        for i in range(0, 4):
          val2 = master_msg.msg.tag_to_anchor_dis_t()
          _x = val2
          start = end
          end += 5
          (_x.id, _x.distance,) = _get_struct_Bf().unpack(str[start:end])
          val1.anchors.append(val2)
        self.tags.append(val1)
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
      buff.write(_get_struct_BfI().pack(_x.id, _x.supplyVoltage, _x.systemTime))
      length = len(self.tags)
      buff.write(_struct_I.pack(length))
      for val1 in self.tags:
        buff.write(_get_struct_B().pack(val1.id))
        _v3 = val1.position
        _x = _v3
        buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
        for val2 in val1.anchors:
          _x = val2
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
      if self.tags is None:
        self.tags = None
      end = 0
      _x = self
      start = end
      end += 9
      (_x.id, _x.supplyVoltage, _x.systemTime,) = _get_struct_BfI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.tags = []
      for i in range(0, length):
        val1 = master_msg.msg.tag_t()
        start = end
        end += 1
        (val1.id,) = _get_struct_B().unpack(str[start:end])
        _v4 = val1.position
        _x = _v4
        start = end
        end += 12
        (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
        val1.anchors = []
        for i in range(0, 4):
          val2 = master_msg.msg.tag_to_anchor_dis_t()
          _x = val2
          start = end
          end += 5
          (_x.id, _x.distance,) = _get_struct_Bf().unpack(str[start:end])
          val1.anchors.append(val2)
        self.tags.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_BfI = None
def _get_struct_BfI():
    global _struct_BfI
    if _struct_BfI is None:
        _struct_BfI = struct.Struct("<BfI")
    return _struct_BfI
_struct_B = None
def _get_struct_B():
    global _struct_B
    if _struct_B is None:
        _struct_B = struct.Struct("<B")
    return _struct_B
_struct_3f = None
def _get_struct_3f():
    global _struct_3f
    if _struct_3f is None:
        _struct_3f = struct.Struct("<3f")
    return _struct_3f
_struct_Bf = None
def _get_struct_Bf():
    global _struct_Bf
    if _struct_Bf is None:
        _struct_Bf = struct.Struct("<Bf")
    return _struct_Bf