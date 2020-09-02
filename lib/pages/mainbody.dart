import 'package:flutter/material.dart';
import 'package:ktu_notifs/dbms/jsonparse.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Notificationlist obj = Notificationlist([], null);

  bool starting = true;
  bool settingup = false;
  bool finishedload = false;

  void notifincrement() async {
    loadindicator();
    var _obj = await newStuff3(obj);
    setState(() {
      obj = _obj; //TODO messy stuff right here
      starting = false;
    });
    loadindicator();
    if (_obj.lastnotifhash == "-MFvWxsIW2PUdwZ4H7f-")
      setState(() {
        finishedload = true;
      });
  }

  @override
  void initState() {
    notifincrement();
  }

  void loadindicator() {
    setState(() {
      if (settingup)
        settingup = false;
      else
        settingup = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //addAutomaticKeepAlives: false, //test
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: obj.notifwidgets.length + 1,
      itemBuilder: (context, index) {
        if (starting)
          return settingup
              ? ListTile(
              dense: true,
              title: Center(child: CircularProgressIndicator()))
              : Container();
        else {
          if (index == obj.notifwidgets.length) {
            return finishedload
                ? ListTile(
              dense: true,
              title: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("What the heck are you doing down here?!"),
                      SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 3,
                          height: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
                : settingup
                ? ListTile(
                dense: true,
                title: Center(child: CircularProgressIndicator()))
                : FlatButton(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      "Show more",
                      style: TextStyle(
                          color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              onPressed: notifincrement,
            );
          }
          return obj.notifwidgets[index];
        }
      },
    );
  }
}
