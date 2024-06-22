import 'package:ros_flutter/data/data_source/dartros_1/sub_data_source.dart';
import 'package:ros_flutter/domain/models/string.dart';
import 'package:injectable/injectable.dart';
import 'package:ros_flutter/domain/repositories/sub_repos.dart';

@Injectable(as: RosSubRepo)
class SubRepositoryImpl implements RosSubRepo {
  final SubDataSource _subDataSource;
  SubRepositoryImpl(this._subDataSource);
  @override
  Future<RosString> getParam() => _subDataSource.getParam();
  @override
  Future<RosString> setParam(paramName, paramValue) =>
      _subDataSource.setParam(paramName,paramValue);
}
