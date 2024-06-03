import 'package:dartros/dartros.dart';
import 'package:injectable/injectable.dart';
import 'package:ros_flutter/data/sub_data_source.dart';

@module
abstract class DataSourceInjectionModule {
  // SubDataSource _subDataSource(NodeHandle nh) => SubDataSource(nh);
// TODO implement propper injectable
  SubDataSource get _subDataSource => SubDataSource(nh);
}
// 