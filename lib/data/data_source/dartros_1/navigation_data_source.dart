import 'package:get/get.dart';
import 'package:ros_flutter/data/data_source/dartros_1/msgs/nav_msgs/lib/src/msgs/OccupancyGrid.dart';
import 'package:ros_flutter/data/data_source/dartros_1/msgs/nav_msgs/lib/src/srvs/GetMap.dart';
import 'package:ros_flutter/domain/models/occupancy_grid.dart';
import 'package:ros_flutter/utils/resources/ros_node.dart';

class NavDataSource {
  RosHandler ros;
  NavDataSource(this.ros);
  Future<RosOccupancyGrid> getMap() async {
    final mapRequest = GetMapRequest();
    final getMap = ros.node.serviceClient("/static_map", GetMap.$prototype);
    final map = await getMap(mapRequest);

    final occupancyGrid = RosOccupancyGrid()
      ..data = map.map.data
      ..resolution = map.map.info.resolution
      ..width = map.map.info.width
      ..height = map.map.info.height;

    return occupancyGrid;
  }

  void subMap(String topic, Rxn<RosOccupancyGrid> dataRef) {
    ros.node.subscribe<OccupancyGrid>(topic, OccupancyGrid.$prototype,
        (message) {
      print('Got ${message.data}');
    });
  }
}
