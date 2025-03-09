import 'package:get/get.dart';
import 'package:ros_flutter/domain/models/occupancy_grid.dart';
import 'package:ros_flutter/domain/models/twist.dart';
import 'package:ros_flutter/data/websocket_ros2/resources/ros_node.dart';

class NavDataSource {
  RosHandler ros;
  NavDataSource(this.ros);
  Future<RosOccupancyGrid> getMap() async {

    final occupancyGrid = RosOccupancyGrid();


    return occupancyGrid;
  }

  void pubVelocity(String topic, RosTwist velocity) {


  }

  void subMap(String topic, Rxn<RosOccupancyGrid> dataRef) {

  }
}
