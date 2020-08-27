import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:flutter/services.dart';

class Ktu {
  var id;
  var year;
  var month;
  var day;
  var title;
  var html;
  var urls;

  Ktu(var _val) {
    this.id = _val['id'];
    this.year = _val['year'];
    this.month = _val['month'];
    this.day = _val['day'];
    this.title = _val['title'];
    this.html = _val['html'];
    this.urls = _val['link'];
  }
}

Future<List<Ktu>> newStuff()async{
  var data = jsonDecode(await rootBundle.loadString('assets/new/test.json'));
  List<Ktu> notifs = [];
  for(var u in data){
    Ktu notif = Ktu(u);
    notifs.add(notif);
  }
  return(notifs.reversed.toList());
}

