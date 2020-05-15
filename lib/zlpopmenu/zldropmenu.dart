import 'package:flutter/material.dart';
import 'package:flutterdemo/zlpopmenu/zlbubblewidget.dart';
import 'zlenumconfig.dart';
//enum MenuArrowDirection { top, bottom, right, left }
class DropMenu extends StatelessWidget {
  // 尖角位置
  final position;

  // 尖角高度
  var arrHeight;

  // 尖角角度
  var arrAngle;

  // 圆角半径
  var radius;

  // 宽度
  final width;

  // 高度
  final height;

  // 颜色
  Color color;

  // 边框颜色
  Color borderColor;

  // 边框宽度
  final strokeWidth;

  // 填充样式
  final style;

  // 子 Widget
  final child;

  // 子 Widget 与起泡间距
  var innerPadding;

  DropMenu(
      this.width,
      this.height,
      this.color,
      this.position, {
        Key key,
        this.arrHeight = 12.0,
        this.arrAngle = 60.0,
        this.radius = 10.0,
        this.strokeWidth = 4.0,
        this.style = PaintingStyle.fill,
        this.borderColor,
        this.child,
        this.innerPadding = 6.0,
      }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //组装方向
//    var currentPosition;
//    if(this.position==MenuArrowDirection.top){
//      currentPosition= BubbleArrowDirection.top;
//    }else if(this.position==MenuArrowDirection.left){
//      currentPosition= BubbleArrowDirection.left;
//    }else if(this.position==MenuArrowDirection.right){
//      currentPosition= BubbleArrowDirection.right;
//    }else{
//      currentPosition= BubbleArrowDirection.bottom;
//    }
    return Padding(
        padding: EdgeInsets.all(4.0),
        child: Container(
            alignment: Alignment.centerRight,
            child: BubbleWidget(this.width, this.height, this.color,
                position,
                child:this.child,
                arrHeight:this.arrHeight,
                arrAngle: this.arrAngle,
                radius: this.radius,
                innerPadding: this.innerPadding,
                strokeWidth: this.strokeWidth,
                borderColor: this.borderColor,
                style: this.style,
            )
        )
    );

  }
}
