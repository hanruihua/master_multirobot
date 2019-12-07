// Generated by gencpp from file master_msg/tag_t.msg
// DO NOT EDIT!


#ifndef MASTER_MSG_MESSAGE_TAG_T_H
#define MASTER_MSG_MESSAGE_TAG_T_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <master_msg/vector3d_t.h>
#include <master_msg/tag_to_anchor_dis_t.h>

namespace master_msg
{
template <class ContainerAllocator>
struct tag_t_
{
  typedef tag_t_<ContainerAllocator> Type;

  tag_t_()
    : id(0)
    , position()
    , anchors()  {
    }
  tag_t_(const ContainerAllocator& _alloc)
    : id(0)
    , position(_alloc)
    , anchors()  {
  (void)_alloc;
      anchors.assign( ::master_msg::tag_to_anchor_dis_t_<ContainerAllocator> (_alloc));
  }



   typedef uint8_t _id_type;
  _id_type id;

   typedef  ::master_msg::vector3d_t_<ContainerAllocator>  _position_type;
  _position_type position;

   typedef boost::array< ::master_msg::tag_to_anchor_dis_t_<ContainerAllocator> , 4>  _anchors_type;
  _anchors_type anchors;





  typedef boost::shared_ptr< ::master_msg::tag_t_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::master_msg::tag_t_<ContainerAllocator> const> ConstPtr;

}; // struct tag_t_

typedef ::master_msg::tag_t_<std::allocator<void> > tag_t;

typedef boost::shared_ptr< ::master_msg::tag_t > tag_tPtr;
typedef boost::shared_ptr< ::master_msg::tag_t const> tag_tConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::master_msg::tag_t_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::master_msg::tag_t_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace master_msg

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'master_msg': ['/home/ubuntu/catkin_ws/src/master_multirobot/master_msg/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::master_msg::tag_t_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::master_msg::tag_t_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::master_msg::tag_t_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::master_msg::tag_t_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::master_msg::tag_t_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::master_msg::tag_t_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::master_msg::tag_t_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4358caa9602ca48b1d884eff71f8bc31";
  }

  static const char* value(const ::master_msg::tag_t_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4358caa9602ca48bULL;
  static const uint64_t static_value2 = 0x1d884eff71f8bc31ULL;
};

template<class ContainerAllocator>
struct DataType< ::master_msg::tag_t_<ContainerAllocator> >
{
  static const char* value()
  {
    return "master_msg/tag_t";
  }

  static const char* value(const ::master_msg::tag_t_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::master_msg::tag_t_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 id\n\
vector3d_t position\n\
tag_to_anchor_dis_t[4] anchors\n\
\n\
================================================================================\n\
MSG: master_msg/vector3d_t\n\
float32 x\n\
float32 y\n\
float32 z\n\
\n\
================================================================================\n\
MSG: master_msg/tag_to_anchor_dis_t\n\
uint8 id\n\
float32 distance\n\
";
  }

  static const char* value(const ::master_msg::tag_t_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::master_msg::tag_t_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.position);
      stream.next(m.anchors);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct tag_t_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::master_msg::tag_t_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::master_msg::tag_t_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.id);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::master_msg::vector3d_t_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
    s << indent << "anchors[]" << std::endl;
    for (size_t i = 0; i < v.anchors.size(); ++i)
    {
      s << indent << "  anchors[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::master_msg::tag_to_anchor_dis_t_<ContainerAllocator> >::stream(s, indent + "    ", v.anchors[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MASTER_MSG_MESSAGE_TAG_T_H