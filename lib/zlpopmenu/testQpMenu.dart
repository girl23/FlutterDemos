import 'package:flutter/material.dart';
import '../paint/paintTest.dart';
import 'zlpopmenubutton.dart';
import 'zlenumconfig.dart';
class TestMenusDemo extends StatefulWidget{
  @override
  _TestMenusDemoState createState() => new _TestMenusDemoState();
}
class _TestMenusDemoState extends State<TestMenusDemo>{
  List list =new List.from(['url_launcher使用','dropmenu']);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("弹出菜单控件"),
        actions: <Widget>[
//          TextStyle(color: Colors.white, fontSize: 16.0)
        new ZlPopMenuButton(['11','222'], 200.0,30.0, Colors.green,BubbleArrowDirection.top,
          onTap:(index){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaintTest()));
          } ,
          txtStyle: TextStyle(color: Colors.white, fontSize: 16.0),
          buttonWidget: new Icon(Icons.list,),
        ),
           // new DropMenu(200, 400, Colors.green, MenuArrowDirection.top),
        ],
      ),

    );
  }
}
void main(){
  runApp(new MaterialApp(
    title: "弹出菜单控件",
    theme: new ThemeData(primaryColor: Colors.deepOrange),
    home: new TestMenusDemo(),
  ));
}