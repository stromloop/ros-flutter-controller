import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';
import 'package:ros_flutter/data/dartros_1/data_source/navigation_data_source.dart';
import 'package:ros_flutter/domain/models/occupancy_grid.dart';
import 'package:ros_flutter/domain/models/twist.dart';
import 'package:ros_flutter/domain/repositories/navigation_repo.dart';

@Injectable(as: RosNavRepo)
class RosNavRepoImpl implements RosNavRepo {
  final NavDataSource _navDataSource;
  RosNavRepoImpl(this._navDataSource);

  @override
  void subMapData(String topic, Rxn<RosOccupancyGrid> dataRef) =>
      _navDataSource.subMap(topic, dataRef);
  @override
  Future<RosOccupancyGrid> getMapData() => _navDataSource.getMap();
  @override
  void pubVelocity(String topic, RosTwist velocity) =>
      _navDataSource.pubVelocity(topic, velocity);
}
