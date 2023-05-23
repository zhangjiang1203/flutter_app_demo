/*
* 12.curve_animation_widget created by zhangjiang 
* on 2020/12/19 9:41 PM
* copyright on zhangjiang
*/

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CurveAnimationTest extends StatefulWidget {
  @override
  _CurveAnimationTestState createState() => _CurveAnimationTestState();
}

class _CurveAnimationTestState extends State<CurveAnimationTest> {

  static const List<String> curvesStrList = [
    "bounceInOut",
    "bounceIn",
    "bounceOut",
    "decelerate",
    "linear",
    "linearToEaseOut",
    "ease",
    "easeIn",
    "easeInBack",
    "easeInCirc",
    "easeInCubic",
    "easeInExpo",
    "easeInQuad",
    "easeInQuart",
    "easeInQuint",
    "easeInSine",
    "easeInToLinear",
    "easeInOutBack",
    "easeInOutExpo",
    "easeInOutQuad",
    "easeInOutCirc",
    "easeInOutCubic",
    "easeInOutQuint",
    "easeInOutSine",
    "easeInOut",
    "easeOut",
    "easeOutBack",
    "easeOutCirc",
    "easeOutCubic",
    "easeOutQuart",
    "easeOutQuad",
    "easeOutExpo",
    "easeOutQuint",
    "easeOutSine",
    "easeOut",
    "elasticIn",
    "elasticInOut",
    "elasticOut",
    "fastLinearToSlowEaseIn",
    "fastOutSlowIn",
    "linearToEaseOut",
    "slowMiddle",
  ];

  static const List<Curve> curvesList = [
    Curves.bounceInOut,
    Curves.bounceIn,
    Curves.bounceOut,
    Curves.decelerate,
    Curves.linear,
    Curves.linearToEaseOut,
    Curves.ease,
    Curves.easeIn,
    Curves.easeInBack,
    Curves.easeInCirc,
    Curves.easeInCubic,
    Curves.easeInExpo,
    Curves.easeInQuad,
    Curves.easeInQuart,
    Curves.easeInQuint,
    Curves.easeInSine,
    Curves.easeInToLinear,
    Curves.easeInOutBack,
    Curves.easeInOutExpo,
    Curves.easeInOutQuad,
    Curves.easeInOutCirc,
    Curves.easeInOutCubic,
    Curves.easeInOutQuint,
    Curves.easeInOutSine,
    Curves.easeInOut,
    Curves.easeOut,
    Curves.easeOutBack,
    Curves.easeOutCirc,
    Curves.easeOutCubic,
    Curves.easeOutQuart,
    Curves.easeOutQuad,
    Curves.easeOutExpo,
    Curves.easeOutQuint,
    Curves.easeOutSine,
    Curves.easeOut,
    Curves.elasticIn,
    Curves.elasticInOut,
    Curves.elasticOut,
    Curves.fastLinearToSlowEaseIn,
    Curves.fastOutSlowIn,
    Curves.linearToEaseOut,
    Curves.slowMiddle,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("曲线动画设置"),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:Padding(
              padding: const EdgeInsets.all(3),
              child: Wrap(
                runSpacing: 5,
                spacing: 5,
                children: curvesList.asMap().keys.map((e) => Column(
                  children: [
                    CustomCurveAnimation(curveType: curvesList[e]),
                    SizedBox(height: 5,),
                    Text(curvesStrList[e],textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 12),),
                  ],
                ),).toList(),
              ),
          ),
        ),
      ),
    );
  }
}

class CustomCurveAnimation extends StatefulWidget {

  CustomCurveAnimation({Key? key,this.curveType = Curves.bounceInOut}):super(key: key);

  final Curve curveType;

  @override
  _CustomCurveAnimationState createState() => _CustomCurveAnimationState();
}

class _CustomCurveAnimationState extends State<CustomCurveAnimation> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _angleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 3),vsync:this);
    _angleAnim = CurveTween(curve: widget.curveType).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: CustomPaint(
        size: Size(100,100),
        painter: MyPainter14(progress: _angleAnim,repaint: _controller),
      ),
    );
  }
}

class MyPainter14 extends CustomPainter {

  MyPainter14({required this.repaint,required this.progress}):super(repaint: repaint);

  Paint _paint = Paint();
  final Animation<double> repaint;
  final Animation<double> progress;
  static const double circleW = 10;
  double radius = 0;

  @override
  void paint(Canvas canvas, Size size) {
    //获取当前的圆的半径
    radius = min(size.width, size.height)*0.5;
    //绘制圆 红点和蓝点
    //区域裁剪
    canvas.clipRect(Offset.zero&size);
    canvas.translate(size.width*0.5, size.height*0.5);
    _paint..color = Colors.blue..style = PaintingStyle.stroke..strokeWidth = circleW;
    //绘制圆
    canvas.drawCircle(Offset(0, 0),  radius-circleW*0.5, _paint);
    // _drawDescText(canvas, curveStr);

    _drawRedBall(canvas,size);
    _drawGreenBall(canvas,size);
  }

  void _drawRedBall(Canvas canvas,Size size){
    canvas.save();
    canvas.rotate(progress.value*pi*2);
    _paint..strokeCap = StrokeCap.round;
    canvas.drawCircle(Offset(0, -radius+circleW*0.5), circleW*0.5, _paint..color = Colors.red..style = PaintingStyle.fill);
    canvas.restore();
  }

  void _drawGreenBall(Canvas canvas,Size size){
    canvas.save();
    canvas.translate(0, progress.value * (radius*2-circleW));
    _paint..color = Colors.green..strokeCap = StrokeCap.round;
    canvas.drawCircle(Offset(0, -radius+circleW*0.5), circleW*0.5, _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant MyPainter14 oldDelegate) {
    return oldDelegate.repaint != repaint;
  }
}