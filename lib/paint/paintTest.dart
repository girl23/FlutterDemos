//绘制基础
import 'dart:math';
import 'dart:ui';
import 'paint_circle.dart';
import 'dart:math';
import 'circle_progress.dart';
import 'package:flutter/material.dart';
class PaintTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(

        title: Text('绘制'),
      ),
      body:CircleProgress([Colors.yellow,Colors.greenAccent,Colors.white],[35,50,15],Size(320,240),filled: false,strokeWidth: 16),//CircleProgress(),
    );
  }
}
class MyPainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint1 = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.butt//画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.stroke //绘画风格，默认为填充PaintStyle.stroke 不填充,PaintingStyle.fill 填充
    ..strokeWidth = 20.0; //画笔的宽度
//  Paint _paint2 = Paint()
//    ..color = Colors.red//画笔颜色
//    ..strokeCap = StrokeCap.butt//画笔笔触类型
//    ..isAntiAlias = true //是否启动抗锯齿
//    ..style = PaintingStyle.stroke //绘画风格，默认为填充PaintStyle.stroke 不填充,PaintingStyle.fill 填充
//    ..strokeWidth = 20.0; //画笔的宽度
//  Paint _paint3 = Paint()
//    ..color = Colors.yellow//画笔颜色
//    ..strokeCap = StrokeCap.butt//画笔笔触类型
//    ..isAntiAlias = true //是否启动抗锯齿
//    ..style = PaintingStyle.stroke //绘画风格，默认为填充PaintStyle.stroke 不填充,PaintingStyle.fill 填充
//    ..strokeWidth = 20.0;

  @override
  void paint(Canvas canvas, Size size) {
    //绘制直线，点点连接
//    canvas.drawLine(Offset(20, 20), Offset(100,100), _paint);
//    canvas.drawPoints(
//      PointMode.points,
////        PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
//        [
//          Offset(20.0,  40.0),
//          Offset(100.0, 120.0),
//          Offset(100.0, 220.0),
//          Offset(200.0, 220.0),
//          Offset(200.0, 120.0),
//          Offset(280.0, 40.0),
//          Offset(20,    40.0),
//        ],
//        _paint
//    );
    //绘制圆 参数(圆心，半径，画笔)
//    canvas.drawCircle(Offset(140,80), 80,_paint..color = Colors.green);
//    制椭圆drawOval
//    Rect也有多种构建方式
//    法一
//    fromLTWH(double left, double top, double width, double height)
    //使用矩形左边的X坐标、矩形顶部的Y坐标矩形的宽高来确定矩形的大小和位置
//    Rect rect = Rect.fromLTWH(100, 20, 100, 60);
//    法二
//    fromLTRB(double left, double top, double right, double bottom)
//    使用矩形左边的X坐标、矩形顶部的Y坐标、矩形右边的X坐标、矩形底部的Y坐标来确定矩形的大小和位置
//    Rect rect = Rect.fromLTRB(30, 30, 160, 140);
    //法三
//    fromCircle({ Offset center, double radius })
//    使用圆的圆心点坐标和半径和确定外切矩形的大小和位置
//    Rect rect = Rect.fromCircle(center: Offset(100, 40),radius: 60);
//    法四
//    fromPoints(Offset a, Offset b)
//    使用左上和右下角坐标来确定矩形的大小和位置
//    Rect rect = Rect.fromPoints(Offset(100.0, 40.0), Offset(220.0, 100.0));
//    canvas.drawOval(rect, _paint..color=Colors.green);

//    绘制圆弧drawArc
//    首先还是需要Rect来确认圆弧的位置，还需要开始的弧度、结束的弧度、是否使用中心点绘制(圆弧是否向中心闭合)、以及paint.
//    系统方法
//    void drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter, Paint paint)


//    拓展
//
//    弧度
//    根据定义，一周的弧度数为2πr/r=2π，360°角=2π弧度，因此，1弧度约为57.3°，即57°17’44.806’’，
//    1°为π/180弧度，近似值为0.01745弧度，周角为2π弧度，平角（即180°角）为π弧度，直角为π/2弧度。
//  特殊弧度
//    特殊弧度
//    度	弧度
//    0°	0
//    30°	π/6
//    45°	π/4
//    60°	π/3
//    90°	π/2
//    120°	2π/3
//    180°	π
//    270°	3π/2
//    360°	2π

//    const PI = 3.1415926;
//    Rect rect2 = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 80.0);
//
//    //用Rect构建一个边长50,中心点坐标为100,100的矩形
//    //顺时针绘制
//    RRect rrect = RRect.fromRectAndRadius(rect2, Radius.circular(0.0));
//    canvas.drawRRect(rrect, _paint);
//    canvas.drawArc(rect2,PI , PI/2, false, _paint2);

//    绘制圆角矩形drawDRRect
//    RRect确定矩形大小及弧度，使用paint来完成绘制
//    Rect rect = Rect.fromCircle(center: Offset(140.0, 50.0), radius: 50.0);
//    //根据上面的矩形,构建一个圆角矩形
//    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(20.0));
//    canvas.drawRRect(rrect, _paint);

//    绘制路径drawPath
//    方法名            作用
//    moveTo    将路径起始点移动到指定的位置
//    relativeMoveTo    相对于当前位置移动到
//    lineTo    从当前位置连接指定点
//    relativeLineTo    相对当前位置连接到
//    arcTo    曲线
//    conicTo    贝塞尔曲线
//    add**    添加其他图形，如addArc，在路径是添加圆弧
//    contains    路径上是否包括某点
//    transfor    给路径做matrix4变换
//    combine    结合两个路径
//    close    关闭路径，连接路径的起始点
//    reset    重置路径，恢复到默认状态

    //新建了一个path,然后将路径起始点移动到坐标(100,100)的位置
//    在开始绘图之前，您的笔默认位于原点（即画布的左上角）。在开始绘图之前，您可以使用此功能移动笔。
//    Path path = new Path()..moveTo(0.0,0.0);
//    path.lineTo(200.0, 200.0);
//    canvas.drawPath(path, _paint);
    const PI = 3.1415926;
    Rect rect2 = Rect.fromCircle(center: Offset(200, 200.0), radius: 100.0);
    //    根据定义，一周的弧度数为2πr/r=2π，360°角=2π弧度，因此，1弧度约为57.3°，即57°17’44.806’’，
//    1°为π/180弧度，近似值为0.01745弧度，周角为2π弧度，平角（即180°角）为π弧度，直角为π/2弧度。
    //rect2矩型区域，起始点，化的幅度，是否连接中心原点
    //将360平均分层100分*乘以每一份占的弧度，再乘以100份中占了多少份
    double p1=(360.0/100.0)*PI/180.0*50.0;
    double p2=(360.0/100.0)*PI/180.0*20.0;
    double p3=(360.0/100.0)*PI/180.0*30.0;
    canvas.drawArc(rect2,PI/2 , p1, false, _paint1);
    _paint1.color=Colors.red;
    canvas.drawArc(rect2,PI/2+p1, p2, false, _paint1);
    _paint1.color=Colors.yellow;
    canvas.drawArc(rect2,PI/2+p1+p2, p3, false, _paint1);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
//    在这个函数中，你应该返回true或false。如果你的绘画依赖于一个变量并且该变量发生了变化，那么你在这里返回true，
//    这样Flutter就知道它必须调用paint方法来重绘你的绘画。否则，在此处返回false表示您不需要重绘。

  }
}