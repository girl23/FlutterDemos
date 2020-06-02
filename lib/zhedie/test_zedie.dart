import 'package:flutter/material.dart';
import 'zhedie.dart';
import 'expandstatebean.dart';
class ZeDieDemo extends StatefulWidget {
  @override
  _ZeDieDemoState createState() => _ZeDieDemoState();
}

class _ZeDieDemoState extends State<ZeDieDemo> {
  List headerList;
  List <int> mList;//组成一个int类型数组，用来控制索引
  List <ExpandStateBean> expandStateList;
  //取消全选和加载数据
  loadData(){
    headerList=new List.from(['文科','理科','艺术']);
    mList=new List();
    expandStateList=new List();
    for(int i=0;i<headerList.length;i++){
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,false));//默认全部折叠
    }
  }
  //全选
  selectAll(){
    headerList=new List.from(['文科','理科','艺术']);
    mList=new List();
    expandStateList=new List();
    for(int i=0;i<headerList.length;i++){
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,true));//默认全部折叠
    }
  }
  bool value=false;

//  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    print('$mList=====$expandStateList');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('fold/expand'),
      ),
      body:Container(
          width: 200,
          child: Column(
            children: <Widget>[
              ZLExpansionPanelList(headerList,[['1','2777776gkhdajgaljgalhglajglajglajgljaljglajglajgljajg'],['3','4','5'],['6','7']],mList,expandStateList,hasDividers: true,icon:const Icon(Icons.add),textAlignment: Alignment.centerLeft,marginBottom: 10,headerClickCallback: (index,expand){
    print('####$index---$expand');
              },subItemClickCallback: (parentIndex,subIndex){
                print('******$parentIndex---$subIndex');
              }),
              Checkbox(
                value: this.value,
                onChanged: (bool value) {
                  print('=====$value');
                  setState(() {
                    if(value){
                      print('全选');
                      selectAll();
                    }else{
                      print('取消全选');
                      loadData();
                    }
                  });
                  this.value=!this.value;
                },
              ),
            ],
          )
      ),
    );
  }
}
