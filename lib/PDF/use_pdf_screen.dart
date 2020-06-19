import 'package:flutter/material.dart';
import 'pdf_screen.dart';
class UsePDFScreen extends StatefulWidget {
  @override
  _UsePDFScreenState createState() => _UsePDFScreenState();
}

class _UsePDFScreenState extends State<UsePDFScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plugin example app')),
      body:  Column(
        children: <Widget>[
          RaisedButton(
              child: Text("Open PDF"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PDFScreen(path: "https://pdfkit.org/docs/guide.pdf",)));
              }),
        ],
        ),
      );
  }
}

