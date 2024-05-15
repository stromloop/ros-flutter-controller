import 'package:ros_flutter/domain/models/string.dart';

// TODO find a proper name for repos 
abstract class RosSubRepo {
Future<RosString> getParam();
}
