import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dartros/dartros.dart' as dartros;
import 'package:ros_flutter/utils/resources/ros_node.dart';

@module
abstract class RegisterModule {
  // Inject SharedPreferences

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  //TODO possible double invocation - warning during node start (Node already started)
  @singleton
  RosHandler rosHandler(SharedPreferences sh) => RosHandler(sh);
}
