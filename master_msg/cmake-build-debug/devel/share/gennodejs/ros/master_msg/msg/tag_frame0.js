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

//-----------------------------------------------------------

class tag_frame0 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.position = null;
      this.velocity = null;
      this.distances = null;
      this.imuGyro = null;
      this.imuAcc = null;
      this.angle = null;
      this.quaternions = null;
      this.systemTime = null;
      this.accWorkNormal = null;
      this.accIsOnLine = null;
      this.gyroWorkNormal = null;
      this.gyroIsOnLine = null;
      this.eop = null;
      this.supplyVoltage = null;
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
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new vector3d_t();
      }
      if (initObj.hasOwnProperty('distances')) {
        this.distances = initObj.distances
      }
      else {
        this.distances = new Array(8).fill(0);
      }
      if (initObj.hasOwnProperty('imuGyro')) {
        this.imuGyro = initObj.imuGyro
      }
      else {
        this.imuGyro = new vector3d_t();
      }
      if (initObj.hasOwnProperty('imuAcc')) {
        this.imuAcc = initObj.imuAcc
      }
      else {
        this.imuAcc = new vector3d_t();
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = new vector3d_t();
      }
      if (initObj.hasOwnProperty('quaternions')) {
        this.quaternions = initObj.quaternions
      }
      else {
        this.quaternions = new Array(4).fill(0);
      }
      if (initObj.hasOwnProperty('systemTime')) {
        this.systemTime = initObj.systemTime
      }
      else {
        this.systemTime = 0;
      }
      if (initObj.hasOwnProperty('accWorkNormal')) {
        this.accWorkNormal = initObj.accWorkNormal
      }
      else {
        this.accWorkNormal = 0;
      }
      if (initObj.hasOwnProperty('accIsOnLine')) {
        this.accIsOnLine = initObj.accIsOnLine
      }
      else {
        this.accIsOnLine = 0;
      }
      if (initObj.hasOwnProperty('gyroWorkNormal')) {
        this.gyroWorkNormal = initObj.gyroWorkNormal
      }
      else {
        this.gyroWorkNormal = 0;
      }
      if (initObj.hasOwnProperty('gyroIsOnLine')) {
        this.gyroIsOnLine = initObj.gyroIsOnLine
      }
      else {
        this.gyroIsOnLine = 0;
      }
      if (initObj.hasOwnProperty('eop')) {
        this.eop = initObj.eop
      }
      else {
        this.eop = new vector3d_t();
      }
      if (initObj.hasOwnProperty('supplyVoltage')) {
        this.supplyVoltage = initObj.supplyVoltage
      }
      else {
        this.supplyVoltage = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type tag_frame0
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = vector3d_t.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = vector3d_t.serialize(obj.velocity, buffer, bufferOffset);
    // Check that the constant length array field [distances] has the right length
    if (obj.distances.length !== 8) {
      throw new Error('Unable to serialize array field distances - length must be 8')
    }
    // Serialize message field [distances]
    bufferOffset = _arraySerializer.float32(obj.distances, buffer, bufferOffset, 8);
    // Serialize message field [imuGyro]
    bufferOffset = vector3d_t.serialize(obj.imuGyro, buffer, bufferOffset);
    // Serialize message field [imuAcc]
    bufferOffset = vector3d_t.serialize(obj.imuAcc, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = vector3d_t.serialize(obj.angle, buffer, bufferOffset);
    // Check that the constant length array field [quaternions] has the right length
    if (obj.quaternions.length !== 4) {
      throw new Error('Unable to serialize array field quaternions - length must be 4')
    }
    // Serialize message field [quaternions]
    bufferOffset = _arraySerializer.float32(obj.quaternions, buffer, bufferOffset, 4);
    // Serialize message field [systemTime]
    bufferOffset = _serializer.uint32(obj.systemTime, buffer, bufferOffset);
    // Serialize message field [accWorkNormal]
    bufferOffset = _serializer.uint8(obj.accWorkNormal, buffer, bufferOffset);
    // Serialize message field [accIsOnLine]
    bufferOffset = _serializer.uint8(obj.accIsOnLine, buffer, bufferOffset);
    // Serialize message field [gyroWorkNormal]
    bufferOffset = _serializer.uint8(obj.gyroWorkNormal, buffer, bufferOffset);
    // Serialize message field [gyroIsOnLine]
    bufferOffset = _serializer.uint8(obj.gyroIsOnLine, buffer, bufferOffset);
    // Serialize message field [eop]
    bufferOffset = vector3d_t.serialize(obj.eop, buffer, bufferOffset);
    // Serialize message field [supplyVoltage]
    bufferOffset = _serializer.float32(obj.supplyVoltage, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type tag_frame0
    let len;
    let data = new tag_frame0(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = vector3d_t.deserialize(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = vector3d_t.deserialize(buffer, bufferOffset);
    // Deserialize message field [distances]
    data.distances = _arrayDeserializer.float32(buffer, bufferOffset, 8)
    // Deserialize message field [imuGyro]
    data.imuGyro = vector3d_t.deserialize(buffer, bufferOffset);
    // Deserialize message field [imuAcc]
    data.imuAcc = vector3d_t.deserialize(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = vector3d_t.deserialize(buffer, bufferOffset);
    // Deserialize message field [quaternions]
    data.quaternions = _arrayDeserializer.float32(buffer, bufferOffset, 4)
    // Deserialize message field [systemTime]
    data.systemTime = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [accWorkNormal]
    data.accWorkNormal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [accIsOnLine]
    data.accIsOnLine = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gyroWorkNormal]
    data.gyroWorkNormal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gyroIsOnLine]
    data.gyroIsOnLine = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [eop]
    data.eop = vector3d_t.deserialize(buffer, bufferOffset);
    // Deserialize message field [supplyVoltage]
    data.supplyVoltage = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 133;
  }

  static datatype() {
    // Returns string type for a message object
    return 'master_msg/tag_frame0';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '50810e8ed732bc3be1c295ba94186d48';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 id
    vector3d_t position
    vector3d_t velocity
    float32[8] distances
    vector3d_t imuGyro
    vector3d_t imuAcc
    vector3d_t angle
    float32[4] quaternions
    uint32 systemTime
    uint8 accWorkNormal
    uint8 accIsOnLine
    uint8 gyroWorkNormal
    uint8 gyroIsOnLine
    vector3d_t eop
    float32 supplyVoltage
    
    ================================================================================
    MSG: master_msg/vector3d_t
    float32 x
    float32 y
    float32 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new tag_frame0(null);
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

    if (msg.velocity !== undefined) {
      resolved.velocity = vector3d_t.Resolve(msg.velocity)
    }
    else {
      resolved.velocity = new vector3d_t()
    }

    if (msg.distances !== undefined) {
      resolved.distances = msg.distances;
    }
    else {
      resolved.distances = new Array(8).fill(0)
    }

    if (msg.imuGyro !== undefined) {
      resolved.imuGyro = vector3d_t.Resolve(msg.imuGyro)
    }
    else {
      resolved.imuGyro = new vector3d_t()
    }

    if (msg.imuAcc !== undefined) {
      resolved.imuAcc = vector3d_t.Resolve(msg.imuAcc)
    }
    else {
      resolved.imuAcc = new vector3d_t()
    }

    if (msg.angle !== undefined) {
      resolved.angle = vector3d_t.Resolve(msg.angle)
    }
    else {
      resolved.angle = new vector3d_t()
    }

    if (msg.quaternions !== undefined) {
      resolved.quaternions = msg.quaternions;
    }
    else {
      resolved.quaternions = new Array(4).fill(0)
    }

    if (msg.systemTime !== undefined) {
      resolved.systemTime = msg.systemTime;
    }
    else {
      resolved.systemTime = 0
    }

    if (msg.accWorkNormal !== undefined) {
      resolved.accWorkNormal = msg.accWorkNormal;
    }
    else {
      resolved.accWorkNormal = 0
    }

    if (msg.accIsOnLine !== undefined) {
      resolved.accIsOnLine = msg.accIsOnLine;
    }
    else {
      resolved.accIsOnLine = 0
    }

    if (msg.gyroWorkNormal !== undefined) {
      resolved.gyroWorkNormal = msg.gyroWorkNormal;
    }
    else {
      resolved.gyroWorkNormal = 0
    }

    if (msg.gyroIsOnLine !== undefined) {
      resolved.gyroIsOnLine = msg.gyroIsOnLine;
    }
    else {
      resolved.gyroIsOnLine = 0
    }

    if (msg.eop !== undefined) {
      resolved.eop = vector3d_t.Resolve(msg.eop)
    }
    else {
      resolved.eop = new vector3d_t()
    }

    if (msg.supplyVoltage !== undefined) {
      resolved.supplyVoltage = msg.supplyVoltage;
    }
    else {
      resolved.supplyVoltage = 0.0
    }

    return resolved;
    }
};

module.exports = tag_frame0;
