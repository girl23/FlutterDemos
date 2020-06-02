import 'package:flutter/material.dart';
//import 'zhedie.dart';
//import 'expandstatebean.dart';
import 'expand_state_bean.dart';
import 'fold_and_expand_list.dart';

class ZeDieDemo extends StatefulWidget {
  @override
  _ZeDieDemoState createState() => _ZeDieDemoState();
}

class _ZeDieDemoState extends State<ZeDieDemo> {

 final GlobalKey<ZLExpansionPanelListState>key=GlobalKey<ZLExpansionPanelListState>();

  bool value=false;

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
              ZLExpansionPanelList(['文科','理科','艺术'],[['1','2777776gkhdajgaljgalhglajglajglajgljaljglajglajgljajg'],['3','4','5'],['6','7']],hasDividers: true,icon:const Icon(Icons.add),textAlignment: Alignment.centerLeft,marginBottom: 10,headerClickCallback: (index,expand){
                print('####$index---$expand');
              },subItemClickCallback: (parentIndex,subIndex){
                print('******$parentIndex---$subIndex');
              },key: key,),
              Checkbox(
                value: this.value,
                onChanged: (bool value) {
                  print('=====$value');
                  if(value){
                    print('全选');
                    key.currentState.selectAll();
                  }else{
                    print('取消全选');
                    key.currentState.loadData();
                  }
//                  key.currentState.test();
                  setState(() {
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
