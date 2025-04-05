// TODO [$67f0ddff67cc250008914f0b]: check the possible use cases of freezed annotation
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;
import 'dart:async';

class RosOccupancyGrid {
  double? resolution;
  int? width;
  int? height;
  List<int> data = [];
  Future<ui.Image> getMapAsImage(final Color fill, final Color border) {
    final completer = Completer<ui.Image>();
    ui.decodeImageFromPixels(toRGBA(fill, border), width ?? 0, width ?? 0,
        ui.PixelFormat.rgba8888, completer.complete);
    return completer.future;
  }

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
