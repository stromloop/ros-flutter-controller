import 'package:dartros/dartros.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RosHandler {
  RosHandler(this.sharedPreferences);
  late Uri nodeUri;

  final SharedPreferences sharedPreferences;
  Future<void> initNode() async {
    print("Init Node");
    final master_uri = await sharedPreferences.get("ROS_MASTER_IP");
    print(master_uri);
      nodeUri = Uri.parse('ws://$master_uri:9090'); // ROSBridge WebSocket URL
  }
}
