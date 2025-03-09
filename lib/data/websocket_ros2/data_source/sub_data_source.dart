import 'package:get/get.dart';
import 'package:ros_flutter/domain/models/string.dart';
import 'package:ros_flutter/data/websocket_ros2/resources/ros_node.dart';

class SubDataSource {
  RosHandler ros;
  SubDataSource(this.ros);
  Future<RosString> getParam() async {
    return const RosString(name: "Error");
  }

  Future<RosString> setParam(paramName, param) async {
    return const RosString(name: "Error");
  }

  void pubString(String topic, String payload) {

    print("place holders");
  }

  void subString(String topic, RxString dataRef) {}
}
