import 'package:flutter/material.dart';
import 'zlfoldlist.dart' as fold;
typedef HeaderClickCallback = void Function(int panelIndex, bool isExpanded);
typedef SubItemClickCallback = void Function(int parentIndex, int childIndex);
class ZLExpansionPanelList extends StatefulWidget {
 final bool hasDividers;
 final double marginBottom;
 final Icon icon;
 final Alignment textAlignment;
 final List headerList;
 final HeaderClickCallback headerClickCallback;
 final SubItemClickCallback subItemClickCallback;
 List<int> _mList;
 List<ExpandStateBean> _expandStateList;
 List<int> _smList;
 List _sublist;
 ZLExpansionPanelList(this.headerList,{this.hasDividers=true, this.marginBottom=0, this.icon=const Icon(Icons.expand_more),
   this.textAlignment=Alignment.centerLeft,this.headerClickCallback,this.subItemClickCallback}){
   _mList=new List();//组成一个int类型数组，用来控制索引
   _expandStateList=new List();
   _sublist=new List.from([['1','2777776gkhdajgaljgalhglajglajglajgljaljglajglajgljajg'],['3','4','5'],['6','7']]);
   _smList=new List();
   for(int i=0;i<headerList.length;i++){
     _mList.add(i);
     _expandStateList.add(ExpandStateBean(i,false));
   }
 }

  _ZLExpansionPanelListState createState() => _ZLExpansionPanelListState();
}

class _ZLExpansionPanelListState extends State<ZLExpansionPanelList> {
  //修改展开与闭合的内部方法
  _setCurrentIndex(int index,isExpand){
    setState(() {
      //遍历可展开状态列表
     widget._expandStateList.forEach((item){
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
          children:
          widget._mList.map((index){
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
                    subWidget(widget._sublist[index],index),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )
              ),
              isExpanded:widget._expandStateList[index].isOpen,//闭合状态
              canTapOnHeader: true,
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


//list中item状态自定义类
class ExpandStateBean{
  var isOpen;   //item是否打开
  var index;    //item中的索引
  ExpandStateBean(this.index,this.isOpen);
}


