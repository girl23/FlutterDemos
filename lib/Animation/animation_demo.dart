import 'package:flutter/material.dart';
class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("弹出菜单控件"),
      ),
      body: AnimationDemoHome(),
    );
  }
}
class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome> with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  //曲线动画
  CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationDemoController=AnimationController(
      duration:  Duration(milliseconds: 1000),
//      需要传递一个vsync参数，存在vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源。
      vsync:this,
//      value: 32.0,
//      lowerBound: 32.0,
//      upperBound: 100.0,

    );
//    animationDemoController.addListener((){
////      print('------${animationDemoController.value}');
//      setState(() {
//
//      });
//    });
    animationDemoController.addStatusListener((AnimationStatus status){
      print(status);
    });
    curve=CurvedAnimation(parent: animationDemoController,curve: Curves.bounceOut);
    //动画范围的值可以用Tween设置
//   animation= Tween(begin: 32.0,end: 100.0).animate((animationDemoController));
//   animationColor=ColorTween(begin: Colors.red,end: Colors.blue).animate((animationDemoController));

    animation= Tween(begin: 32.0,end: 100.0).animate((curve));
    animationColor=ColorTween(begin: Colors.red,end: Colors.blue).animate((curve));
//    animationDemoController.forward();//从头到尾播放动画
  }
  @override
  void dispose() {
    // TODO: implement dispose
    animationDemoController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimateHeart([animation,animationColor], animationDemoController)

    );//Container();
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