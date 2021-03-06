//圆圈工具类
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'dart:math';
class CharacterPainter extends CustomPainter {
  final List <Color>colors;
  final List <double>percent;
  final double strokeWidth;
  ///[定义画笔]
  Paint _paint1;
  double _startAngle;
  CharacterPainter(this.colors,this.percent,{startAngle=pi/2,this.strokeWidth=5.0}){
    _startAngle=startAngle;
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
    super.addListener(listener);

  }
  //段落构造器
  ui.ParagraphBuilder _paragraph_builder;

  ui.Paragraph _paragraph;
  @override
  void paint(Canvas canvas, Size size) {
    _paint1= Paint()
      ..strokeCap = StrokeCap.butt//画笔笔触类型
      ..isAntiAlias = true //是否启动抗锯齿
      ..style =PaintingStyle.stroke //绘画风格，默认为填充PaintStyle.stroke 不填充,PaintingStyle.fill 填充
      ..strokeWidth =this.strokeWidth; //画笔的宽度
//    Rect rect2 = Rect.fromCircle(center: this.center, radius: this.radius);
    //    根据定义，一周的弧度数为2πr/r=2π，360°角=2π弧度，因此，1弧度约为57.3°，即57°17’44.806’’，
//    1°为π/180弧度，近似值为0.01745弧度，周角为2π弧度，平角（即180°角）为π弧度，直角为π/2弧度。
    //rect2矩型区域，起始点，化的幅度，是否连接中心原点
    //将360平均分层100分*乘以每一份占的弧度，再乘以100份中占了多少份
//    double completeAngle=0.0;
//    for (int i=0;i<colors.length;i++){
//      double angle=(360.0/100.0)*pi/180*percent[i];
//      Color drawColor=colors[i];
//      _paint1.color=drawColor;
//      canvas.drawArc(rect2,_startAngle+completeAngle , angle, this.filled, _paint1);
//      completeAngle+=angle;
//    }
    List para=['正常签署','29%'];

    for(int i=0;i<2;i++){
      // 文字左上角起始点
      Offset offset;
      double fontSize;
      FontWeight fontWeight;
      double y=30.0;
      if(i==0){
        //文字
        fontSize=20;

        offset =Offset(0,y);
      }else{
        //百分比
        fontSize=16;
        y=y-20;
        offset=Offset(0,y);
      }
      //  创建段落构造器
      _paragraph_builder = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          textAlign: TextAlign.right,
          fontSize: fontSize,
//          fontWeight: FontWeight.bold,
          textDirection: TextDirection.ltr,
//        maxLines: 5,
        ),
      );

      _paragraph_builder.pushStyle(
          ui.TextStyle(
              color: Colors.redAccent,
              textBaseline: ui.TextBaseline.alphabetic
          ));
      //添加要绘制的文本内容
      _paragraph_builder.addText(para[i]);

//    构建段落
      _paragraph = _paragraph_builder.build();
//设置文本的宽度约束
      ui.ParagraphConstraints constraint= ui.ParagraphConstraints(width: 100);
// 这里需要先layout,将宽度约束填入，否则无法绘制
      _paragraph.layout(constraint);


      //开始绘制
      canvas.drawParagraph(
          _paragraph,offset);
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
    return true;
//    在这个函数中，你应该返回true或false。如果你的绘画依赖于一个变量并且该变量发生了变化，那么你在这里返回true，
//    这样Flutter就知道它必须调用paint方法来重绘你的绘画。否则，在此处返回false表示您不需要重绘。

  }
}