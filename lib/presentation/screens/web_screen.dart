import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen {
  const WebViewScreen({Key? key, required this.url});

  final String url;

  // _launchURLBrowser() async {
  //   //const url = 'https://flutterdevs.com/';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  launchURLApp() async {
    // const url = 'https://flutterdevs.com/';
    try {
      if (await canLaunch(url)) {
        await launch(url,
            forceSafariVC: true, forceWebView: true, enableJavaScript: true);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      throw Exception('problem while launching url');
    }
    // to use url launcher we need to declare something in android manifest and info.plist
  }
}
