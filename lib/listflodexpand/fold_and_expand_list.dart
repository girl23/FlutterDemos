import 'package:flutter/material.dart';
import 'expand_state_bean.dart';
import 'expansion_panel_list.dart' as fold;

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

  List<int> _smList;//记录子项index
  ZLExpansionPanelList(this.headerList,this.subItemList,{Key key,this.hasDividers=true, this.marginBottom=0, this.icon=const Icon(Icons.expand_more),
    this.textAlignment=Alignment.centerLeft,this.canTapOnHeader = false,this.headerClickCallback,this.subItemClickCallback}):super(key: key);
  ZLExpansionPanelListState createState() => ZLExpansionPanelListState();
}

class ZLExpansionPanelListState extends State<ZLExpansionPanelList> {
  //  //取消全选和加载数据
  List <int>mList=[];
  List<ExpandStateBean> expandStateList;
  List<int> _smList;//记录子项index

  loadData(){
    print('取消全选/加载新数据');
    mList=new List();
    expandStateList=new List();
    _smList=new List();
    for(int i=0;i<widget.headerList.length;i++){
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,false));//默认全部折叠
    }
  }
  //全选
  selectAll(){
    print('全选');
    mList=new List();
    expandStateList=new List();
    for(int i=0;i<widget.headerList.length;i++){
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,true));//默认全部折叠
    }
  }

  //修改展开与闭合的内部方法
  _setCurrentIndex(int index,isExpand){
    setState(() {
      //遍历可展开状态列表
      expandStateList.forEach((item){
        if(item.index==index){
          //取反，经典取反方法
          item.isOpen=!isExpand;
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
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
          mList.map((index){
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
                isExpanded:expandStateList[index].isOpen,//闭合状态
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
