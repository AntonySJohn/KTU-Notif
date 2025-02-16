import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
class Downloader{
  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}