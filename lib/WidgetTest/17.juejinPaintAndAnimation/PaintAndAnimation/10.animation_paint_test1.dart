/*
* 10.animation_paint_test created by zj 
* on 2020/12/17 4:37 PM
* copyright on zhangjiang
*/

import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPaintTest1 extends StatefulWidget {
  @override
  _AnimationPaintTest1State createState() => _AnimationPaintTest1State();
}

class _AnimationPaintTest1State extends State<AnimationPaintTest1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("吃豆子"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Wrap(
            children: [
              EatBeansPainter(),
              EatBeansPainter(color: Colors.blue,angle: 30,),
              EatBeansPainter(color: Colors.yellow,angle: 35),
              EatBeansPainter(color: Colors.blue,angle: 40,),
              EatBeansPainter(color: Colors.blue,angle: 45,),
              EatBeansPainter(color: Colors.blue,angle: 50,),
              EatBeansPainter(color: Colors.blue,angle: 55,isCustom: true,),
            ],
          ),
        ],
      )
    );
  }
}



class EatBeansPainter extends StatefulWidget {
  EatBeansPainter({Key key,this.color = Colors.blue,this.angle = 30,this.isCustom = false}): super(key: key);

  final bool isCustom;
  final Color color;
  final double angle;
  @override
  _EatBeansPainterState createState() => _EatBeansPainterState();
}

class _EatBeansPainterState extends State<EatBeansPainter> with SingleTickerProviderStateMixin{

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.isCustom) {
      _controller = AnimationController(duration: const Duration(seconds: 1),vsync:this);
      _controller.repeat(reverse: true);
    }else{
      _controller = AnimationController(duration: const Duration(seconds: 1),lowerBound: 20,upperBound: 45,vsync: this)
        ..forward()
        ..repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(100,100),
      painter: widget.isCustom ? MyPainter12(progress: _controller) : MyPainter11(angle: _controller,color: widget.color),
    );
  }
}
class MyPainter11 extends CustomPainter {

  MyPainter11({this.color = Colors.blue,this.angle}):super(repaint: angle);

  final Color color;
  final Animation<double> angle;

  @override
  void paint(Canvas canvas, Size size) {
    //绘制吃豆人
    var width = size.width;
    var height = size.height;
    Paint paint = Paint();
    paint..style = PaintingStyle.fill..color = color;
    canvas.translate(size.width*0.5, size.height*0.5);

    var a = angle.value / 180.0 * pi;
    //绘制圆弧
    canvas.drawArc(Rect.fromCenter(center: Offset.zero,width: width,height: height), a, pi * 2 - a.abs() * 2 , true, paint);
    //绘制眼睛
    canvas.drawCircle(Offset(0, -20), 5, paint..color = Colors.white);

    // canvas.drawRect(Rect.fromCenter(center: ), paint)
  }

  @override
  bool shouldRepaint(covariant MyPainter11 oldDelegate) {
    return oldDelegate.color != this.color || oldDelegate.angle != this.angle;
  }

}

class MyPainter12 extends CustomPainter{

  MyPainter12({@required this.progress}):super(repaint: progress);

  final Animation<double> progress;
  final ColorTween _colorTween = ColorTween(begin: Colors.blue,end: Colors.red);
  final Tween<double> _angleAnim = Tween(begin: 10.0,end: 50.0);
  Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    //绘制吃豆人
    var width = size.width;
    var height = size.height;
    _paint..style = PaintingStyle.fill..color = _colorTween.evaluate(progress);
    canvas.translate(size.width*0.5, size.height*0.5);
    var a = _angleAnim.evaluate(progress) / 360.0 * pi;
    //绘制圆弧
    canvas.drawArc(Rect.fromCenter(center: Offset.zero,width: width,height: height), a, pi * 2 - a.abs() * 2 , true, _paint);
    //绘制眼睛
    canvas.drawCircle(Offset(0, -20), 5, _paint..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant MyPainter12 oldDelegate) {
    return oldDelegate.progress != this.progress;
  }



}

