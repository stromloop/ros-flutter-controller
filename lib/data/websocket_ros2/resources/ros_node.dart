import 'package:dartros/dartros.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class RosHandler {
  RosHandler(this.sharedPreferences);
  late NodeHandle node;

  final SharedPreferences sharedPreferences;
  Future<NodeHandle> initNode() async {
    print("Init Node");
    final master_uri = await sharedPreferences.get("ROS_MASTER_IP");
    print(master_uri);
    return node;
  }
}
