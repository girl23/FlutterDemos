import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'dart:io' show Directory;
import 'dart:io';

class PathDemo extends StatefulWidget {
  @override
  _PathDemoState createState() => _PathDemoState();
}

class _PathDemoState extends State<PathDemo> {
  void paths(){
      var newPath = path.join('/Users/shailen', 'dart/projects');
        print(newPath);
//    /Users/shailen/dart/projects

      print(path.split('/Users/shailen'));
    //    [/, Users, shailen]
      print(path.split(r'C:\tempdir\tmp.txt'));
//    [C:\tempdir\tmp.txt]
    //从当前目录到系统临时目录的路径
    print(path.relative(Directory.systemTemp.path));
//    Users/zhouli/Library/Developer/CoreSimulator/Devices/DF9FC044-57C2-4570-B793-7582055C19B7/data/Containers/Data/Application/04A245C0-2018-4CA9-ADC2-1E04235A37DA/tmp
    //使用相对路径
    var path1 = 'docs/book.html';
    var path2 = 'articles/list';
    print(path.relative(path1, from: path2));
    print(path.relative(path2, from: path1));
//    ../../docs/book.html
//    ../../articles/list
    //使用绝对路径
    var samples = 'http://www.dartlang.org/samples';
    var docs = 'http://www.dartlang.org/docs';
    print(path.relative(samples, from: docs));
    print(path.relative(docs, from: samples));
//    ../samples
//    ../docs

    var uri = path.toUri('http://dartlang.org/samples');
    print(path.fromUri(uri));
//    http:/dartlang.org/samples

    new File('${Directory.systemTemp.path}/dir/myFile.txt').create(recursive: true)
        .then((file) {
      //获取完整文件名
      print(path.basename(file.path));
//      myFile.txt
      //获取文件目录
      print(path.dirname(file.path));
//      /Users/zhouli/Library/Developer/CoreSimulator/Devices/DF9FC044-57C2-4570-B793-7582055C19B7/data/Containers/Data/Application/04A245C0-2018-4CA9-ADC2-1E04235A37DA/tmp/dir
      //获取文件名
      print(path.basenameWithoutExtension(file.path));
//      myFile
      //获取文件扩展名
      print(path.extension(file.path));
//      .txt
//
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paths();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text('path'),
      ),
      body: Container(),
    );
  }
}
