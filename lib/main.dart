
import 'package:flutter/material.dart';
import 'package:flutterdemo/urllauchertest/zl_url_laucher.dart';
import 'dropMenu.dart';
import 'bubblePage.dart';
import 'paint/paintTest.dart';
import 'zlpopmenu/testQpMenu.dart';
import 'package:flutterdemo/buju/Container.dart';
import 'biaoge/biaoge.dart';
import 'xml/xmlDemo.dart';
import 'Stream/stream_demo.dart';
import 'rxdartDemo/rxdart_demo.dart';
//import 'zhedie/zhedie.dart';
import 'zhedie/test_zedie.dart';

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
    );
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
  List list =new List.from(['url_launcher使用','dropmenu','气泡','绘制基础','气泡菜单','布局','表格','xml','Stream','xrdart','折叠列表']);
  // 为所有元素统一赋值
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
          print('tpan ${index}');


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

           default:
             break;
         }
          //路由跳转  并 传值    固定写法  PageB 为目标页面类名  传值
//          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageB(para: '你好',)));
          //一般使用第三方企业级路由


        },
      );

    },
  );

}

