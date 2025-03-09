import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ros_flutter/config/injection/injection.dart';
import 'package:ros_flutter/utils/constants/route_name.dart';
import 'package:ros_flutter/data/dartros_1/resources/ros_node.dart';

class RosDrawer extends StatelessWidget {
  const RosDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {context.go(RoutePath.home);},
          ),
          ListTile(
            leading: const Icon(Icons.car_rental),
            title: const Text('Profile'),
            onTap: () {context.go(RoutePath.navigation);},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              context.go(RoutePath.config);
            },
          ),
          ListTile(title: TextButton(onPressed: (){
            final rosHandler = locator<RosHandler>();
            rosHandler.initNode();
          }, child: Text("Connect")))
        ],
      ),
    );
  }
}
