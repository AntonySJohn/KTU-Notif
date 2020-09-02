import 'package:flutter/material.dart';

class NotifTitle extends StatelessWidget {
  final String title;
  final double ratio;
  NotifTitle({this.title,this.ratio});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5, right: 5),
      child: SizedBox(
        width: ratio*0.65,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            title,
            style: TextStyle(
              height: 1.35,
              fontSize: 13.85,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

