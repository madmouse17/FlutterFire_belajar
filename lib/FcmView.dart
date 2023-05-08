import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:plant_ui/main.dart';

class FCMPage extends StatefulWidget {
  @override
  _FCMPageState createState() => _FCMPageState();
}

class _FCMPageState extends State<FCMPage> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  late FirebaseMessaging firebaseMessaging;
  final controllerTopic = TextEditingController();
  bool isSubscribed = false;
  String token = '';
  static String dataName = '';
  static String dataAge = '';

  // static Future<dynamic> onBackgroundMessage(Map<String, dynamic> message) {
  //   debugPrint('onBackgroundMessage: $message');
  //   if (message.containsKey('data')) {
  //     String name = '';
  //     String age = '';
  //     if (Platform.isIOS) {
  //       name = message['name'];
  //       age = message['age'];
  //     } else if (Platform.isAndroid) {
  //       var data = message['data'];
  //       name = data['name'];
  //       age = data['age'];
  //     }
  //     dataName = name;
  //     dataAge = age;
  //     debugPrint('onBackgroundMessage: name: $name & age: $age');
  //   }
  //   return null;
  // }

  @override
  void initState() {
    firebaseMessaging = FirebaseMessaging.instance;
    firebaseMessaging.getToken().then((value) {
      setState(() {
        token = value.toString();
      });
      print(value);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print('body: ${event.notification!.body}');
      print('bodyhash: ${event.notification!.hashCode}');
      print('body2: ${event.data.values}');
      RemoteNotification? notification = event.notification;
      AndroidNotification? android = event.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ),
            payload: jsonEncode(event.data));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('onclick ${message.data}');
      print('Message clicked!');
    });
    firebaseMessaging.subscribeToTopic("all");

    // firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     debugPrint('onMessage: $message');
    //     getDataFcm(message);
    //   },
    //   onBackgroundMessage: onBackgroundMessage,
    //   onResume: (Map<String, dynamic> message) async {
    //     debugPrint('onResume: $message');
    //     getDataFcm(message);
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     debugPrint('onLaunch: $message');
    //     getDataFcm(message);
    //   },
    // );
    // firebaseMessaging.requestNotificationPermissions(
    //   const IosNotificationSettings(
    //       sound: true, badge: true, alert: true, provisional: true),
    // );
    // firebaseMessaging.onIosSettingsRegistered.listen((settings) {
    //   debugPrint('Settings registered: $settings');
    // });
    // firebaseMessaging.getToken().then((token) => setState(() {
    //       this.token = token;
    //     }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('token: $token');
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text('Flutter FCM'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'TOKEN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(token),
            Divider(thickness: 1),
            Text(
              'TOPIC',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: controllerTopic,
              enabled: !isSubscribed,
              decoration: InputDecoration(
                hintText: 'Enter a topic',
              ),
            ),
            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: ElevatedButton(
            //         child: Text('Subscribe'),
            //         onPressed: isSubscribed
            //             ? null
            //             : () {
            //                 String topic = controllerTopic.text;
            //                 if (topic.isEmpty) {
            //                   scaffoldState.currentState.showSnackBar(SnackBar(
            //                     content: Text('Topic invalid'),
            //                   ));
            //                   return;
            //                 }
            //                 firebaseMessaging.subscribeToTopic(topic);
            //                 setState(() {
            //                   isSubscribed = true;
            //                 });
            //               },
            //       ),
            //     ),
            //     SizedBox(width: 16),
            //     Expanded(
            //       child: RaisedButton(
            //         child: Text('Unsubscribe'),
            //         onPressed: !isSubscribed
            //             ? null
            //             : () {
            //                 String topic = controllerTopic.text;
            //                 firebaseMessaging.unsubscribeFromTopic(topic);
            //                 setState(() {
            //                   isSubscribed = false;
            //                 });
            //               },
            //       ),
            //     ),
            //   ],
            // ),

            Divider(thickness: 1),
            Text(
              'DATA',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // _buildWidgetTextDataFcm(),
          ],
        ),
      ),
    );
  }

  // Widget _buildWidgetTextDataFcm() {
  //   if (dataName == null ||
  //       dataName.isEmpty ||
  //       dataAge == null ||
  //       dataAge.isEmpty) {
  //     return Text('Your data FCM is here');
  //   } else {
  //     return Text('Name: $dataName & Age: $dataAge');
  //   }
  // }

  // void getDataFcm(Map<String, dynamic> message) {
  //   String name = '';
  //   String age = '';
  //   if (Platform.isIOS) {
  //     name = message['name'];
  //     age = message['age'];
  //   } else if (Platform.isAndroid) {
  //     var data = message['data'];
  //     name = data['name'];
  //     age = data['age'];
  //   }
  //   if (name.isNotEmpty && age.isNotEmpty) {
  //     setState(() {
  //       dataName = name;
  //       dataAge = age;
  //     });
  //   }
  //   debugPrint('getDataFcm: name: $name & age: $age');
  // }

}
