/*
* CustomAnimatedSwitcherModel created by zhangjiang 
* on 2020/3/26 10:32 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class AnimatedDecorationBoxModel extends StatefulWidget {
  AnimatedDecorationBoxModel({Key? key}):super(key:key);
  
  @override
  _AnimatedDecorationBoxState createState()=> _AnimatedDecorationBoxState();
}

class _AnimatedDecorationBoxState extends State<AnimatedDecorationBoxModel> {

  var _decorationColor = Colors.blue;

  var duration = Duration(seconds: 2);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义过渡动画"),
      ),
      body: CustomAnimatedSwitcherBox(
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            color: _decorationColor,
          ),
          duration: duration,
          child: TextButton(
            child: Text("点击修改颜色",style: TextStyle(color: Colors.white) ),
            onPressed: (){
              _decorationColor = _decorationColor == Colors.red ? Colors.blue : Colors.red;
              setState(() {
              });
            },
          ),
      ),
    );
  }
}




//自定义过渡组件
class CustomAnimatedSwitcherBox extends StatefulWidget {
  CustomAnimatedSwitcherBox({
    Key? key,
    required this.decoration,
    required this.duration,
    this.reverseDuration,
    this.curve = Curves.linear,
    this.child,
  });

  //添加对应的属性
  final Duration duration;
  final Duration? reverseDuration;
  final Curve curve;
  final Widget? child;
  final BoxDecoration decoration;

  @override
  _CustomAnimatedSwitcherBoxState createState() =>
      _CustomAnimatedSwitcherBoxState();
}

class _CustomAnimatedSwitcherBoxState
    extends State<CustomAnimatedSwitcherBox> with SingleTickerProviderStateMixin {

  @protected
  AnimationController get controller => _controller;
  late AnimationController _controller;

  Animation<double> get animation => _animation;
  late Animation<double> _animation;

  late DecorationTween _decorationTween;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(duration: widget.duration,reverseDuration: widget.reverseDuration,vsync: this);

    _decorationTween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  //更对对应的widget
  void _updateCurve(){
    _animation = CurvedAnimation(parent: _controller,curve: widget.curve);
  }

  @override
  void didUpdateWidget(CustomAnimatedSwitcherBox oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("开始执行");
    //检查新旧child是否发生变化(key或类型同时相等则返回true，认为没变化)
    if (Widget.canUpdate(widget.child!, oldWidget.child!)) {
      print("widget发生变化");
      //开始执行动画
      _updateCurve();
      _controller.duration = widget.duration;
      _controller.reverseDuration = widget.reverseDuration;
      //..为级联操作
      if (widget.decoration !=
          (_decorationTween.end ?? _decorationTween.begin)) {
        _decorationTween
          ..begin = _decorationTween.evaluate(_animation)
          ..end = widget.decoration;
        _controller
          ..value = 0
          ..forward();
        print("开始动画");
      }
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (BuildContext context, Widget? child){
        return DecoratedBox(
          decoration: _decorationTween.animate(_animation).value,
          child: child,
        );
      },
    );
  }
}