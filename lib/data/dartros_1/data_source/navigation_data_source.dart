import 'package:get/get.dart';
import 'package:ros_flutter/data/dartros_1/data_source/msgs/geometry_msgs/lib/src/msgs/Twist.dart';
import 'package:ros_flutter/data/dartros_1/data_source/msgs/nav_msgs/lib/src/msgs/OccupancyGrid.dart';
import 'package:ros_flutter/data/dartros_1/data_source/msgs/nav_msgs/lib/src/srvs/GetMap.dart';
import 'package:ros_flutter/domain/models/occupancy_grid.dart';
import 'package:ros_flutter/domain/models/twist.dart';
import 'package:ros_flutter/data/dartros_1/resources/ros_node.dart';

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

  void pubVelocity(String topic, RosTwist velocity) {
    final velMsg = Twist()
      ..linear.x = velocity.linear.x
      ..linear.y = velocity.linear.y
      ..angular.z = velocity.angular.z;
    // TODO: create a single pub instance
    final pub = ros.node.advertise<Twist>("/cmd_vel", Twist.$prototype);
    pub.publish(velMsg, 1);
  }

  void subMap(String topic, Rxn<RosOccupancyGrid> dataRef) {
    ros.node.subscribe<OccupancyGrid>(topic, OccupancyGrid.$prototype,
        (message) {
      print('Got ${message.data}');
    });
  }
}
