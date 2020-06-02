import 'package:flutter/material.dart';
import 'zlfoldlist.dart' as fold;
import 'expandstatebean.dart';

//头部点击回调
typedef HeaderClickCallback = void Function(int panelIndex, bool isExpanded);
//子项点击回调
typedef SubItemClickCallback = void Function(int parentIndex, int childIndex);
class ZLExpansionPanelList extends StatefulWidget {
 final bool hasDividers;//分割线
 final double marginBottom;//底部间隔
 final Icon icon;//图片下箭头，复选框不适用
 final bool canTapOnHeader;//是否可以点击头部
 final Alignment textAlignment;//
 final List headerList;//头部数据信息
 final List subItemList;//子项数据信息
 final HeaderClickCallback headerClickCallback;//头部点击回调
 final SubItemClickCallback subItemClickCallback;//子项点击回调
 final List<int> mList;//记录头部index
 final List<ExpandStateBean> expandStateList;//记录index对应的折叠状态
 List<int> _smList;//记录子项index

 ZLExpansionPanelList(this.headerList,this.subItemList,this.mList,this.expandStateList,{Key key,this.hasDividers=true, this.marginBottom=0, this.icon=const Icon(Icons.expand_more),
   this.textAlignment=Alignment.centerLeft,this.canTapOnHeader = false,this.headerClickCallback,this.subItemClickCallback}){
//   _mList=new List();//组成一个int类型数组，用来控制索引

//   _expandStateList=new List();
   _smList=new List();
//
//   for(int i=0;i<headerList.length;i++){
//     _mList.add(i);
//     _expandStateList.add(ExpandStateBean(i,false));//默认全部折叠
//   }

 }
  ZLExpansionPanelListState createState() => ZLExpansionPanelListState();
}

class ZLExpansionPanelListState extends State<ZLExpansionPanelList> {
  //修改展开与闭合的内部方法
  _setCurrentIndex(int index,isExpand){
    setState(() {
      //遍历可展开状态列表
     widget.expandStateList.forEach((item){
        if(item.index==index){
          //取反，经典取反方法
          item.isOpen=!isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.red,
      child: SingleChildScrollView(
        child:fold.ExpansionPanelList(
          icon: widget.icon,
          hasDividers: widget.hasDividers,
          //交互回调属性，里面是个匿名函数
          expansionCallback: (index,bol){
            //调用内部方法
//            print('headerClickIndex:$index+$bol');
            _setCurrentIndex(index, bol);
            widget.headerClickCallback(index,bol);

          },
          //进行map操作，然后用toList再次组成List
          children: widget.mList.map((index){
            //返回一个组成的ExpansionPanel
            return
              fold.ExpansionPanel(
              headerBuilder: (context,isExpanded){
                return Container(
                  alignment: widget.textAlignment,
//                  color: Colors.green,
                  child:  Text('${widget.headerList[index]}'),
                );
              },
              body: Container(
//                color: Colors.yellow,
                child://manuallyListView(),// builderListView(),
                Column(
                  children:
                  <Widget>[
                    subWidget(widget.subItemList[index],index),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )
              ),
              isExpanded:widget.expandStateList[index].isOpen,//闭合状态
              canTapOnHeader: widget.canTapOnHeader,
            );
          }).toList(),
        ),
      ),
    );
  }
  Widget subWidget(List list ,int index){
    List <int>smList=new List();
    for(int i=0;i<list.length;i++){
      smList.add(i);
    }
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: smList.map((subIndex){
        return Material(
            child: Ink(
                color: Colors.red,
                child: InkWell(
                  onTap: (){
//                    print('======$subIndex');
                    widget.subItemClickCallback(index,subIndex);
                  },
                  child: Container(
                    color: Colors.green,margin: EdgeInsets.fromLTRB(15, 10, 10, 0),
                    width: double.infinity,
                    child:Text(list[subIndex]),
                  ),
                )
            )
        );
      }
      ).toList(),
    );
  }
}
