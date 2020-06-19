import 'zlpopwindow.dart';
import 'package:flutter/material.dart';
import 'topsheet/top_sheet.dart';
class PopWindowDemo extends StatefulWidget {
  @override
  _PopWindowDemoState createState() => _PopWindowDemoState();
}

class _PopWindowDemoState extends State<PopWindowDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("弹出菜单控件"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: (){
              showModalTopSheet(context:context, builder:(BuildContext context){
                return Container(
                  color: Colors.yellow,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(
                        leading: new Icon(Icons.photo_camera),
                        title: new Text("1"),
                        onTap: () async {

                        },
                      ),
                    ],
                  ),
                );
              } );
            },
          )
        ],
      ),
      body: Center(
        child: Text('hhhhhh'),
      ),
    );
  }
}
class AnimateHeart extends AnimatedWidget{
  //小部件中需要一组动画
  final List animations;
  final AnimationController controller;
  AnimateHeart(this.animations, this.controller):super(listenable:controller);
  @override
  Widget build(BuildContext context) {
    return  IconButton(
      onPressed: (){
        switch (controller.status){
          case AnimationStatus.completed:
            controller.reverse();
            break;
          case  AnimationStatus.dismissed:
            controller.forward();
            break;
          default:
            controller.forward();
        }
      },
      color: animations[1].value,
      icon:Icon(Icons.favorite),
      iconSize: animations[0].value,//animationDemoController.value,
    );
  }
}