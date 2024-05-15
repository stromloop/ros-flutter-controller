import 'package:dartros/dartros.dart';
import 'package:ros_flutter/domain/models/string.dart';

abstract class SubDataSource  {
SubDataSource(NodeHandle nh);
Future<RosString> getParam();
}
