import 'package:flutter/material.dart';
import 'package:ros_flutter/presentation/widgets/drawer_widget.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Config")),
      body: Container(
        child: TextField()
        ),
      drawer: RosDrawer(),
    );
  }
}
