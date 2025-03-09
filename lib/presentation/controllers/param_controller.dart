import 'package:get/get.dart';
import 'package:ros_flutter/config/injection/injection.dart';
import 'package:ros_flutter/data/dartros_1/data_source/sub_data_source.dart';

class ParamController extends GetxController {
  final paramValue = ''.obs;
  final dataSource = locator<SubDataSource>();
  final subDataString = "".obs;
  Future<void> getFoo() async {
    final param = await dataSource.getParam();
    print("paramName : ${param.name}");
    print("Getting Param");
    paramValue.value = param.name;
  }

  Future<void> setParam(String paramName, String param) async {
    if (paramName.isEmpty || param.isEmpty) {
      Get.snackbar(
        "Error",
        "Both fields must be filled",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    await dataSource.setParam(paramName, param);
  }
  void pubString (){
  	dataSource.pubString("/hello", "Hello world");
  }
  void subString(){
	dataSource.subString("/chatter",subDataString);
  }
}
