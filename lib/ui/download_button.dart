import 'package:flutter/material.dart';
import 'package:ktu_notifs/util/file_download.dart';


Downloader obj = Downloader();

Widget downloadButtonList(List links){
  List<Widget> _list = List();
  if(links.isEmpty){
    return Container();
  }
  for(int i=0;i<links.length;i++){
    _list.add(DownloadButton(linkInfo: links[i]));
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: _list,
  );
}

class DownloadButton extends StatelessWidget {
  final List linkInfo;
  DownloadButton({this.linkInfo});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
        color: Colors.blue.shade600,
        child: Text(
          linkInfo[1],
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        onPressed: () {
          obj.launchInBrowser(linkInfo[0]);
        },
      ),
    );
  }
}



