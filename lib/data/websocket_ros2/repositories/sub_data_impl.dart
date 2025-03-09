import 'package:ros_flutter/data/websocket_ros2/data_source/sub_data_source.dart';
import 'package:ros_flutter/domain/models/string.dart';
import 'package:injectable/injectable.dart';
import 'package:ros_flutter/domain/repositories/sub_repos.dart';
import 'package:logger/logger.dart';

@Injectable(as: RosSubRepo)
class SubRepositoryImpl implements RosSubRepo {
  final SubDataSource _subDataSource;
  SubRepositoryImpl(this._subDataSource);
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
    _subDataSource.pubString("topic", "Hello");
  }

  @override
  void subString(topic, dataRef) {
    _subDataSource.subString(topic, dataRef);
  }
}
