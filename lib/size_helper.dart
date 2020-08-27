import 'package:flutter/material.dart';

double displayWidth(BuildContext context){
  debugPrint("Size= "+MediaQuery.of(context).size.width.toString());
  return MediaQuery.of(context).size.width;
}