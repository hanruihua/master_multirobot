// Auto-generated. Do not edit!

// (in-package master_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let vector3d_t = require('./vector3d_t.js');
let tag_to_anchor_dis_t = require('./tag_to_anchor_dis_t.js');

//-----------------------------------------------------------

class tag_t {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.position = null;
      this.anchors = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new vector3d_t();
      }
      if (initObj.hasOwnProperty('anchors')) {
        this.anchors = initObj.anchors
      }
      else {
        this.anchors = new Array(4).fill(new tag_to_anchor_dis_t());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type tag_t
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = vector3d_t.serialize(obj.position, buffer, bufferOffset);
    // Check that the constant length array field [anchors] has the right length
    if (obj.anchors.length !== 4) {
      throw new Error('Unable to serialize array field anchors - length must be 4')
    }
    // Serialize message field [anchors]
    obj.anchors.forEach((val) => {
      bufferOffset = tag_to_anchor_dis_t.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type tag_t
    let len;
    let data = new tag_t(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = vector3d_t.deserialize(buffer, bufferOffset);
    // Deserialize message field [anchors]
    len = 4;
    data.anchors = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.anchors[i] = tag_to_anchor_dis_t.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    return 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'master_msg/tag_t';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4358caa9602ca48b1d884eff71f8bc31';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new tag_t(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.position !== undefined) {
      resolved.position = vector3d_t.Resolve(msg.position)
    }
    else {
      resolved.position = new vector3d_t()
    }

    if (msg.anchors !== undefined) {
      resolved.anchors = new Array(4)
      for (let i = 0; i < resolved.anchors.length; ++i) {
        if (msg.anchors.length > i) {
          resolved.anchors[i] = tag_to_anchor_dis_t.Resolve(msg.anchors[i]);
        }
        else {
          resolved.anchors[i] = new tag_to_anchor_dis_t();
        }
      }
    }
    else {
      resolved.anchors = new Array(4).fill(new tag_to_anchor_dis_t())
    }

    return resolved;
    }
};

module.exports = tag_t;
