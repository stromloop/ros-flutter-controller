import 'package:dartros/dartros.dart';
import 'package:dartros/dartros.dart' as dartros;
import 'package:shared_preferences/shared_preferences.dart';

class RosHandler {
  RosHandler(this.sharedPreferences);
  late NodeHandle node;

  final  SharedPreferences sharedPreferences;
  void initNode () async{
    print("Init Node");
    // sharedPreferences.setString("RosMaster", "http://192.168.0.122:11311/");
    final master_uri =await sharedPreferences.get("ROS_MASTER_IP");
    print(master_uri);
    node = await dartros.initNode('ros_node2', [],
        //TODO get rosmaster uri from shared pref
        rosMasterUri: "http://${master_uri.toString()}:11311");
  }
}
