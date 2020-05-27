import 'package:flutter/material.dart';

class MyTableDemo extends StatefulWidget {
  @override
  _MyTableDemoState createState() => _MyTableDemoState();
}

class _MyTableDemoState extends State<MyTableDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: Center(

        child:Material(
          child: DataTable(
            columns: [
              DataColumn(label: Text('姓名')),
              DataColumn(label: Text('年龄')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('老孟')),
                DataCell(Text('18')),
              ]),
            ],
          ),
        )

      ),

    );

  }
}
