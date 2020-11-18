//import 'package:flutter/material.dart';
//import 'package:rxdart/rxdart.dart';
//import 'dart:async';
//
//class RxDartDemo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('stream'),
//      ),
//      body: RXDemoHome(),
//    );
//    ;
//  }
//}
//
//class RXDemoHome extends StatefulWidget {
//  @override
//  _RXDemoHomeState createState() => _RXDemoHomeState();
//}
//
//class _RXDemoHomeState extends State<RXDemoHome> {
//  PublishSubject<String> _textFieldSubject;
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//    _textFieldSubject.close();
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _textFieldSubject = PublishSubject<String>();
//    _textFieldSubject
////        .where((item)=>item.length>3)
////        .map((item)=>'item:$item')
//
//        .debounce(
//            Duration(milliseconds: 500)) //设置间隔时间，如果用户不断输入，输入停止一段时间才会让当前数据通过
//        .listen((data) {
//      print(data);
//    });
//
//    //observable继承了stream;
////    Observable<String> _observable=Observable(Stream.fromIterable(['hello','您好']));
////    Observable<String> _observable=Observable.fromFuture(Future.value('hello***'));
////    Observable<String> _observable=Observable.fromIterable(['hello','您好']);//来自于一个可迭代的数据
////    Observable<String> _observable=Observable.just('hello');
////    Observable<String> _observable=Observable.periodic(Duration(seconds: 3),(x)=>x.toString()); //时间间隔重复出现的
////    _observable.listen(print);
//
////    PublishSubject相当于 StreamController，特别的 StreamController
////  PublishSubject<String>_subject=PublishSubject<String>();//按顺序监听
//    //最后一个添加的数据给新来的监听
////    BehaviorSubject<String> _subject=BehaviorSubject<String>();
//    //全部交个监听起
////      ReplaySubject<String> _subject=ReplaySubject<String>();
////    ReplaySubject<String> _subject=ReplaySubject<String>(maxSize: 2);
////    _subject.listen((data)=>print('listern1:${data}'));//有数据时要做的事；相当于给Observable添加了一个订阅；
////    _subject.add('hello');
////    _subject.listen((data)=>print('listern2:${data.toUpperCase()}'));
////    _subject.add('haga');
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Theme(
//      data: Theme.of(context).copyWith(
//        primaryColor: Colors.black,
//      ),
//      child: TextField(
//        onChanged: (value) {
//          _textFieldSubject.add('input:$value');
//        },
//        onSubmitted: (value) {
//          _textFieldSubject.add('submitted:$value');
//        },
//        decoration: InputDecoration(
//          labelText: 'Title',
//          filled: true,
//        ),
//      ),
//    );
//  }
//}

import "package:flutter/material.dart";

class RxDartDemo extends StatefulWidget {
  @override
  _RxDartDemoState createState() => new _RxDartDemoState ();
}

class _RxDartDemoState extends State<RxDartDemo> {

  Widget build(BuildContext context) {
    return new Scaffold(
//      drawer: new Drawer(),
      endDrawer: Drawer(),
      appBar: new AppBar(
      ),
      body: SearchButton(),
    );
  }
}
//搜索
class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              padding: EdgeInsets.only(left: 8,right: 8),
              width:  double.infinity,
              child: Builder(builder: (context)=>OutlineButton(
                splashColor: Colors.transparent,
                highlightColor:Colors.transparent,
                highlightedBorderColor: Colors.grey,
                borderSide: BorderSide(color: Colors.grey,width: 1),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
//                 Scaffold.of(context).openDrawer();
                },
              ),)
            ),
          ),
          Positioned(
            child:Icon(Icons.search,color: Colors.grey,size: 24,),
            top: 13,
            left: 15,
          ),
        ],
      );
  }
}