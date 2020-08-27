import 'package:ktu_notifs/dbms/jsonparse.dart';
import 'package:flutter/material.dart';
import 'package:ktu_notifs/ui/date_display.dart';
import 'package:ktu_notifs/ui/html_display.dart';
import 'package:ktu_notifs/ui/notif_title.dart';
import 'package:ktu_notifs/ui/download_button.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:ktu_notifs/size_helper.dart';


//TODO Add persistence of read notifications

class TestList extends StatefulWidget {
  final Ktu notif;
  final bool _check;
  const TestList(this.notif,this._check);
  @override
  _TestListState createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(vertical: 3),
          child: ConfigurableExpansionTile(
            header: Row(
              children: <Widget>[
                DateDisplay(year: widget.notif.year.toString(),month: widget.notif.month.toString(),day: widget.notif.day.toString(),ratio: displayWidth(context)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  height: 50,
                  child: VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 0.05*displayWidth(context),
                  ),
                ),
                NotifTitle(title: widget.notif.title,ratio: displayWidth(context)),
                //SizedBox(width: 5),
              ],
            ),
            animatedWidgetFollowingHeader: Icon(
              Icons.expand_more,
              color: Color(0xFF707070),
            ),
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            child: Divider(
                              thickness: 2,
                            ),
                            width: .8*displayWidth(context),
                          ),
                          HtmlDisplay(html: widget.notif.html),
                          downloadButtonList(widget.notif.urls),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        widget._check? Center(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  child: SizedBox(
                    child: Divider(
                      thickness: 2,
                    ),
                    //width: 136.75,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey.shade600,
                ),
              ),
              Container(
                child: Text(
                  '${int.parse(widget.notif.year)-1}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey.shade600,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(right: 5),
                  child: SizedBox(
                    child: Divider(
                      thickness: 2,
                    ),
                    //width: 136.75,
                  ),
                ),
              ),
            ],
          ),
        ):Container(),
      ],
    );
  }
}
