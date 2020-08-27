//import 'package:firebase_messaging/firebase_messaging.dart';
//
//class PushNotificationsManager {
//
//  PushNotificationsManager._();
//
//  factory PushNotificationsManager() => _instance;
//
//  static final PushNotificationsManager _instance = PushNotificationsManager._();
//
//  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//  bool _initialized = false;
//
//  Future<void> init() async {
//    if (!_initialized) {
//      // For iOS request permission first.
////      _firebaseMessaging.requestNotificationPermissions();
//      _firebaseMessaging.configure(
//          onMessage: (Map<String, dynamic> message) async {
//        print("onMessage: $message");
//      },
//      onLaunch: (Map<String, dynamic> message) async {
//        print("onLaunch: $message");
//        // TODO optional
//      },
//      onResume: (Map<String, dynamic> message) async {
//        print("onResume: $message");
//        // TODO optional
//      },
//    );
//      // For testing purposes print the Firebase Messaging token
//      String token = await _firebaseMessaging.getToken();
//      print("FirebaseMessaging token: $token");
//
//      _initialized = true;
//    }
//  }
//}

import 'dart:io';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageHandler extends StatefulWidget {
  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final snackbar = SnackBar(
          content: Text(message['notification']['title']),
          action: SnackBarAction(
            label: 'Go',
            onPressed: ()=>null,
          ),
        );
        Scaffold.of(context).showSnackBar(snackbar);
//        showDialog(
//          context: context,
//          builder: (context) => AlertDialog(
//            content: ListTile(
//              title: Text(message['notification']['title']),
//              subtitle: Text(message['notification']['body']),
//            ),
//            actions: <Widget>[
//              FlatButton(
//                child: Text('Ok'),
//                onPressed: () => Navigator.of(context).pop(),
//              ),
//            ],
//          ),
//        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
  }
