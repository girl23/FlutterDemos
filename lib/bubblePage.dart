//气泡
import 'package:flutter/material.dart';
import 'package:flutter_bubble/bubble_widget.dart';
import 'dart:math';
class BubblePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(pi.toString());
    return new Scaffold(
        appBar: AppBar(

        title: Text('bubblePage'),
        ),
      body: Center(child:ListView(children: <Widget>[
        Padding(
            padding: EdgeInsets.all(4.0),
            child: Container(
                alignment: Alignment.centerRight,
                child: BubbleWidget(255.0, 200.0, Colors.green.withOpacity(0.7),
                    BubbleArrowDirection.top,
                    child: Text('你好，我是萌新 BubbleWidget！',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)
                    )
                )
            )
        ),
      ]) ,),
    );
  }
}
