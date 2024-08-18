import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ros_flutter/config/injection/injection.dart';
import 'package:ros_flutter/domain/models/occupancy_grid.dart';
import 'package:ros_flutter/domain/models/twist.dart';
import 'package:ros_flutter/domain/repositories/navigation_repo.dart';
import 'dart:ui' as ui;

class NavigationController extends GetxController {
  final navDataSource = locator<RosNavRepo>();
  final mapImage = Rxn<ui.Image>();
  var map = RosOccupancyGrid();
  void subMap() async {
    map = await navDataSource.getMapData();
    final img = await getMapAsImage(Colors.black, Colors.white);
    mapImage.value = img;
    print(map.data);
  }

  void pubVelocity(listener) {
    navDataSource.pubVelocity(
        "/cmd_vel",
        RosTwist()
          ..linear.x = listener.x
          ..linear.y = listener.y);
  }

  Future<ui.Image> getMapAsImage(final Color fill, final Color border) {
    final completer = Completer<ui.Image>();
    ui.decodeImageFromPixels(map.toRGBA(fill, border), map.width ?? 0,
        map.width ?? 0, ui.PixelFormat.rgba8888, completer.complete);
    return completer.future;
  }
}
