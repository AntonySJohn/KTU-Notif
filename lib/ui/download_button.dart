import 'package:flutter/material.dart';
import 'package:ktu_notifs/util/file_download.dart';


Downloader obj = Downloader();

Widget downloadButtonList(final List links, final double ratioval){
  List<Widget> _list = List();
  if(links.isEmpty){
    return Container();
  }
  for(int i=0;i<links.length;i++){
    _list.add(DownloadButton(linkInfo: links[i],ratio: ratioval));
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: _list,
  );
}

class DownloadButton extends StatelessWidget {
  final List linkInfo;
  final double ratio;
  DownloadButton({this.linkInfo,this.ratio});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1),
      constraints: BoxConstraints(maxWidth: ratio*0.85),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.blue.shade600,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            linkInfo[1],
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
        onPressed: () {
          obj.launchInBrowser(linkInfo[0]);
        },
      ),
    );
  }
}



