import 'package:get/get.dart';
import 'package:ros_flutter/domain/models/occupancy_grid.dart';
import 'package:ros_flutter/domain/models/twist.dart';

abstract class RosNavRepo {
  void subMapData(String topic, Rxn<RosOccupancyGrid> dataRef);
  Future<RosOccupancyGrid> getMapData();
  void pubVelocity(String topic, RosTwist velocity);
}
