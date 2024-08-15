import 'package:get/get.dart';
import 'package:ros_flutter/domain/models/string.dart';

// TODO find a proper name for repos 
abstract class RosSubRepo {
Future<RosString> getParam();
Future<RosString> setParam(String paramName,String paramValue);
void pubString(String topic,String payload);
void subString(String topic,RxString dataRef);
}
