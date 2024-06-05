import 'package:dartros/dartros.dart';
import 'package:injectable/injectable.dart';
import 'package:ros_flutter/data/sub_data_source.dart';
import 'package:ros_flutter/utils/resources/ros_node.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataSourceInjectionModule {
  @singleton
  SubDataSource subDataSource(RosHandler ros) => SubDataSource(ros);

}