import 'package:flutter/material.dart';
import 'zhedie.dart';
class ZeDieDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('fold/expand'),
      ),
      body:Container(
        width: 200,
//        child: ZLExpansionPanelList(hasDividers: true,icon: Icon(Icons.add),textAlignment: Alignment.center,marginBottom: 10,)
      child: ZLExpansionPanelList(['文科','理科','艺术'],hasDividers: true,icon:const Icon(Icons.add),textAlignment: Alignment.centerLeft,marginBottom: 10,headerClickCallback: (index,expand){
        print('####$index---$expand');
      },subItemClickCallback: (parentIndex,subIndex){
        print('******$parentIndex---$subIndex');
      }),
      ),
    );
  }
}