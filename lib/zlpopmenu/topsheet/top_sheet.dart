import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
const Duration _TopSheetDuration = Duration(milliseconds: 500);
var canvasHeight=20.0;
class XYTopSheet extends StatefulWidget {
  const XYTopSheet({
    Key key,
    this.animationController,
    this.enableDrag = true,
    @required this.onClosing,
    @required this.builder,
  }):super(key: key);

  final AnimationController animationController;

  final VoidCallback onClosing;

  final WidgetBuilder builder;

  final bool enableDrag;


  @override
  _XYTopSheetState createState() => _XYTopSheetState();

  static AnimationController createAnimationController(TickerProvider vsync) {
    return AnimationController(
      duration: _TopSheetDuration,
      debugLabel: 'TopSheet',
      vsync: vsync,
    );
  }
}

class _XYTopSheetState extends State<XYTopSheet> {


  void _handleDragEnd(DragEndDetails details) {
        widget.onClosing();
  }

  bool extentChanged(DraggableScrollableNotification notification) {
    if (notification.extent == notification.minExtent) {
      widget.onClosing();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final Widget topSheet = Material(
      child: NotificationListener<DraggableScrollableNotification>(
        onNotification: extentChanged,
        child: widget.builder(context),
      ),
    );
    return !widget.enableDrag ? topSheet : GestureDetector(
      onVerticalDragEnd: _handleDragEnd,
      child: topSheet,
      excludeFromSemantics: true,
    );
  }
}

// PERSISTENT BOTTOM SHEETS

// See scaffold.dart


// MODAL BOTTOM SHEETS
class _ModalTopSheetLayout extends SingleChildLayoutDelegate {


  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      maxHeight: constraints.maxHeight
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, 104);
  }

  @override
  bool shouldRelayout(_ModalTopSheetLayout oldDelegate) {
    return true;
  }
}

class _ModalTopSheet<T> extends StatefulWidget {
  const _ModalTopSheet({
    this.route,
  }) ;
  final _ModalTopSheetRoute<T> route;
  @override
  _ModalTopSheetState<T> createState() => _ModalTopSheetState<T>();
}

class _ModalTopSheetState<T> extends State<_ModalTopSheet<T>> {

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.route.animation,
      builder: (BuildContext context, Widget child) {
        final double animationValue = widget.route.animation.value;
        return ClipRect(
            child: CustomSingleChildLayout(
              delegate: _ModalTopSheetLayout(),
              child: Container(color:  Colors.red,height:canvasHeight*animationValue,
                alignment: Alignment.bottomCenter,
                child:SingleChildScrollView(child:
                  ChildWidget(info: XYTopSheet(
                    animationController: widget.route._animationController,
                    onClosing: () {
                      if (widget.route.isCurrent) {
                        print('guan');
                        Navigator.pop(context);
                      }
                    },
                    builder: widget.route.builder,
                   ),
                  ),
                ),
              ),
            ),
          );

      },
    );
  }
}
class ChildWidget extends SingleChildRenderObjectWidget {
  final Widget info;
  ChildWidget({
    @required this.info,
  }):super(child:info);

  @override
  RenderObject createRenderObject(BuildContext context) {
    RenderBox renderBox=ChildWidgetRenderShiftedBox();
    return renderBox;
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    // TODO: implement updateRenderObject
    super.updateRenderObject(context, renderObject);
  }
}

class ChildWidgetRenderShiftedBox extends RenderShiftedBox{
  @override
  void performLayout() {
    BoxConstraints exactlyConstraints = constraints.loosen();
    child.layout(exactlyConstraints, parentUsesSize: true);
    double width = max(constraints.minWidth, child.size.width);
    double height = max(constraints.minHeight, child.size.height);
    size = Size(width, height);
    canvasHeight=height;//
    print('####$height');
//    final BoxParentData childParentData = child.parentData;
//    childParentData.offset = Offset(0, -20);
  }
  ChildWidgetRenderShiftedBox() : super(null);
}
class _ModalTopSheetRoute<T> extends PopupRoute<T> {
  _ModalTopSheetRoute({
    this.builder,
    this.barrierLabel,
  }) ;

  final WidgetBuilder builder;

  @override
  Duration get transitionDuration => _TopSheetDuration;

  @override
  bool get barrierDismissible =>true;

  @override
  final String barrierLabel;

  @override
  Color get barrierColor =>  null;

  AnimationController _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController = XYTopSheet.createAnimationController(navigator.overlay);
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    Widget topSheet =
      _ModalTopSheet<T>(
        route: this,
      );
    return topSheet;
  }
}
Future<T> showModalTopSheet<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
}) {
  return Navigator.of(context).push(_ModalTopSheetRoute<T>(
    builder: builder,
  ));
}


