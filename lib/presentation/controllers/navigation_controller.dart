import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ros_flutter/config/injection/injection.dart';
import 'package:ros_flutter/domain/models/occupancy_grid.dart';
import 'package:ros_flutter/domain/models/twist.dart';
import 'package:ros_flutter/domain/repositories/navigation_repo.dart';
import 'dart:ui' as ui;
import 'package:logger/logger.dart';

class NavigationController extends GetxController {
  var logger = Logger();
  final navDataSource = locator<RosNavRepo>();
  final mapImage = Rxn<ui.Image>();
  var map = RosOccupancyGrid();
  void subMap() async {
    map = await navDataSource.getMapData();
    logger.v("Got map data");
    final img = await map.getMapAsImage(Colors.white, Colors.black);
    mapImage.value = img;
    print(img);
  }

  void pubVelocity(listener) {
    navDataSource.pubVelocity(
        "/cmd_vel",
        RosTwist()
          ..linear.x = listener.x
          ..linear.y = listener.y);
  }
}
