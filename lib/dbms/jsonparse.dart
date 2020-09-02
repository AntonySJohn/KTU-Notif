import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:ktu_notifs/ui/doclist.dart';

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
    if(_val['link']!=null)
      this.urls = _val['link'];
    else
      this.urls = [];
  }
}

class Notificationlist{
  List<Widget> notifwidgets;
  var lastnotifhash;
  Notificationlist(this.notifwidgets,this.lastnotifhash);
}


Future<Notificationlist> newStuff3(var _obj)async{
  var data;
  var keylist;
  if(_obj.lastnotifhash!=null){
    data = jsonDecode((await get('https://ktu-app-backend.firebaseio.com/test.json?orderBy="\$key"&endAt="${_obj.lastnotifhash}"&limitToLast=1001')).body);
    data.remove(data.keys.toList()[(data.keys.length)-1]);
    }
  else
    data = jsonDecode((await get('https://ktu-app-backend.firebaseio.com/test.json?orderBy="\$key"&limitToLast=1000')).body);
  keylist = data.keys.toList();
  if(keylist.length==0){
    return(_obj);}
  _obj.lastnotifhash = keylist[0];
  for(int i = keylist.length-1; i >= 0; i--){
    bool check = false;
    Ktu notif = Ktu(data[data.keys.toList()[i]]);
    if(i<keylist.length-1)
      if(data[keylist[i]]['year']!=data[keylist[i+1]]['year'])
        check = true;
    _obj.notifwidgets.add(Center(child: TestList(notif,check)));
  }
  return(_obj);
}