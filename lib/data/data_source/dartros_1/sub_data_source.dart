import 'package:get/get.dart';
import 'package:ros_flutter/domain/models/string.dart';
import 'package:ros_flutter/utils/resources/ros_node.dart';

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
}
