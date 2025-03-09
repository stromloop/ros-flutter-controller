import 'package:ros_flutter/domain/models/string.dart';
import 'package:injectable/injectable.dart';
import 'package:ros_flutter/domain/repositories/sub_repos.dart';
import 'package:logger/logger.dart';

@Injectable(as: RosSubRepo)
class SubRepositoryImpl implements RosSubRepo {
  var logger = Logger(level: Level.debug); // Set verbosity to debug

  @override
  Future<RosString> getParam() async {
    logger.d("place holder");
    return Future.value(RosString(name: "place holder"));
  }

  @override
  Future<RosString> setParam(String paramName, String paramValue) async {
    logger.d("place holder");
    return Future.value(RosString(name: "place holder"));
  }

  @override
  void pubString(String topic, payload) {
    logger.d("place holder");
  }

  @override
  void subString(topic, dataRef) {
    logger.d("place holder");
  }
}
