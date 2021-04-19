/*
* CustomCircleProgressModel created by zj 
* on 2020/4/13 2:07 PM
* copyright on zhangjiang
*/

import 'dart:math';

import 'package:flutter/material.dart';

class CustomCircleProgressModel extends StatefulWidget {
  CustomCircleProgressModel({Key key}) : super(key: key);

  @override
  _CustomCircleProgressModel createState() => _CustomCircleProgressModel();
}

class _CustomCircleProgressModel extends State<CustomCircleProgressModel> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller,curve: Curves.easeIn);
    animation = Tween(begin: 0.0,end: 0.8).animate(animation);
    bool _isForward = false;
    //动画状态监听
    controller.addStatusListener((status){
      switch(status){
        case AnimationStatus.completed:
        case AnimationStatus.dismissed:
          {
            if (_isForward){
              controller.reverse();
            }else{
              controller.forward();
            }
          }
          break;
        case AnimationStatus.forward:
          // TODO: Handle this case.
          _isForward = true;
          break;
        case AnimationStatus.reverse:
          _isForward = false;
          break;
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CustomCircleProgressModel"),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation: controller,
            builder: (content, child){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Wrap(
                      spacing: 10,
                      runSpacing: 16,
                      children: <Widget>[
                        GradientCircularProgress(
                          radius: 50,
                          strokeWidth: 3,
                          colors: [Colors.lightBlue,Colors.lightGreen,Colors.amber],
                          value: animation.value,
                        ),
                        GradientCircularProgress(
                          radius: 50,
                          strokeWidth: 2,
                          colors: [Colors.black,Colors.yellow,Colors.blueGrey],
                          value: animation.value,
                        ),
                        GradientCircularProgress(
                          radius: 50,
                          strokeWidth: 3,
                          colors: [Colors.cyan,Colors.blueAccent,Colors.pink],
                          value: animation.value,
                        ),
                        GradientCircularProgress(
                          strokeCapRound: true,
                          radius: 50,
                          strokeWidth: 3,
                          colors: [Colors.lightBlue,Colors.lightGreen,Colors.amber],
                          value: animation.value,
                        ),
                      ],
                    ),
                    GradientCircularProgress(
                      strokeCapRound: true,
                      strokeWidth: 3.0,
                      radius: 30.0,
                      value: animation.value,
                      colors: [Colors.red,Colors.blue,Colors.deepOrange],
                      //这是颜色渐变的终止点，与colors对应
                      stops: [0.4,0.6,1.0],
                    ),
                  ],
                ),
              );
            },
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class GradientCircularProgress extends StatelessWidget {
  GradientCircularProgress({
    this.strokeWidth = 2.0,
    @required this.radius,
    this.strokeCapRound = false,
    this.value,
    this.backgroundColor = const Color(0xffeeeeee),
    this.totalAngle = 2 * pi,
    @required this.colors,
    this.stops,
});

  final double strokeWidth;//粗细
  final double radius;
  final bool strokeCapRound;//是否为两端圆角
  final double value;//当前进度【0，1】
  final Color backgroundColor;//进度条背景色
  final double totalAngle;//进度条总弧度
  final List<Color> colors;
  final List<double> stops;//渐变色的终止点


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double _offset = 0.0;
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (_colors == null){
      Color color = Theme.of(context).accentColor;
      _colors = [color , color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        painter: GradientCircularPainter(
            stokeWidth: strokeWidth,
            radius: radius,
            strokeCapRound: strokeCapRound,
            value: value,
            backgroundColor: backgroundColor,
            totalAngle: totalAngle,
            colors: colors,
            stops: stops),
        size: Size.fromRadius(radius),
      ),
    );
  }
}

class GradientCircularPainter extends CustomPainter {

  GradientCircularPainter({
    this.stokeWidth = 2.0,
    @required this.radius,
    this.strokeCapRound = false,
    this.value,
    this.backgroundColor = const Color(0xffeeeeee),
    this.totalAngle = 2 * pi,
    @required this.colors,
    this.stops,
});

  final double stokeWidth;//粗细
  final double radius;
  final bool strokeCapRound;//是否为两端圆角
  final double value;//当前进度【0，1】
  final Color backgroundColor;//进度条背景色
  final double totalAngle;//进度条总弧度
  final List<Color> colors;
  final List<double> stops;//渐变色的终止点

   @override
  void paint(Canvas canvas, Size size) {
     if(radius != null){
       size = Size.fromRadius(radius);
     }

     double _offset = stokeWidth / 2.0;
     double _value = (value ?? 0);
     _value = _value.clamp(0.0, 1.0) * totalAngle;
     double _start = 0;

     if (strokeCapRound) {
       _start = asin(stokeWidth / (size.width - stokeWidth));
     }

     Rect rect = Offset(_offset,_offset) & Size(size.width - stokeWidth,size.height - stokeWidth);
     var paint = Paint()
         ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
         ..style = PaintingStyle.stroke
         ..strokeWidth = stokeWidth;
     //开始绘制背景
     if(backgroundColor != Colors.transparent) {
       paint.color = backgroundColor;
       canvas.drawArc(rect, _start, totalAngle, false, paint);
     }

     //绘制前景色，设置渐变
     if (_value > 0) {
       paint.shader = SweepGradient(
         startAngle: 0.0,
         endAngle: _value,
         colors: colors,
         stops: stops,
       ).createShader(rect);
       canvas.drawArc(rect, _start, _value, false, paint);
     }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
