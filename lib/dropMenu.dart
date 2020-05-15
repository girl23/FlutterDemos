///系统菜单
import 'package:flutter/material.dart';
import 'package:popup_window/popup_window.dart';
class MenusDemo extends StatefulWidget{
  @override
  _MenusDemoState createState() => new _MenusDemoState();
}
class _MenusDemoState extends State<MenusDemo>{
  String _bodyStr = "显示菜单内容";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("弹出菜单控件"),
        actions: <Widget>[
          new PopupMenuButton(
              icon: new Icon(Icons.list,),
              color:Colors.transparent,
              elevation:0.0,
              onSelected: (String value){
                setState(() {
                  _bodyStr = value;
                });
              },
              itemBuilder: (BuildContext context) =><PopupMenuItem<String>>[
                new PopupMenuItem(
                    value:"选项一的内容",
                    child: new Text("选项一")
                ),
                new PopupMenuItem(
                    value: "选项二的内容",
                    child: new Text("选项二")
                )
              ]
          )
        ],
      ),
      body: new Center(
        child: new Text(_bodyStr),
      ),
    );
  }
}
void main(){
  runApp(new MaterialApp(
    title: "弹出菜单控件",
    theme: new ThemeData(primaryColor: Colors.deepOrange),
    home: new MenusDemo(),
  ));
}
