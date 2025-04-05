import 'package:flutter/material.dart';
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
              minScale: 1,
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
    // TODO [$67f0ddff67cc250008914f0d]: get height from map topic
    const width = 4000;
    const height = 4000;
    // Define your custom painting operations using canvas methods
    // Calculate the position to center the image
    final double dx = (size.width - 4000) / 2;
    final double dy = (size.height - 4000) / 2;
    //print("${map.height},${map.width} => ${size.height}, ${size.width}");
    paintImage(
      canvas: canvas,
      rect: Rect.fromLTWH(0, 0, size.width, size.height),
      scale: 0.1,
      image: map,
      fit: BoxFit.cover,
    );
    //print("${size.width} , ${size.height}");
    // Add more custom painting operations as needed
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Set to true to repaint when notified
  }
}
