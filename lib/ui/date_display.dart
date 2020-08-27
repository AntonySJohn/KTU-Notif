import 'package:flutter/material.dart';

class DateDisplay extends StatelessWidget {
  final String year;
  final String month;
  final String day;
  final double ratio;
  DateDisplay({this.year,this.month,this.day,this.ratio});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.shade600,
      ),
      child: Column(
        children: <Widget>[
          Text(
            day,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            month,
            style: TextStyle(color: Colors.white, fontSize: 11.5),
          ),
        ],
      ),
    );
  }
}
