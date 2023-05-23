/*
* 04.paint_point_model created by zj 
* on 2020/12/11 5:40 PM
* copyright on zhangjiang
*/

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '03.canvas_action_model.dart';


class PaintPointModel extends StatefulWidget {
  @override
  _PaintPointModelState createState() => _PaintPointModelState();
}

class _PaintPointModelState extends State<PaintPointModel> {

  late Timer _timer;
  double offsetX = 0;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    _timer = Timer.periodic(const Duration(milliseconds: 120), (timer) {
      setState(() {
        offsetX += 0.2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: MyPainter5(),
        foregroundPainter: MyPainter4(progress: offsetX),
      ),
    );
  }
}

class MyPainter4 extends CustomPainter {

  MyPainter4({this.progress = 0});

  final double progress;

  //设置点
  final List<Offset> points = [
    Offset(-120, -20),
    Offset(-80, -80),
    Offset(-40, -40),
    Offset(0, -100),
    Offset(40, -140),
    Offset(80, -160),
    Offset(120, -100),
    Offset(0, 0),
  ];

  final double arrowLine = 10;

  @override
  void paint(Canvas canvas, Size size) {
    //绘制点
    canvas.translate(size.width*0.5, size.height*0.5);
    canvas.save();
    // _drawPointsAndLines(canvas, size);
    canvas.restore();

    _drawSinCircle(canvas, size);
    _drawSinPoint(canvas,size);

  }

  void _drawPointsAndLines(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..color = Colors.red..strokeWidth = 10..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.points , points, paint);
    //
    // //使用这个模式 每两个点组成企点和终点
    // canvas.drawPoints(PointMode.lines , points, paint);

    //所有的点生成一个多边形连线，
    paint..strokeWidth = 1;
    canvas.drawPoints(PointMode.polygon , points, paint);
  }

  void _drawSinCircle(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..color = Colors.red..strokeWidth = 1;
    double width = size.width;
    final A = 80;
    List<Offset> cosPoints = [];
    for (double i = -width*0.5; i < width*0.5;i++){
      var dy = A * cos(2*i*pi/360+progress);
      cosPoints.add(Offset(i.toDouble(), dy));
    }
    canvas.drawPoints(PointMode.polygon, cosPoints, paint);

    // paint..color = Colors.blue;
    // List<Offset> sinPoints = [];
    // for (double i = -width*0.5; i < width*0.5;i++){
    //   var dy = A * sin(2*i*pi/360+progress);
    //   sinPoints.add(Offset(i.toDouble(), dy));
    // }
    // canvas.drawPoints(PointMode.polygon, sinPoints, paint);

  }

  void _drawSinPoint(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..color = Colors.red..strokeWidth = 10..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;
    final A = 80;
    var dy1 = A * cos(4.5*pi/360+progress);
    canvas.drawPoints(PointMode.points, [Offset(0, dy1)], paint);
    var dy2 = A * sin(4.5*pi/360+progress);
    canvas.drawPoints(PointMode.points, [Offset(270, dy2)], paint);
    var dy3 = A * sin(4.5*pi/360-progress);
    canvas.drawPoints(PointMode.points, [Offset(-270, dy3)], paint);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}

class MyPainter5 extends CustomPainter{

  final double arrowLine = 10;
  @override
  void paint(Canvas canvas, Size size) {
    /*注意: 画布变换之后，如果不做处理，之后所有的操作都会在变化后画布的基础上进行。
    当使用 canvas.save() 时，当前画布的状态就会被保存，当执行 canvas.restore() 时，画布就会回到上次保存的状态。
    比如：在上面画横线前save画布这时画布的[顶点在屏幕中心]，画横线的过程中画布的顶点被[下移到了最后]。
    画完后restore画布，就能让画布顶点重新回到[屏幕中心]。
    */
    //绘制网格,移动画布起点到屏幕中心
    double width = size.width;
    double height = size.height;

    canvas.translate(width*0.5, height*0.5);
    _drawGridView(canvas, size);

    /*现在已经画完四分之一了，也许你正想傻傻再画出其他三个。有更巧妙的方法：
    如果是相同或者对称的对象，可以通过缩放进行对称变化。
    沿x轴镜像，就相当于canvas.scale(1, -1)；
    沿y轴镜像，就相当于canvas.scale(-1, 1)；
    沿原点镜像，就相当于canvas.scale(-1, -1)；
    */

    //对画布进行变换
    canvas.save();
    canvas.scale(1,-1);
    _drawGridView(canvas, size);
    canvas.restore();

    //对画布进行变换
    canvas.save();
    canvas.scale(-1,1);
    _drawGridView(canvas, size);
    canvas.restore();

    //对画布进行变换
    canvas.save();
    canvas.scale(-1,-1);
    _drawGridView(canvas, size);
    canvas.restore();


    _drawGridLines(canvas, size);
    // _drawLittleBot(canvas, size);
  }

  void _drawGridView(Canvas canvas,Size size){
    double width = size.width;
    double height = size.height;
    //绘制网格
    canvas.save();
    Paint paint = Paint();
    paint..color = Colors.grey;
    const double step = 20;
    for(int i = 0; i < width * 0.5 ; i++){
      canvas.drawLine(Offset.zero, Offset(0,height*0.5), paint);
      canvas.translate(step, 0);
    }
    canvas.restore();

    canvas.save();
    for(int i = 0; i < height * 0.5 ; i++){
      canvas.drawLine(Offset.zero, Offset(width*0.5,0), paint);
      canvas.translate(0, step);
    }
    canvas.restore();

  }

  void _drawLittleBot(Canvas canvas,Size size){
    //如下，通过旋转画布可以画出一圈的小线，不过不要画布旋转，而是计算点位，那就会相当痛苦。
    int count = 18;
    Paint paint = Paint()..color = Colors.orangeAccent..strokeWidth = 5..strokeCap = StrokeCap.round;
    double step = 2 * pi / count;
    canvas.save();
    for (int i = 0;i < count;i++) {
      // canvas.drawLine(Offset(150,-0), Offset(120, 0), paint);
      canvas.drawLine(Offset(0,150), Offset(0,120), paint);
      canvas.rotate(step);
    }
    canvas.restore();
  }

  void _drawGridLines(Canvas canvas,Size size){
    var width = size.width * 0.5;
    var height = size.height * 0.5;
    Paint paint = Paint();
    paint..color = Colors.blue..strokeWidth = 2;

    //绘制线
    canvas.drawLine(Offset(-width, 0), Offset(width, 0), paint);
    //绘制箭头
    canvas.drawLine(Offset(width-arrowLine-30,-arrowLine), Offset(width-30, 0), paint);
    canvas.drawLine(Offset(width-arrowLine-30,arrowLine), Offset(width-30, 0), paint);


    //绘制线
    canvas.drawLine(Offset(0, -height), Offset(0, height), paint);
    //绘制箭头
    canvas.drawLine(Offset(-arrowLine, height-arrowLine), Offset(0, height), paint);
    canvas.drawLine(Offset(arrowLine, height-arrowLine), Offset(0, height), paint);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}
