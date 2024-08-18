import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:ros_flutter/presentation/controllers/navigation_controller.dart';
import 'package:ros_flutter/presentation/widgets/drawer_widget.dart';
import 'package:vector_math/vector_math.dart' show radians, Quaternion;

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
      ),
      body: Stack(children: [
        Obx(() {
          if (controller.mapImage.value != null) {
            return InteractiveViewer(
              maxScale: 6,
              minScale: 0.3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: CustomPaint(
                  painter: MapPainter(controller.mapImage.value!),
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        }),
        Positioned(
            bottom: 20,
            child: Joystick(listener: (listener) {
              controller.pubVelocity(listener);
            }))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.subMap();
        },
        child: const Icon(Icons.add),
      ),
      drawer: const RosDrawer(),
    );
  }
}

class MapPainter extends CustomPainter {
  final ui.Image map;
  MapPainter(this.map);
  @override
  void paint(Canvas canvas, ui.Size size) {
    //TODO get height from map topic
    const width = 384;
    const height = 384;
    // Define your custom painting operations using canvas methods
    canvas.translate(width / 2, height / 2.5);
    canvas.rotate(radians(180));
    canvas.translate(-width / 2, -height / 2);
    canvas.scale(1, -1);
    canvas.translate(0, -height.toDouble());

    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;
    canvas.translate(0, 0);
    canvas.drawImage(map, Offset.zero, Paint());
    // Add more custom painting operations as needed
    canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: 10, height: 10),
        Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Set to true to repaint when notified
  }
}
