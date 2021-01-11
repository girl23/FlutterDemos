
//import 'dart:async';
//import 'dart:io';
//
//import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:flutter_fullpdfview/flutter_fullpdfview.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  String pathPDF = "";
//  String corruptedPathPDF = "";
//
//  @override
//  void initState() {
//    super.initState();
////    fromAsset('assets/sample22.pdf', 'sample22.pdf').then((f) {
////      setState(() {
////        corruptedPathPDF = f.path;
////      });
////    });
////    fromAsset('assets/sample177.pdf', 'sample177.pdf').then((f) {
////      setState(() {
////        pathPDF = f.path;
////      });
////    });
//  createFileOfPdfUrl().then((f){
//    setState(() {
//      pathPDF=f.path;
//      corruptedPathPDF=f.path;
//    });
//  });
//  }
//
//  Future<File> createFileOfPdfUrl() async {
//    // final url =
//    // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
//    final url = "https://pdfkit.org/docs/guide.pdf";
//    final filename = url.substring(url.lastIndexOf("/") + 1);
//    var request = await HttpClient().getUrl(Uri.parse(url));
//    var response = await request.close();
//    var bytes = await consolidateHttpClientResponseBytes(response);
//    String dir = (await getApplicationDocumentsDirectory()).path;
//    File file = File('$dir/$filename');
//    await file.writeAsBytes(bytes);
//    return file;
//  }
//
//  Future<File> fromAsset(String asset, String filename) async {
//    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
//    Completer<File> completer = Completer();
//
//    try {
//      var dir = await getApplicationDocumentsDirectory();
//      File file = File("${dir.path}/$filename");
//      var data = await rootBundle.load(asset);
//      var bytes = data.buffer.asUint8List();
//      await file.writeAsBytes(bytes, flush: true);
//      completer.complete(file);
//    } catch (e) {
//      throw Exception('Error parsing asset file!');
//    }
//
//    return completer.future;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter PDF View',
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//        appBar: AppBar(title: const Text('Plugin example app')),
//        body: Center(child: Builder(
//          builder: (BuildContext context) {
//            return Column(
//              children: <Widget>[
//                RaisedButton(
//                    child: Text("Open PDF"),
//                    onPressed: () {
//                      if (pathPDF != null) {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => PDFScreen(path: pathPDF)),
//                        );
//                      }
//                    }),
//                RaisedButton(
//                    child: Text("Open Corrupted PDF"),
//                    onPressed: () {
//                      if (pathPDF != null) {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) =>
//                                  PDFScreen(path: corruptedPathPDF)),
//                        );
//                      }
//                    })
//              ],
//            );
//          },
//        )),
//      ),
//    );
//  }
//}
//
//class PDFScreen extends StatefulWidget {
//  final String path;
//  PDFScreen({Key key, this.path}) : super(key: key);
//
//  _PDFScreenState createState() => _PDFScreenState();
//}
//
//class _PDFScreenState extends State<PDFScreen> {
//  int pages = 0;
//  bool isReady = false;
//  String errorMessage = '';
//  GlobalKey pdfKey = GlobalKey();
//
//  @override
//  Widget build(BuildContext context) {
//    return OrientationBuilder(
//        builder: (BuildContext context, Orientation orientation) {
//          if (orientation == Orientation.portrait) {
//            final Completer<PDFViewController> _controller =
//            Completer<PDFViewController>();
//            return Scaffold(
//              appBar: AppBar(
//                title: Text("Document"),
//                actions: <Widget>[
//                  IconButton(
//                    icon: Icon(Icons.share),
//                    onPressed: () {},
//                  ),
//                ],
//              ),
//              body: Stack(
//                children: <Widget>[
//                  Container(
//                    color: Colors.black,
//                    child: PDFView(
//                      key: pdfKey,
//                      filePath: widget.path,
//                      fitEachPage: true,
//                      fitPolicy: FitPolicy.BOTH,
//                      dualPageMode: false,
//                      enableSwipe: true,
//                      swipeHorizontal: false,
//                      autoSpacing: true,
//                      pageFling: true,
//                      defaultPage: 8,
//                      pageSnap: true,
//                      backgroundColor: bgcolors.WHITE,
//                      onRender: (_pages) {
//                        print("OK RENDERED!!!!!");
//                        setState(() {
//                          pages = _pages;
//                          isReady = true;
//                        });
//                      },
//                      onError: (error) {
//                        setState(() {
//                          errorMessage = error.toString();
//                        });
//                        print(error.toString());
//                      },
//                      onPageError: (page, error) {
//                        setState(() {
//                          errorMessage = '$page: ${error.toString()}';
//                        });
//                        print('$page: ${error.toString()}');
//                      },
//                      onViewCreated: (PDFViewController pdfViewController) {
//                        _controller.complete(pdfViewController);
//                      },
//                      onPageChanged: (int page, int total) {
//                        print('page change: $page/$total');
//                      },
//                    ),
//                  ),
//                  errorMessage.isEmpty
//                      ? !isReady
//                      ? Center(
//                    child: CircularProgressIndicator(),
//                  )
//                      : Container()
//                      : Center(child: Text(errorMessage))
//                ],
//              ),
//              floatingActionButton: FutureBuilder<PDFViewController>(
//                future: _controller.future,
//                builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
//                  if (snapshot.hasData) {
//                    return FloatingActionButton.extended(
//                      label: Text("Go to ${pages ~/ 2}"),
//                      onPressed: () async {
//                        print(await snapshot.data.getZoom());
//                        print(await snapshot.data.getPageWidth(1));
//                        print(await snapshot.data.getPageHeight(1));
//                        //await snapshot.data.setPage(pages ~/ 2);
//                        await snapshot.data.resetZoom(1);
//                        //print(await snapshot.data.getScreenWidth());
//                      },
//                    );
//                  }
//
//                  return Container();
//                },
//              ),
//            );
//          } else {
//            final Completer<PDFViewController> _controller =
//            Completer<PDFViewController>();
//            return PDFView(
//              filePath: widget.path,
//              fitEachPage: false,
//              dualPageMode: true,
//              displayAsBook: true,
//              dualPageWithBreak: true,
//              enableSwipe: true,
//              swipeHorizontal: false,
//              autoSpacing: false,
//              pageFling: true,
//              defaultPage: 0,
//              pageSnap: true,
//              backgroundColor: bgcolors.WHITE,
//              onRender: (_pages) {
//                print("OK RENDERED!!!!!");
//                setState(() {
//                  pages = _pages;
//                  isReady = true;
//                });
//              },
//              onError: (error) {
//                setState(() {
//                  errorMessage = error.toString();
//                });
//                print(error.toString());
//              },
//              onPageError: (page, error) {
//                setState(() {
//                  errorMessage = '$page: ${error.toString()}';
//                });
//                print('$page: ${error.toString()}');
//              },
//              onViewCreated: (PDFViewController pdfViewController) {
//                _controller.complete(pdfViewController);
//              },
//              onPageChanged: (int page, int total) {
//                print('page change: $page/$total');
//              },
//            );
//          }
//        });
//  }
//}

import 'package:flutter/material.dart';
import 'package:flutterdemo/urllauchertest/zl_url_laucher.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'dropMenu.dart';
import 'bubblePage.dart';
import 'paint/paintTest.dart';
import 'zlpopmenu/testQpMenu.dart';
import 'package:flutterdemo/buju/Container.dart';
import 'biaoge/biaoge.dart';
import 'xml/xmlDemo.dart';
import 'Stream/stream_demo.dart';
import 'rxdartDemo/rxdart_demo.dart';
//import 'zhedie/test_zedie.dart';
import 'listflodexpand/test_expand_wiget.dart';
import 'pathOperator/path_operator.dart';
import 'sqflite/test_sqflite.dart';
import 'PDF/use_pdf_screen.dart';
import 'package:flutterdemo/zlpopmenu/popWindowDemo.dart';
import 'Animation/animation_demo.dart';
import 'dart:ui';
import 'package:flutterdemo/QR/QRTest.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        accentColor: Colors.orange
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body:builderListView(), //autoListView(),//manuallyListView(),
        // This trailing comma makes auto-formatting nicer for build methods.
      ) ;

  }
}

Widget manuallyListView(){
  return ListView(
    padding: EdgeInsets.only(bottom: 15),
    scrollDirection: Axis.vertical,//垂直列表
    children: <Widget>[
      ListTile(
        title: Text('Flutter Image组件'),
        subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 使用资源图片前必做两个步骤： 1、在根目录下创建子目录，子目录中创建2.0x和3.0x（也可以创建4.0x、5.0x... 但是2.0和3.0是必须的）目录，在对应目录中添加对应分辨率图片。（图1） 2、打开pubspec.yaml文件',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: Icon(Icons.settings),
      ),

      ListTile(
        title: Text('Flutter Container 组件'),
        subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 Container 官网简介：一个便利的小部件，结合了常见的绘画，定位和大小调整小部件。 其实就是一个容器组件，既然是容器，那么，就一定可以装很多东西，而Container装的东西就是Flutter 其他组件。 参数详解 属性 说明',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: Icon(Icons.settings),
      ),
    ],
  );
}

///2自动生成ListView
List<Widget> getData(){
  List<Widget> list = new List();
  for(int i = 0; i < 20; i++){
    list.add(
      ListTile(
        title: Text('循环添加列表元素$i'),
      ),
    );

  }
  return list;
}

Widget autoListView(){
  return ListView(
    children: getData(),
  );
}
///3使用ListView.builder加载数据
Widget builderListView(){
  // 创建包含所有元素的可改变长度列表
  List list =['url_launcher使用','dropMenu','气g泡','绘制d基础','气泡菜单','布局','表格','xml','Stream','xrDart','折叠列表','数据库','路径','PDF阅读','表头','animation','扫码'];
//  print(list.length);
  // 为所有元素统一赋值kg
//  List list = new List<int>.filled(3, 0);
  // 用生成器给所有元素赋初始值
//  List list= new List<int>.generate(4, (int index) {
//    return index * index;
//  });
  // 创建包含所有元素的固定长度列表

//  List fixedLengthListB = new List.unmodifiable([1, 2, 3]);
//  print(fixedLengthListB.length);
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
            child:  ListTile(
              title: Text(list[index].toString()),
            ),
            onTap: (){
              print('tPn $index');
              switch(index){
                case 0:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ZlUrlLauncher(list[index].toString())));
                  break;
                case 1:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenusDemo()));
                  break;
                case 2:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BubblePage()));
                  break;
                case 3:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaintTest()));
                  break;
                case 4:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestMenusDemo()));
                  break;
                case 5:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContainerBj()));
                  break;
                case 6:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyTableDemo()));
                  break;
                case 7:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => XMLDemo()));
                  break;
                case 8:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StreamDemo()));
                  break;
                case 9:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RxDartDemo()));
                  break;
                case 10:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ZeDieDemo()));
                  break;
                case 11:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SqfliteTest()));
                  break;
                case 12:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PathDemo()));
                  break;
                case 13:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UsePDFScreen()));
                  break;
                case 14:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PopWindowDemo()));
                  break;
                case 15:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimationDemo()));
                  break;
                case 16:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRTest()));
                  break;
                default:
                  break;
              }

            },
      ) ;

    },
  );
}

Widget builderListView1(){
return ListView.builder(
    itemCount: 3,
    itemBuilder: (BuildContext context, int index) {
      return Text(
      '文本添加颜色',
      style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(100, 0, 0, 128)),
      );
    }
  );
}