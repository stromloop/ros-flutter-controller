import 'package:flutter/material.dart';
import 'package:ros_flutter/config/injection/injection.dart';
import 'package:ros_flutter/presentation/widgets/drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPage extends StatelessWidget {
  ConfigPage({super.key});

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final sharedPref = locator<SharedPreferences>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTiles with TextFields'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _controller1,
              decoration: InputDecoration(
                labelText: 'Ros Master Ip',
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                sharedPref.setString("ROS_MASTER_IP", _controller1.text);
                print('Text from item 1: ${_controller1.text}');
              },
              child: Text('Apply'),
            ),
          ),
          ListTile(
            title: TextField(
              controller: _controller2,
              decoration: InputDecoration(
                labelText: 'Enter text for item 2',
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                print('Text from item 2: ${_controller2.text}');
              },
              child: Text('Apply'),
            ),
          ),
        ],
      ),
      drawer:const RosDrawer(),
    );
  }
}
