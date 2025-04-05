import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
/* TODO: find a way to dynamicaly change import on build 
possible solution https://dartcode.org/docs/using-dart-define-in-flutter/
*/

// import 'package:ros_flutter/data/dartros_1/resources/ros_node.dart';
import 'package:ros_flutter/data/websocket_ros2/resources/ros_node.dart';

@module
abstract class RegisterModule {
  // Inject SharedPreferences

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  // TODO: possible double invocation - warning during node start (Node already started) ros-1
  @singleton
  RosHandler rosHandler(SharedPreferences sh) => RosHandler(sh);
}
