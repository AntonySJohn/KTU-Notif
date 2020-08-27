import 'package:flutter/material.dart';
import 'package:ktu_notifs/util/file_download.dart';
import 'dart:core';

Widget drawerWidget() {
  return PopupMenuButton<int>(
    onSelected: (value) async {
      switch (value) {
        case 1:
          await Downloader().launchInBrowser("https://app.ktu.edu.in/login.jsp");
          break;
        case 2:
          break;
      }
    },
    offset: Offset(-30,70.0),
    padding: EdgeInsets.zero,
    itemBuilder: (context) {
      var list = List<PopupMenuEntry<int>>();
      list.add(
        PopupMenuItem(
          child: Text(
            "Open KTU Student Portal",
          ),
          value: 1,
        ),
      );
      list.add(
        PopupMenuDivider(
          height: 10,
        ),
      );
      list.add(
        PopupMenuItem(
          value: 2,
          child: Text("About")
        ),
      );
      return list;
    },
    icon: Icon(
        Icons.more_vert,
      size: 28,
    ),
  );
}
