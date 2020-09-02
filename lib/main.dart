import 'package:flutter/material.dart';
import 'package:ktu_notifs/pages/mainbody.dart';
import 'ui/drawer.dart';
import 'dart:core';

void main async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            title: Padding(
              padding: const EdgeInsets.only(left:0),
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontFamily: 'RobotoLight',
                  fontSize: 23,
                ),
              ),
            ),
            //centerTitle: true,
          ),
          body: Home(),
        ),
      ),
    );
  }
}
