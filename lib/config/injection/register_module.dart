import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dartros/dartros.dart' as dartros;

@module
abstract class RegisterModule {
  // Inject SharedPreferences

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  //TODO possible double invocation - warning during node start (Node already started)
  @preResolve
  Future<dartros.NodeHandle> nh() async {
    // TODO add try catch and check if rosmaster exists
    final nh = await dartros.initNode('ros_node2', [],
        //TODO get rosmaster uri from shared pref
        rosMasterUri: 'http://192.168.0.122:11311/');
    return nh;
  }
}
