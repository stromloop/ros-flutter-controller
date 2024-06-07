import 'package:dartros/dartros.dart';
import 'package:get/get.dart';
import 'package:ros_flutter/domain/models/string.dart';
import 'package:ros_flutter/utils/resources/ros_node.dart';

class SubDataSource {
  RosHandler ros;
  SubDataSource(this.ros);
  Future<RosString> getParam() async {
    try {
      String value = await ros.node.getParam('/foo');
      RosString _rosstring = RosString(name: value);
      return _rosstring;
    } catch (e) {
    //
       Get.snackbar("Login failed", "Master not connected",
            snackPosition: SnackPosition.BOTTOM);
      return RosString(name: "Error");
    }
  }
}
