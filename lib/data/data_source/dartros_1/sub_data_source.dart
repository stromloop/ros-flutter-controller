import 'package:get/get.dart';
import 'package:ros_flutter/domain/models/string.dart';
import 'package:ros_flutter/utils/resources/ros_node.dart';
import 'package:std_msgs/msgs.dart';
class SubDataSource {
  RosHandler ros;
  SubDataSource(this.ros);
  Future<RosString> getParam() async {
    try {
      String value = await ros.node.getParam('/foo');
      RosString rosstring = RosString(name: value);
      return rosstring;
    } catch (e) {
      Get.snackbar("Login failed", "Master not connected",
          snackPosition: SnackPosition.BOTTOM);
      return const RosString(name: "Error");
    }
  }

  Future<RosString> setParam(paramName,param) async {
    try {
      await ros.node.setParam(paramName, param);
      return const RosString(name: "Success");
    } catch (e) {
      Get.snackbar("Login failed", "Master not connected",
          snackPosition: SnackPosition.BOTTOM);
      return const RosString(name: "Error");
    }
  }
  void pubString(String topic,String payload){
  final strMsg = StringMessage(data: payload);
  final pub =
      ros.node.advertise<StringMessage>(topic, StringMessage.$prototype);
    pub.publish(strMsg, 1);
  }

  void subString(String topic,RxString dataRef){
  final sub = ros.node.subscribe<StringMessage>(
      '/chatter', StringMessage.$prototype, (message) {
    print('Got ${message.data}');
    dataRef.value = message.data;
  });
  }
}
