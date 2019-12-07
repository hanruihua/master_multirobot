# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from master_msg/node_frame1.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import master_msg.msg

class node_frame1(genpy.Message):
  _md5sum = "0ed118520974e3023cb1cc203f2d31a4"
  _type = "master_msg/node_frame1"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """uint8 role
uint8 id
uint32 systemTime
float32 supplyVoltage
node1_t[] nodes

================================================================================
MSG: master_msg/node1_t
uint8 role
uint8 id
vector3d_t position

================================================================================
MSG: master_msg/vector3d_t
float32 x
float32 y
float32 z
"""
  __slots__ = ['role','id','systemTime','supplyVoltage','nodes']
  _slot_types = ['uint8','uint8','uint32','float32','master_msg/node1_t[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       role,id,systemTime,supplyVoltage,nodes

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(node_frame1, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.role is None:
        self.role = 0
      if self.id is None:
        self.id = 0
      if self.systemTime is None:
        self.systemTime = 0
      if self.supplyVoltage is None:
        self.supplyVoltage = 0.
      if self.nodes is None:
        self.nodes = []
    else:
      self.role = 0
      self.id = 0
      self.systemTime = 0
      self.supplyVoltage = 0.
      self.nodes = []

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
      buff.write(_get_struct_2BIf().pack(_x.role, _x.id, _x.systemTime, _x.supplyVoltage))
      length = len(self.nodes)
      buff.write(_struct_I.pack(length))
      for val1 in self.nodes:
        _x = val1
        buff.write(_get_struct_2B().pack(_x.role, _x.id))
        _v1 = val1.position
        _x = _v1
        buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.nodes is None:
        self.nodes = None
      end = 0
      _x = self
      start = end
      end += 10
      (_x.role, _x.id, _x.systemTime, _x.supplyVoltage,) = _get_struct_2BIf().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.nodes = []
      for i in range(0, length):
        val1 = master_msg.msg.node1_t()
        _x = val1
        start = end
        end += 2
        (_x.role, _x.id,) = _get_struct_2B().unpack(str[start:end])
        _v2 = val1.position
        _x = _v2
        start = end
        end += 12
        (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
        self.nodes.append(val1)
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
      buff.write(_get_struct_2BIf().pack(_x.role, _x.id, _x.systemTime, _x.supplyVoltage))
      length = len(self.nodes)
      buff.write(_struct_I.pack(length))
      for val1 in self.nodes:
        _x = val1
        buff.write(_get_struct_2B().pack(_x.role, _x.id))
        _v3 = val1.position
        _x = _v3
        buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.nodes is None:
        self.nodes = None
      end = 0
      _x = self
      start = end
      end += 10
      (_x.role, _x.id, _x.systemTime, _x.supplyVoltage,) = _get_struct_2BIf().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.nodes = []
      for i in range(0, length):
        val1 = master_msg.msg.node1_t()
        _x = val1
        start = end
        end += 2
        (_x.role, _x.id,) = _get_struct_2B().unpack(str[start:end])
        _v4 = val1.position
        _x = _v4
        start = end
        end += 12
        (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
        self.nodes.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2BIf = None
def _get_struct_2BIf():
    global _struct_2BIf
    if _struct_2BIf is None:
        _struct_2BIf = struct.Struct("<2BIf")
    return _struct_2BIf
_struct_2B = None
def _get_struct_2B():
    global _struct_2B
    if _struct_2B is None:
        _struct_2B = struct.Struct("<2B")
    return _struct_2B
_struct_3f = None
def _get_struct_3f():
    global _struct_3f
    if _struct_3f is None:
        _struct_3f = struct.Struct("<3f")
    return _struct_3f