import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ros_flutter/data/dartros_1/resources/ros_node.dart';

@module
abstract class RegisterModule {
  // Inject SharedPreferences

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  //TODO possible double invocation - warning during node start (Node already started)
  //TODO find a way to dynamically import roshandlers
  @singleton
  RosHandler rosHandler(SharedPreferences sh) => RosHandler(sh);
}
