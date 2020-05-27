import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml/xml_events.dart' as xml_events;
class XMLDemo extends StatefulWidget {
  @override
  _XMLDemoState createState() => _XMLDemoState();
}

class _XMLDemoState extends State<XMLDemo> {
//  print("xml");

 static var bookshelfXml = '''<?xml version = "1.0"?>
   <bookshelf>
      <book>
         <title lang = "english">Growing a Language</title>
         <price>29.99</price>
      </book>

      <book>
         <title lang = "english">Learning XML</title>
         <price>39.95</price>
      </book>
      <price>132.00</price>
   </bookshelf>''';


final document = xml.parse(bookshelfXml);

 _printLog(){
//   print(document.toString());
//   print(document.toXmlString(pretty: true, indent: '\t'));

   final textual = document.descendants
       .where((node) => node is xml.XmlText && !node.text.trim().isEmpty)
       .join('\n');
   print(textual);

   final titles = document.findAllElements('title');
   titles
       .map((node) => node.text)
       .forEach(print);

//   final total = document.findAllElements('book')
//       .map((node) => double.parse(node.findElements('price').single.text))
//       .reduce((a, b) => a + b);
//   print(total);


 }

  @override
  Widget build(BuildContext context) {
    _printLog();

    return new Scaffold(
      appBar: new AppBar(
      title: new Text(''),
      ),
      body: Center(

      child:Text(''),

      ),

      );
  }
}

//  _printLog(){
//    print("=============findAllElements=");
//    print(document.findAllElements('bookshelf').toString());
//    print("=============findElements=");
//    print(document.findElements('bookshelf'));
//    print("=============children=");
//    print(document.children);
//    print(document.findAllElements('bookshelf').toString());


//拿到更元素
//    XmlElement element=document.rootElement;
//    print(element.name);
//    bookshelf
//    print("=============");
//    print(element.children);//子节点

//    [
//    , <book>
//    <title lang="english">Growing a Language</title>
//    <price>29.99</price>
//    </book>,
//
//    , <book>
//    <title lang="english">Learning XML</title>
//    <price>39.95</price>
//    </book>,
//    , <price>132.00</price>,
//    ]
//    element.name;//根元素名称
//    element.attributes;//更元素属性
//    print(element.children.length);//包含字节点中点子元素
// 获取后代元素
//    Iterable<XmlNode> descens=element.descendants;
//    (
//        , <book>
//    <title lang="english">Growing a Language</title>
//    <price>29.99</price>
//    </book>,
//        , ..., 132.00,
//    )
//    print(element.depth);//根节点的深度为1；
//    print("=============");

//   遍历所有自节点，拿到节点
//    for(XmlNode node in element.children){
//
//      print(node.text);//获取节点内容
//      print('=====');
//      print(node.depth);
//    }
//  }