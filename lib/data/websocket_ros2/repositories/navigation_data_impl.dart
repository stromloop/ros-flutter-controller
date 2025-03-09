import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:ros_flutter/domain/models/occupancy_grid.dart';
import 'package:ros_flutter/domain/models/twist.dart';
import 'package:ros_flutter/domain/repositories/navigation_repo.dart';

@Injectable(as: RosNavRepo)
class RosNavRepoImpl implements RosNavRepo {
  var logger = Logger(level: Level.debug); // Set verbosity to debug

  @override
  void subMapData(String topic, Rxn<RosOccupancyGrid> dataRef) {
    logger.d("place holder invoked");
  }

  @override
  Future<RosOccupancyGrid> getMapData() => Future(() {
        logger.d("place holder invoked");
        return RosOccupancyGrid();
      });

  @override
  void pubVelocity(String topic, RosTwist velocity) {
    logger.d("place holder invoked");
  }
}
