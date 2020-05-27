import 'dart:async';

import 'package:flutter/material.dart';
class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('stream'),
      ),
      body: StreamDemoHome(),
    );
  }
}
class StreamDemoHome extends StatefulWidget {

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;//声明一个订阅

  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;

  @override
  void dispose() {
    _streamDemo.close();
    // TODO: implement dispose
    super.dispose();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('create a stream');
//    Stream<String>_streamDemo=Stream.fromFuture(fetchData());//流对象操作
//    _streamDemo=StreamController<String>();//控制器操作,只能被订阅一次
    _streamDemo=StreamController.broadcast();//能被多次订阅
    _sinkDemo=_streamDemo.sink;
    print('start');
//    _streamDemo.listen(onData);//流对象操作
//   _streamSubscription= _streamDemo.listen(onData,onError: onError,onDone: onDone);//流对象操作
   _streamSubscription =_streamDemo.stream.listen(onData,onError: onError,onDone: onDone);//控制器操作
    _streamDemo.stream.listen(onDataTwo,onError: onError,onDone: onDone);
    print('complete');
  }
  void onData(String data){
//    throw('somethine happen');
    print('$data');
  }
  void onDataTwo(String data){
//    throw('somethine happen');
    print('onDataTwo:$data');
  }
  void onError(error){
    print('$error');
  }
  void onDone(){
    print('Done');
  }
  Future<String>fetchData() async{
    await Future.delayed(Duration(seconds: 3));
    return 'hello';
  }
  void _pauseStream(){
    print('Pause subScription');
    _streamSubscription.pause();

  }
  void _resumeStream(){
    print('resume subScription');
    _streamSubscription.resume();
  }
  void _cancelStream(){
    print('cancel subScription');
    _streamSubscription.cancel();
  }
  void _addDataToStream() async{
    print('addDataToStream');
    String data=await fetchData();
//    _streamDemo.add(data);

    _sinkDemo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //根据Stream的小部件去构建数据，数据变化后会重新构建小部件
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',//初始值
              builder: (context,snapshot){
                return Text('${snapshot.data}');//获取到值后更新
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(onPressed: _pauseStream, child: Text('Pause')),
                FlatButton(onPressed: _resumeStream, child: Text('Resume')),
                FlatButton(onPressed: _cancelStream, child: Text('Cancel')),
                FlatButton(onPressed: _addDataToStream, child: Text('Add')),
              ],
            ),
          ],
        )

      ),
    );
  }
}

