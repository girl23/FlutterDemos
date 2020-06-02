import 'package:flutter/material.dart';
import 'paint_circle.dart';
import 'dart:math';
class CircleProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child:  CustomPaint(
          painter: CirclePainter([Colors.red,Colors.blue,Colors.green],[50,30,20],center: Offset(50,50),radius: 40,startAngle:pi ,filled: true)
      ),
    );
  }
}
