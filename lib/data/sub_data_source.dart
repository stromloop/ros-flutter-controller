import 'package:dartros/dartros.dart';
import 'package:injectable/injectable.dart';
import 'package:ros_flutter/domain/models/string.dart';


class SubDataSource {
  NodeHandle _nh;
  SubDataSource(this._nh);
  Future<RosString> getParam() async {
    String value = await _nh.getParam('/foo');
    RosString _rosstring = RosString(name: value);
    return _rosstring;
  }
}
