/*
* 11.custom_tween_animation created by zhangjiang 
* on 2020/12/19 3:32 PM
* copyright on zhangjiang
*/

import 'dart:math';

import 'package:flutter/material.dart';

class CustomTweenAnimationWidget extends StatefulWidget {
  @override
  _CustomTweenAnimationWidgetState createState() => _CustomTweenAnimationWidgetState();
}

class _CustomTweenAnimationWidgetState extends State<CustomTweenAnimationWidget> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1),vsync:this);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义Tween动画'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Wrap(
          // runSpacing: 5,
          spacing: 2,
          children: List.generate(18, (index) => CustomPaint(
            size: Size(100,100),
            painter: MyPainter13(_controller),
          ))
        ),
      )
    );
  }
}

//展示层



class MyPainter13 extends CustomPainter{
  MyPainter13(this.progress):super(repaint: progress);

  final Animation<double> progress;
  // final ColorTween _colorTween = ColorTween(begin: Colors.blue,end: Colors.red);
  // final Tween<double> _angleAnim = Tween(begin: 10.0,end: 50.0);
  final ColorDoubleTween colorDoubleTween = ColorDoubleTween(begin:ColorDouble(color: Colors.blue,value: 10),end:ColorDouble(color: Colors.red,value: 45));
  Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    //绘制吃豆人
    var width = size.width;
    var height = size.height;
    _paint..style = PaintingStyle.fill..color = colorDoubleTween.evaluate(progress).color;
    canvas.translate(size.width*0.5, size.height*0.5);
    var a = colorDoubleTween.evaluate(progress).value / 360.0 * pi;
    //绘制圆弧
    canvas.drawArc(Rect.fromCenter(center: Offset.zero,width: width,height: height), a, pi * 2 - a.abs() * 2 , true, _paint);
    //绘制眼睛
    canvas.drawCircle(Offset(0, -20), 5, _paint..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant MyPainter13 oldDelegate) {
    return oldDelegate.progress != this.progress;
  }
}


//定义一个动画变换的对象
class ColorDouble {
  final Color color;
  final double value;

  ColorDouble({this.color = Colors.blue, this.value = 0});
}

/*
只对于 Tween 主要就是实现在 t 变化的过程中应该根据 t 变成什么新值。这里写一个ColorDoubleTween 示意一下自定义流程。
这个 Tween 负责颜色和 double 类型 同时变化的渐变。 首先要有一个基本结构 ColorDouble 来定义需要变化的类型，
然后继承自 Tween<ColorDouble> 之后重写lerp 方法，根据 t 生成新对象即可
* */
//自定义tween
class ColorDoubleTween extends Tween<ColorDouble> {

  ColorDoubleTween({ColorDouble begin,ColorDouble end}):super(begin: begin,end:end);

  @override
  ColorDouble lerp(double t) {
    // TODO: implement lerp
    return ColorDouble(color: Color.lerp(begin.color, end.color, t),value: begin.value + (end.value - begin.value) *t);
  }

}

