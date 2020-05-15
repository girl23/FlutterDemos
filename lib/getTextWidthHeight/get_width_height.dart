///获取宽高
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ChapterTextPainter extends CustomPainter {

  final String text;
  final double width;
  final double lineHeight;
  final TextStyle style;

  ChapterTextPainter({
    this.text,
    this.width,
    this.lineHeight,
    this.style,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var allChart = text.split('');
    double xOffset = 0.0;
    int yCharCount = 0;
    for (int i = 0; i < allChart.length; i++) {
      var char = allChart[i];
      TextSpan span = new TextSpan(style: style, text: char);
      TextPainter tp = new TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp.layout();
      if (char == '\n' || (xOffset + tp.size.width) > width) {
        xOffset = 0.0;
        yCharCount++;
      }
      var yOffset = yCharCount * lineHeight + (lineHeight - tp.size.height) / 2;
      tp.paint(canvas, new Offset(xOffset, yOffset));
      xOffset += 1 * tp.size.width;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is ChapterTextPainter) {
      return oldDelegate.text != text ||
          oldDelegate.style.color.value != style.color.value;
    }
    return false;
  }
}

class TextCanvas extends StatelessWidget {
  final String text;
  final double width;
  final double lineHeight;
  final TextStyle style;

  TextCanvas({
    Key key,
    this.text,
    this.width,
    this.lineHeight,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ChapterTextPainter(
        text: text,
        width: width,
        lineHeight: lineHeight,
        style: style,
      ),
    );
  }
}
