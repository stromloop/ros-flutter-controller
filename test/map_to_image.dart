import 'dart:io';
import 'dart:typed_data';
import 'package:ros_flutter/data/dartros_1/data_source/msgs/nav_msgs/lib/src/srvs/GetMap.dart';
import 'package:dartros/dartros.dart';
import 'package:intl/intl.dart';
import 'package:ros_flutter/domain/models/occupancy_grid.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:image/image.dart' as img;
import 'dart:ui' as ui;

Future<void> saveImageToFile(ui.Image image, String filePath,
    {bool isPng = true}) async {
  // Convert ui.Image to ByteData
  ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.rawRgba);
  if (byteData == null) {
    throw Exception("Failed to convert ui.Image to ByteData");
  }

  // Convert ByteData to Uint8List
  final buffer = byteData.buffer.asUint8List();

  // Create an image from bytes using the `image` package
  final imgImage = img.Image.fromBytes(
      width: image.width, height: image.height, bytes: buffer.buffer);

  // Encode the image to PNG or JPG
  final encodedImage =
      isPng ? img.encodePng(imgImage) : img.encodeJpg(imgImage);

  // Save to file
  final file = File(filePath);
  await file.writeAsBytes(encodedImage!);
}

void main() async {
  const masterUri = "192.168.0.121";
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('kkmmss').format(now);
  final node = await initNode('ros_node2$formattedDate', [],
      rosMasterUri: "http://${masterUri.toString()}:11311");
  print('Hello, World!');
  final mapRequest = GetMapRequest();
  final getMap = node.serviceClient("/static_map", GetMap.$prototype);
  final map = await getMap(mapRequest);
  final occupancyGrid = RosOccupancyGrid()
    ..data = map.map.data
    ..resolution = map.map.info.resolution
    ..width = map.map.info.width
    ..height = map.map.info.height;
  final imgData = await occupancyGrid.getMapAsImage(Colors.black, Colors.white);
  final imageFmtData = await imgData.toByteData(format: ui.ImageByteFormat.png);
  final imageBytes = imageFmtData!.buffer.asUint8List();
  final file_2 = File("image_byts.png");
  await file_2.writeAsBytes(imageBytes);
  final imgBytes = occupancyGrid.toRGBA(Colors.black, Colors.white);
  final imageData =
      img.Image.fromBytes(width: 384, height: 384, bytes: imgBytes.buffer);
  final encodedImage = img.encodeJpg(imageData);
  final file = File("image.jpg");
  await file.writeAsBytes(encodedImage);
  test('value should be incremented', () {
    expect(1, 1);
  });
}

