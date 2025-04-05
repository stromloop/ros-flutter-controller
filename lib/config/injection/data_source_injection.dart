import 'package:injectable/injectable.dart';
// TODO [#10]: dynamically import or use named singletons 
// https://pub.dev/packages/injectable#binding-an-abstract-class-to-multiple-implementations
// import 'package:ros_flutter/data/dartros_1/data_source/navigation_data_source.dart';
// import 'package:ros_flutter/data/dartros_1/data_source/sub_data_source.dart';
// import 'package:ros_flutter/data/dartros_1/resources/ros_node.dart';
import 'package:ros_flutter/data/websocket_ros2/data_source/navigation_data_source.dart';
import 'package:ros_flutter/data/websocket_ros2/data_source/sub_data_source.dart';
import 'package:ros_flutter/data/websocket_ros2/resources/ros_node.dart';

@module
abstract class DataSourceInjectionModule {
  @singleton
  SubDataSource subDataSource(RosHandler ros) => SubDataSource(ros);

  @singleton
  NavDataSource navDataSource(RosHandler ros) => NavDataSource(ros);
}
