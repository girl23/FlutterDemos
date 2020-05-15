import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterdemo/getTextWidthHeight/get_width_height.dart';

class ZlUrlLauncher extends StatefulWidget {
  final title;
  ZlUrlLauncher(this.title);
  @override
  _ZlUrlLauncherState createState() => _ZlUrlLauncherState();
}

class _ZlUrlLauncherState extends State<ZlUrlLauncher> {
  @override
  String str='ggg';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(

        title: Text('lll'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed:_launchURL,
          child:Text(str),
        ),
      ),
    );
  }
  _launchURL() async {
    const url = 'https://flutter.cn';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

