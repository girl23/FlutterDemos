
import 'package:flutter/material.dart';

class QRTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTitle = "Offstage控制是否显示组件示例";
    return new Scaffold(
      appBar: AppBar(
        title:Text('stream'),
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key,this.title}):super(key:key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  //状态控制是否显示文本组件
  bool offstage = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Center(

        child:Text('hhhh'),

      ),

    );
  }

}
