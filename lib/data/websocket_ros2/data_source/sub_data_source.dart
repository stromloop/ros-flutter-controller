import 'dart:convert';

import 'package:get/get.dart';
import 'package:ros_flutter/domain/models/string.dart';
import 'package:web_socket_channel/io.dart';
import 'package:ros_flutter/data/websocket_ros2/resources/ros_node.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
class SubDataSource {
  RosHandler ros;
  SubDataSource(this.ros);
  Future<RosString> getParam() async {
    return const RosString(name: "Error");
  }

  Future<RosString> setParam(paramName, param) async {
    return const RosString(name: "Error");
  }

  void pubString(String topic, String payload) {

    final channel = WebSocketChannel.connect(ros.nodeUri);

    print('Connected to ROS WebSocket on ${ros.nodeUri.host}');

    // Step 1: Advertise the topic
    final advertiseMsg = {
      'op': 'advertise',
      'topic': '/chatter',
      'type': 'std_msgs/String' // Specify the correct message type
    };

    channel.sink.add(jsonEncode(advertiseMsg));
    print('Topic advertised: /chatter');

    // Step 2: Publish messages
    final publishMsg = {
      'op': 'publish',
      'topic': '/chatter',
      'msg': {'data': 'Hello from Dart!'}
    };

    // Publish message every 2 seconds
    channel.sink.add(jsonEncode(publishMsg));
    print('Message sent: ${publishMsg['msg']}');
    // Optional: Unadvertise the topic and close after 10 seconds

    // final unadvertiseMsg = {
    //   'op': 'unadvertise',
    //   'topic': '/chatter',
    // };
    // channel.sink.add(jsonEncode(unadvertiseMsg));
    // print('Topic unadvertised: /chatter');

    channel.sink.close();
    print('WebSocket closed');
  }

  void subString(String topic, RxString dataRef) {
    final channel = WebSocketChannel.connect(ros.nodeUri); 
    final subscribeMsg = {
      'op': 'subscribe',
      'topic': topic,
      'type': 'std_msgs/String', // Ensure correct message type
    };
    channel.sink.add(jsonEncode(subscribeMsg));
        // Listen for incoming messages
    channel.stream.listen((message) {
      final decoded = jsonDecode(message);
      if (decoded['topic'] == topic && decoded['msg'] != null) {
        dataRef.value = decoded['msg']['data'];
        print('Received message: ${dataRef.value}');
      }
    }, onError: (error) {
      print('WebSocket error: $error');
    }, onDone: () {
      print('WebSocket closed');
    });
    
  }
}
