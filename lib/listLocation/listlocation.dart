import 'package:flutter/material.dart';
class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('stream'),
      ),
      body: ListLocationDemo(),
    );
  }
}
class ListLocationDemo extends StatefulWidget {
  @override
  _ListLocationDemoState createState() => _ListLocationDemoState();
}

class _ListLocationDemoState extends State<ListLocationDemo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
