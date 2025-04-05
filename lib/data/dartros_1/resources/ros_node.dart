import 'package:dartros/dartros.dart';
import 'package:dartros/dartros.dart' as dartros;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class RosHandler {
  RosHandler(this.sharedPreferences);
  late NodeHandle node;

  final SharedPreferences sharedPreferences;
  Future<void> initNode() async {
    print("Init Node");
    final master_uri = await sharedPreferences.get("ROS_MASTER_IP");
    print(master_uri);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kkmmss').format(now);
    node = await dartros.initNode('ros_node2$formattedDate', [],
        // TODO [#14]: get rosmaster uri from shared pref
        rosMasterUri: "http://${master_uri.toString()}:11311");
    // return node;
  }
}
