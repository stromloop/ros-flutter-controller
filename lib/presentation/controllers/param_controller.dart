import 'package:get/get.dart';
import 'package:ros_flutter/config/injection/injection.dart';
import 'package:ros_flutter/data/sub_data_source.dart';

class ParamController extends GetxController {
  final paramValue = ''.obs;
  Future<void> getFoo() async {
    final dataSource = locator<SubDataSource>();
    final param = await dataSource.getParam();
    print("Getting Param");
    paramValue.value = param.name;
  }
}
