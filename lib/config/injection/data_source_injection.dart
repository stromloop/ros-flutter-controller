import 'package:dartros/dartros.dart';
import 'package:injectable/injectable.dart';
import 'package:ros_flutter/data/dartros_1/data_source/navigation_data_source.dart';
import 'package:ros_flutter/data/dartros_1/data_source/sub_data_source.dart';
import 'package:ros_flutter/data/dartros_1/resources/ros_node.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataSourceInjectionModule {
  @singleton
  SubDataSource subDataSource(RosHandler ros) => SubDataSource(ros);

  @singleton
  NavDataSource navDataSource(RosHandler ros) => NavDataSource(ros);
}
