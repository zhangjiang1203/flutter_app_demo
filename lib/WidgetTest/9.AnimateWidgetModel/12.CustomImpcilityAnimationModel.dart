/*
* CustomImpcilityAnimationModel created by zhangjiang 
* on 2020/3/29 10:32 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class CustomImpcilityAnimationModel extends StatefulWidget {
  CustomImpcilityAnimationModel({Key? key}) : super(key: key);

  @override
  _CustomImpcilityAnimationModelState createState() =>
      _CustomImpcilityAnimationModelState();
}

class _CustomImpcilityAnimationModelState
    extends State<CustomImpcilityAnimationModel> {


  var _decorationColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CustomImpcilityAnimationModel"),
        ),
        body: Center(
          child: ShowAnimationDecorationBox(
              child: TextButton(
                child: Text('那么来一次啊'),
                onPressed: (){
                  setState(() {
                    _decorationColor = _decorationColor == Colors.red ? Colors.blue : Colors.red;
                  });
                },
              ),
              decoration: BoxDecoration(
                color: _decorationColor,
              ),
              duration: const Duration(seconds: 3)),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


//自定义decorationBox
class ShowAnimationDecorationBox extends ImplicitlyAnimatedWidget {

  ShowAnimationDecorationBox({
    Key? key,
    required this.decoration,
    required this.child,
    Curve curve = Curves.linear,
    required Duration duration,
    Duration? reverseDuration,
  }):super(key:key,duration:duration,curve:curve);

  final Widget child;
  final BoxDecoration decoration;

  @override
  _ShowAnimationDecorationState createState() => new _ShowAnimationDecorationState();

}

class _ShowAnimationDecorationState extends AnimatedWidgetBaseState<ShowAnimationDecorationBox> {

  //定义一个decoration
  late DecorationTween _decorationTween ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
      decoration: _decorationTween.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    //每一帧都会重新刷新
    _decorationTween = visitor(_decorationTween,widget.decoration,(value)=> DecorationTween(begin: value)) as DecorationTween;
  }
}