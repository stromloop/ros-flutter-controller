// Auto-generated. Do not edit!

// Updated: Sun Aug 18 08:47:58 2024

// (in-package geometry_msgs.msg)


// ignore_for_file: type=lint
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros_msgutils/msg_utils.dart';
import 'Vector3.dart';

//-----------------------------------------------------------

class Twist extends RosMessage<Twist> {
  Vector3 linear;

  Vector3 angular;

  static Twist $prototype = Twist();
  Twist({ 
    Vector3? linear,
    Vector3? angular,
  }):
  this.linear = linear ?? Vector3(),
  this.angular = angular ?? Vector3();

  @override
  Twist call({ 
    Vector3? linear,
    Vector3? angular,
  }) => Twist(
  linear: linear,
  angular: angular,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type Twist
    // Serialize message field [linear]
    linear.serialize(writer);
    // Serialize message field [angular]
    angular.serialize(writer);
  }

  @override
  Twist deserialize(ByteDataReader reader) {
    //deserializes a message object of type Twist
    final data = Twist();
    // Deserialize message field [linear]
    data.linear = Vector3.$prototype.deserialize(reader);
    // Deserialize message field [angular]
    data.angular = Vector3.$prototype.deserialize(reader);
    return data;
  }

  int getMessageSize() {
    return 48;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geometry_msgs/Twist';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '9f195f881246fdfa2798d1d3eebca84a';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
''';
  }

}

