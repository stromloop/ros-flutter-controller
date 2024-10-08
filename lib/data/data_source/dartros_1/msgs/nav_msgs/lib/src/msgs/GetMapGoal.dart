// Auto-generated. Do not edit!

// Updated: Sun Aug 18 08:47:56 2024

// (in-package nav_msgs.msg)


// ignore_for_file: type=lint
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros_msgutils/msg_utils.dart';

//-----------------------------------------------------------

class GetMapGoal extends RosMessage<GetMapGoal> {
  static GetMapGoal $prototype = GetMapGoal();
  GetMapGoal();

  @override
  GetMapGoal call() => GetMapGoal();

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type GetMapGoal
  }

  @override
  GetMapGoal deserialize(ByteDataReader reader) {
    //deserializes a message object of type GetMapGoal
    final data = GetMapGoal();
    return data;
  }

  int getMessageSize() {
    return 0;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'nav_msgs/GetMapGoal';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Get the map as a nav_msgs/OccupancyGrid

''';
  }

}

