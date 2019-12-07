// Auto-generated. Do not edit!

// (in-package master_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class system_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.product_name = null;
      this.hardware_version = null;
      this.firmware_version = null;
      this.baudrate = null;
    }
    else {
      if (initObj.hasOwnProperty('product_name')) {
        this.product_name = initObj.product_name
      }
      else {
        this.product_name = '';
      }
      if (initObj.hasOwnProperty('hardware_version')) {
        this.hardware_version = initObj.hardware_version
      }
      else {
        this.hardware_version = '';
      }
      if (initObj.hasOwnProperty('firmware_version')) {
        this.firmware_version = initObj.firmware_version
      }
      else {
        this.firmware_version = '';
      }
      if (initObj.hasOwnProperty('baudrate')) {
        this.baudrate = initObj.baudrate
      }
      else {
        this.baudrate = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type system_info
    // Serialize message field [product_name]
    bufferOffset = _serializer.string(obj.product_name, buffer, bufferOffset);
    // Serialize message field [hardware_version]
    bufferOffset = _serializer.string(obj.hardware_version, buffer, bufferOffset);
    // Serialize message field [firmware_version]
    bufferOffset = _serializer.string(obj.firmware_version, buffer, bufferOffset);
    // Serialize message field [baudrate]
    bufferOffset = _serializer.int32(obj.baudrate, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type system_info
    let len;
    let data = new system_info(null);
    // Deserialize message field [product_name]
    data.product_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [hardware_version]
    data.hardware_version = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [firmware_version]
    data.firmware_version = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [baudrate]
    data.baudrate = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.product_name.length;
    length += object.hardware_version.length;
    length += object.firmware_version.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'master_msg/system_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7aebdbbdd195647dad628f7de30a6855';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string product_name
    string hardware_version
    string firmware_version
    int32 baudrate
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new system_info(null);
    if (msg.product_name !== undefined) {
      resolved.product_name = msg.product_name;
    }
    else {
      resolved.product_name = ''
    }

    if (msg.hardware_version !== undefined) {
      resolved.hardware_version = msg.hardware_version;
    }
    else {
      resolved.hardware_version = ''
    }

    if (msg.firmware_version !== undefined) {
      resolved.firmware_version = msg.firmware_version;
    }
    else {
      resolved.firmware_version = ''
    }

    if (msg.baudrate !== undefined) {
      resolved.baudrate = msg.baudrate;
    }
    else {
      resolved.baudrate = 0
    }

    return resolved;
    }
};

module.exports = system_info;
