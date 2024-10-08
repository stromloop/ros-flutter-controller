import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ros_flutter/presentation/controllers/param_controller.dart';
import 'package:ros_flutter/presentation/widgets/drawer_widget.dart';

class ParamPage extends StatefulWidget {
  const ParamPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ParamPage> createState() => _ParamPageState();
}

class _ParamPageState extends State<ParamPage> {
  int _counter = 0;
  @override
  void initState() {
    // Initialize & inject UserController() using Get.put()
    Get.put<ParamController>(ParamController(), permanent: true);
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _paramName = TextEditingController();
    final TextEditingController _param = TextEditingController();
    final controller = Get.put(ParamController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                ListTile(
                  title: TextField(
                    controller: _paramName,
                    decoration: const InputDecoration(
                      labelText: 'Set param Name',
                    ),
                  ),
                ),
                ListTile(
                  title: TextField(
                    controller: _param,
                    decoration: const InputDecoration(
                      labelText: 'Set Param',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await controller.setParam(_paramName.text, _param.text);
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
            Obx(() {
              return Text(
                'The current param value - ${controller.paramValue}',
              );
            }),
	    ElevatedButton(onPressed: (){
		controller.pubString();
	    }, child: const Text("Publish")),
            Obx(() {
              return Text(
                'The current Subscribed value - ${controller.subDataString}',
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getFoo();
	  controller.subString();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      drawer: const RosDrawer(),
    );
  }
}
