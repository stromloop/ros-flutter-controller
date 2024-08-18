// TODO check the possible use cases of freezed annotation
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';

class RosOccupancyGrid {
  double? resolution;
  int? width;
  int? height;
  List<int> data = [];

  Uint8List toRGBA(Color border, Color fill) {
    var buffor = BytesBuilder();
    for (var value in data) {
      switch (value) {
        case -1:
          {
            buffor.add([0, 0, 0, 0]);
            break;
          }
        case 0:
          {
            buffor.add([fill.red, fill.green, fill.blue, fill.alpha]);
            break;
          }
        default:
          {
            buffor.add([border.red, border.green, border.blue, border.alpha]);
            break;
          }
      }
    }
    return buffor.takeBytes();
  }
}
