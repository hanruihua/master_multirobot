// Auto-generated. Do not edit!

// (in-package master_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let tag_t = require('./tag_t.js');

//-----------------------------------------------------------

class anchor_frame0 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.supplyVoltage = null;
      this.systemTime = null;
      this.tags = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('supplyVoltage')) {
        this.supplyVoltage = initObj.supplyVoltage
      }
      else {
        this.supplyVoltage = 0.0;
      }
      if (initObj.hasOwnProperty('systemTime')) {
        this.systemTime = initObj.systemTime
      }
      else {
        this.systemTime = 0;
      }
      if (initObj.hasOwnProperty('tags')) {
        this.tags = initObj.tags
      }
      else {
        this.tags = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type anchor_frame0
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [supplyVoltage]
    bufferOffset = _serializer.float32(obj.supplyVoltage, buffer, bufferOffset);
    // Serialize message field [systemTime]
    bufferOffset = _serializer.uint32(obj.systemTime, buffer, bufferOffset);
    // Serialize message field [tags]
    // Serialize the length for message field [tags]
    bufferOffset = _serializer.uint32(obj.tags.length, buffer, bufferOffset);
    obj.tags.forEach((val) => {
      bufferOffset = tag_t.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type anchor_frame0
    let len;
    let data = new anchor_frame0(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [supplyVoltage]
    data.supplyVoltage = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [systemTime]
    data.systemTime = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [tags]
    // Deserialize array length for message field [tags]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.tags = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.tags[i] = tag_t.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 18 * object.tags.length;
    return length + 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'master_msg/anchor_frame0';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2256282624134041b30a05c8a25f1684';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 id
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new anchor_frame0(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.supplyVoltage !== undefined) {
      resolved.supplyVoltage = msg.supplyVoltage;
    }
    else {
      resolved.supplyVoltage = 0.0
    }

    if (msg.systemTime !== undefined) {
      resolved.systemTime = msg.systemTime;
    }
    else {
      resolved.systemTime = 0
    }

    if (msg.tags !== undefined) {
      resolved.tags = new Array(msg.tags.length);
      for (let i = 0; i < resolved.tags.length; ++i) {
        resolved.tags[i] = tag_t.Resolve(msg.tags[i]);
      }
    }
    else {
      resolved.tags = []
    }

    return resolved;
    }
};

module.exports = anchor_frame0;
