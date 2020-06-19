import 'package:flutter/material.dart';
import 'expand_state_bean.dart';
import 'expansion_panel_list.dart' as fold;
//import 'fold_expand_event_bust.dart';
import 'index_controller.dart';
import 'select_data.dart';
//头部点击回调
typedef HeaderClickCallback = void Function(int panelIndex, bool isExpanded);
//子项点击回调
typedef SubItemClickCallback = void Function(int parentIndex, int childIndex);

class ZLExpansionPanelList extends StatefulWidget {
  IndexController indexController;
  SelectDataModel _selectDataModel;
  final bool hasDividers;//分割线
  final bool canTapOnHeader;//是否可以点击头部
  final List <Widget>headerWidgets;
  final List <List<Widget>> subWidgets;//子项视图
  final HeaderClickCallback headerClickCallback;//头部点击回调
  final SubItemClickCallback subItemClickCallback;//子项点击回调
  ZLExpansionPanelList(this.indexController, this.headerWidgets, this.subWidgets,{Key key,this.hasDividers=true,this.canTapOnHeader = false,this.headerClickCallback,this.subItemClickCallback}):super(key: key);
  ZLExpansionPanelListState createState() => ZLExpansionPanelListState();
}
class ZLExpansionPanelListState extends State<ZLExpansionPanelList> {
  //记录headerIndex;
  List <int>_mList=[];
  //记录headerIndex对应的折叠状态
  List<ExpandStateBean> _expandStateList;

  int selectHeaderIndex;
  int selectSubIndex;
  loadData(){
    print('取消全选/加载新数据');
    _mList=new List();
    _expandStateList=new List();

    for(int i=0;i<widget.headerWidgets.length;i++){
      _mList.add(i);
      _expandStateList.add(ExpandStateBean(i,false));//默认全部折叠
    }
  }
  //全选
  selectAll(){
    print('全选');
    _mList=new List();
    _expandStateList=new List();
    for(int i=0;i<widget.headerWidgets.length;i++){
      _mList.add(i);
      _expandStateList.add(ExpandStateBean(i,true));//默认全部折叠
    }
  }
  //修改展开与闭合的内部方法
  _setCurrentIndex(int index,isExpand){
    setState(() {
      //遍历可展开状态列表
      _expandStateList.forEach((item){
        if(item.index==index){
          item.isOpen=!isExpand;
        }
      });
    });
  }
  var result;
//监听Bus events
//  void _listen(){
//    eventBus.on<ChangeIndexEventBus>().listen((event){
//      print('===${event.changeSubIndex}====${event.changeHeaderIndex}');
//      selectHeaderIndex=event.changeHeaderIndex;
//      selectSubIndex=event.changeSubIndex;
//      setState(() {
//
//      });
//    });
//  }
  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _listen();
    widget._selectDataModel=new SelectDataModel(0, 0);
    widget.indexController.setSelectedDataModel(widget._selectDataModel);
    widget.indexController?.indexPosition?.addListener(_indexChanged);
    loadData();
  }
  void _indexChanged(){

     SelectDataModel oldModel=widget.indexController.indexPosition.value[0];
     SelectDataModel newModel=widget.indexController.indexPosition.value[1];
     selectHeaderIndex=newModel.selectedHeaderIndex;
     selectSubIndex=newModel.selectedSubIndex;
      print('我要刷新了${selectHeaderIndex}===${selectSubIndex}');
      setState(() {

      });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child:fold.ExpansionPanelList(
          hasDividers: widget.hasDividers,
          //交互回调属性，里面是个匿名函数
          expansionCallback: (index,bol){
            //调用内部方法
            _setCurrentIndex(index, bol);
            widget.headerClickCallback(index,bol);
          },
          //进行map操作，然后用toList再次组成List
          children:
          _mList.map((index){
            //返回一个组成的ExpansionPanel
            return
              fold.ExpansionPanel(
                headerBuilder: (context,isExpanded){
                  return widget.headerWidgets[index];
                },
                body: Container(
                    child:
                    Column(
                      children:
                      <Widget>[
                        subWidget(widget.subWidgets[index], index),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    )
                ),
                isExpanded:_expandStateList[index].isOpen,//闭合状态
                canTapOnHeader: widget.canTapOnHeader,
              );
          }).toList(),
        ),
      ),
    );
  }

  Widget subWidget(List subWidget,int index){
    List <int>smList=new List();
    for(int i=0;i<subWidget.length;i++){
      smList.add(i);
    }
    //点击后背景发生变化
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children:smList.map((subIndex){
        return Material(
            color: selectHeaderIndex==index&&selectSubIndex==subIndex?Colors.red:Colors.transparent,// index==selectHeaderIndex&&subIndex==selectSubIndex?Colors.red:Colors.transparent,
            child: Ink(
                width: double.infinity,
                padding: EdgeInsets.only(left: 15,right: 15),
                child: InkWell(
                  onTap: (){
                    widget.subItemClickCallback(index,subIndex);
                    selectHeaderIndex=index;
                    selectSubIndex=subIndex;
                    setState(() {
                    });
                  },
                  child: subWidget[subIndex],
                )
            ),
          elevation: 0,
        );
      }
      ).toList(),
    );
  }
}