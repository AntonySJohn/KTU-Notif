import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class HtmlDisplay extends StatelessWidget {
  final String html;
  HtmlDisplay({this.html});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 15, 5),
      child: HtmlWidget(
        html,
        onTapUrl: (url) => showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('onTapUrl'),
            content: Text(url),
          ),
        ),
      ),
    );
  }
}
