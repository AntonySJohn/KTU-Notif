import 'package:flutter/material.dart';
import 'ui/doclist.dart';
import 'ui/drawer.dart';
import 'dart:io';
import 'dart:async';
import 'dart:core';
import 'dbms/jsonparse.dart';
import 'package:ktu_notifs/dbms/jsonparse.dart';
//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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


//TODO: perhaps create a class wrapping a widget list, pass the empty list into newstuff() and return updated list
//perhaps the builder wil automatically update list on introduction of new element. to check out.
//

void main() async{
//  Crashlytics.instance.enableInDevMode = false; // turn this off after seeing reports in in the console.
//  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stanfurd_Lite",
      theme: new ThemeData(canvasColor: Colors.grey.shade300),
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              actions: [
                drawerWidget(),
              ],
              backgroundColor: Colors.blue.shade800,
              title: Text(
                'Notifications',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                  fontSize: 23,
                ),
              ),
              centerTitle: true,
            ),
            body: Center(
              child: FutureBuilder(
                future: newStuff(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.data==null){
                    return Center(
                      child: Text("Loading...."),
                    );
                  }
                  else{
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          bool check = false;
                          if(index!=snapshot.data.length)
                            if(snapshot.data[index].year!=snapshot.data[index+1].year)
                              check=true;
                          return Center(child: new TestList(snapshot.data[index],check));
                        }
                    );
                  }
                },
              ),
            ),
        ),
      ),
    );
  }
}

