import 'package:flutter/material.dart';
import 'zldropmenu.dart';
import 'zlpopwindow.dart';
import '../paint/paintTest.dart';
//注意 typedef 需要放在class外面
typedef IndexCallback<int> = void Function(int index);
class ZlPopMenuButton extends StatefulWidget {
  IndexCallback<int> onTap;
  //列表数据
  List items;

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
//  final height;

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
  //文本样式
  TextStyle txtStyle;

  double cellHeight;

  Widget buttonWidget;

  ZlPopMenuButton(

      this.items,
      this.width,
//      this.height,
      this.cellHeight,
      this.color,

      this.position, {
        Key key,
        @required this.onTap,
        this.arrHeight = 12.0,
        this.arrAngle = 60.0,
        this.radius = 10.0,
        this.strokeWidth = 4.0,
        this.style = PaintingStyle.fill,
        this.borderColor,
        this.child,
        this.innerPadding = 6.0,
        this.txtStyle,
         @required this.buttonWidget,
      }) : super(key: key);
  @override
  _ZlPopMenuButtonState createState() => _ZlPopMenuButtonState();
}

class _ZlPopMenuButtonState extends State<ZlPopMenuButton> {
  @override

  Widget build(BuildContext context) {
    double dropMenuHeight=widget.items.length>0?widget.items.length*widget.cellHeight+60:0;
    return new  PopupWindowButton(
          color: Colors.transparent,
          offset: Offset(0, 200),
          child: widget.buttonWidget,// new Icon(Icons.list,),//Text('data'),//Image(image: AssetImage("images/ic_share.png")),
          elevation: 0.0,
          window: Container(
            color: Colors.transparent,
            width: widget.width,
            height: dropMenuHeight+45,
            margin: EdgeInsets.only(right: 10),
            child: new DropMenu(widget.width,dropMenuHeight, widget.color,widget.position,//MenuArrowDirection.top,
              child:
              ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: widget.cellHeight,
//                        color: Colors.yellow,
                        child: Text(widget.items[index].toString(),style: widget.txtStyle),
                    ),
                    onTap: (){
                      widget.onTap(index);
                    },
                  );
                },
              ),
            ),
          )
      );

  }
}

//class ZlPopMenuButton extends StatelessWidget {
//  IndexCallback<int> onTap;
//  //列表数据
//  List items;
//
//  // 尖角位置
//  final position;
//
//  // 尖角高度
//  var arrHeight;
//
//  // 尖角角度
//  var arrAngle;
//
//  // 圆角半径
//  var radius;
//
//  // 宽度
//  final width;
//
//  // 高度
////  final height;
//
//  // 颜色
//  Color color;
//
//  // 边框颜色
//  Color borderColor;
//
//  // 边框宽度
//  final strokeWidth;
//
//  // 填充样式
//  final style;
//
//  // 子 Widget
//  final child;
//
//  // 子 Widget 与起泡间距
//  var innerPadding;
//  //文本样式
//  TextStyle txtStyle;
//
//  double cellHeight;
//
//  Widget buttonWidget;
//
//  ZlPopMenuButton(
//
//      this.items,
//      this.width,
////      this.height,
//      this.cellHeight,
//      this.color,
//
//      this.position, {
//        Key key,
//        @required this.onTap,
//        this.arrHeight = 12.0,
//        this.arrAngle = 60.0,
//        this.radius = 10.0,
//        this.strokeWidth = 4.0,
//        this.style = PaintingStyle.fill,
//        this.borderColor,
//        this.child,
//        this.innerPadding = 6.0,
//        this.txtStyle,
//         @required this.buttonWidget,
//      }) : super(key: key);
//  @override
//
//  Widget build(BuildContext context) {
//    double dropMenuHeight=this.items.length>0?this.items.length*this.cellHeight+50:0;
//    return new  PopupWindowButton(
//          color: Colors.transparent,
//          offset: Offset(0, 200),
//          child: this.buttonWidget,// new Icon(Icons.list,),//Text('data'),//Image(image: AssetImage("images/ic_share.png")),
//          elevation: 0.0,
//          window: Container(
//            color: Colors.transparent,
//            width: this.width,
//            height: dropMenuHeight,
//            margin: EdgeInsets.only(right: 10),
//            child: new DropMenu(this.width,dropMenuHeight, this.color, position,//MenuArrowDirection.top,
//              child:
//              ListView.builder(
//                itemCount: this.items.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return GestureDetector(
//                    child: Container(
//                        margin: EdgeInsets.only(left: 10),
//                        height: this.cellHeight,
////                        color: Colors.yellow,
//                        child: Text(this.items[index].toString(),style: txtStyle),
//                    ),
//                    onTap: (){
//
//                     this.onTap(index);
//                    },
//                  );
//                },
//              ),
//            ),
//          )
//      );
//
//  }
//}
