// Auto-generated. Do not edit!

// Updated: Sun Aug 18 08:47:56 2024

// (in-package nav_msgs.msg)


// ignore_for_file: type=lint
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros_msgutils/msg_utils.dart';
import 'package:actionlib_msgs/msgs.dart';
import 'package:std_msgs/msgs.dart';
import 'GetMapGoal.dart';

//-----------------------------------------------------------

class GetMapActionGoal extends RosActionGoal<GetMapGoal, GetMapActionGoal> {
  @override
  Header header;

  @override
  GoalID goal_id;

  @override
  GetMapGoal goal;

  static GetMapActionGoal $prototype = GetMapActionGoal();
  GetMapActionGoal({ 
    Header? header,
    GoalID? goal_id,
    GetMapGoal? goal,
  }):
  this.header = header ?? Header(),
  this.goal_id = goal_id ?? GoalID(),
  this.goal = goal ?? GetMapGoal();

  @override
  GetMapActionGoal call({ 
    Header? header,
    GoalID? goal_id,
    GetMapGoal? goal,
  }) => GetMapActionGoal(
  header: header,
  goal_id: goal_id,
  goal: goal,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type GetMapActionGoal
    // Serialize message field [header]
    header.serialize(writer);
    // Serialize message field [goal_id]
    goal_id.serialize(writer);
    // Serialize message field [goal]
    goal.serialize(writer);
  }

  @override
  GetMapActionGoal deserialize(ByteDataReader reader) {
    //deserializes a message object of type GetMapActionGoal
    final data = GetMapActionGoal();
    // Deserialize message field [header]
    data.header = Header.$prototype.deserialize(reader);
    // Deserialize message field [goal_id]
    data.goal_id = GoalID.$prototype.deserialize(reader);
    // Deserialize message field [goal]
    data.goal = GetMapGoal.$prototype.deserialize(reader);
    return data;
  }

  int getMessageSize() {
    var length = 0;
    length += header.getMessageSize();
    length += goal_id.getMessageSize();
    return length;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'nav_msgs/GetMapActionGoal';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '4b30be6cd12b9e72826df56b481f40e0';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

Header header
actionlib_msgs/GoalID goal_id
GetMapGoal goal

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: actionlib_msgs/GoalID
# The stamp should store the time at which this goal was requested.
# It is used by an action server when it tries to preempt all
# goals that were requested before a certain time
time stamp

# The id provides a way to associate feedback and
# result message with specific goal requests. The id
# specified must be unique.
string id


================================================================================
MSG: nav_msgs/GetMapGoal
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Get the map as a nav_msgs/OccupancyGrid

''';
  }

}

