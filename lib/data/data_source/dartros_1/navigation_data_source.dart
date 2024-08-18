import 'package:get/get.dart';
import 'package:ros_flutter/data/data_source/dartros_1/msgs/nav_msgs/lib/src/msgs/OccupancyGrid.dart';
import 'package:ros_flutter/domain/models/occupancy_grid.dart';
import 'package:ros_flutter/utils/resources/ros_node.dart';

class NavDataSource {
	RosHandler ros;
	NavDataSource(this.ros);

	void subMap(String topic,Rxn<RosOccupancyGrid> dataRef){
  ros.node.subscribe<OccupancyGrid>(
      topic, OccupancyGrid.$prototype, (message) {
    print('Got ${message.data}');
  });
  }
	
}
