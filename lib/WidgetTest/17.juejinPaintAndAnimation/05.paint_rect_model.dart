/*
* 05.paint_rect_model created by zj 
* on 2020/12/14 11:52 AM
* copyright on zhangjiang
*/

import 'dart:math';
import 'dart:ui' as ui show Gradient, Shader, TextBox, PlaceholderAlignment, TextHeightBehavior,ClipOp;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/04.paint_point_model.dart';

class PaintRectModel extends StatefulWidget {
  @override
  _PaintRectModelState createState() => _PaintRectModelState();
}

class _PaintRectModelState extends State<PaintRectModel> {

  @override
  void initState() {
    super.initState();
    //设置横屏和全屏
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: MyPainter5(),
        foregroundPainter: MyPainter6(),
      ),
    );
  }
}

class MyPainter6 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    //平移画布起点到屏幕中心
    canvas.translate(width*0.5, height*0.5);
    // _drawRectWithFiveRect(canvas, size);
    // _drawRRectWithFiveRect(canvas, size);

    // _drawRRRectWithRect(canvas, size);

    // _drawCircle(canvas,size);
    // _drawColor(canvas,size);
    // _drawPaint(canvas,size);
    // _drawShader(canvas, size);
    // _drawPath(canvas,size);
    _drawClipRect(canvas, size);
  }

  void _drawRectWithFiveRect(Canvas canvas,Size size){
    //开始绘制矩形
    Paint paint = Paint();
    var rect1 = Rect.fromLTWH(-140, -140, 40, 40);
    paint..color = Colors.red;
    canvas.drawRect(rect1, paint);

    //通过center点和宽高构造
    var rect2 = Rect.fromCenter(center: Offset(0,0),width: 200,height: 200);
    paint..color = Colors.blue;
    canvas.drawRect(rect2, paint);

    // 通过内切圆矩形构造
    var rect3 = Rect.fromCircle(center: Offset(120,-120),radius: 20);
    paint..color = Colors.green;
    canvas.drawRect(rect3, paint);

    //左上右下
    var rect4 = Rect.fromLTRB(-100, 100, -140, 140);
    paint..color = Colors.yellow;
    canvas.drawRect(rect4, paint);

    //两点构造
    var rect5 = Rect.fromPoints(Offset(100,100), Offset(140,140));
    paint..color = Colors.teal;
    canvas.drawRect(rect5, paint);
  }

  void _drawRRectWithFiveRect(Canvas canvas,Size size){
    //开始绘制矩形
    Paint paint = Paint();
    var rect1 = RRect.fromLTRBAndCorners(-140, -140, -100, -100,topLeft: Radius.circular(5),bottomRight: Radius.circular(10));
    paint..color = Colors.red;
    canvas.drawRRect(rect1, paint);

    //通过center点和宽高构造
    // var rect2 = Rect.fromCenter(center: Offset(0,0),width: 200,height: 200);
    var rect2 = RRect.fromLTRBXY(-100, -100, 100, 100, 10, 5);
    paint..color = Colors.blue;
    canvas.drawRRect(rect2, paint);

    // 通过内切圆矩形构造
    var rect0 = Rect.fromCircle(center: Offset(120,-120),radius: 20);
    var rect3 = RRect.fromRectAndCorners(rect0,topRight: Radius.circular(10));
    paint..color = Colors.green;
    canvas.drawRRect(rect3, paint);

    //左上右下
    // var rect4 = Rect.fromLTRB(-100, 100, -140, 140);
    var rect4 = RRect.fromLTRBR(-100, 100, -140, 140 , Radius.circular(10));
    paint..color = Colors.yellow;
    canvas.drawRRect(rect4, paint);
    
    //两点构造
    var rect5 = Rect.fromPoints(Offset(100,100), Offset(140,140));
    var rect6 = RRect.fromRectXY(rect5, 5, 10);
    paint..color = Colors.teal;
    canvas.drawRRect(rect6, paint);
  }

  /// 绘制两个差值矩形
  void _drawRRRectWithRect(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..color = Colors.blue..strokeWidth = 1.5;
    //内径必须要小于外径
    var rect1 = Rect.fromCenter(center: Offset(0,0),width: 120,height: 120);
    var rect2 = Rect.fromCenter(center: Offset(0,0),width: 80,height: 80);
    
    canvas.drawDRRect(RRect.fromRectXY(rect1,10,10), RRect.fromRectXY(rect2,10,10), paint);

    var rect3 = Rect.fromCenter(center: Offset(0,0),width: 200,height: 200);
    var rect4 = Rect.fromCenter(center: Offset(0,0),width: 160,height: 160);

    canvas.drawDRRect(RRect.fromRectXY(rect3,10,10), RRect.fromRectXY(rect4,10,10), paint..color = Colors.red);
    
  }

  void _drawCircle(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..color = Colors.blueAccent..strokeWidth = 2;
    canvas.drawCircle(Offset(-300, 0), 100, paint);

    canvas.drawOval(Rect.fromCenter(center: Offset(0,0),width: 200,height: 150), paint);

    canvas.drawArc(Rect.fromLTWH(150, -75, 200, 150), pi/6, pi/6*10 , true, paint);
    
    //绘制对应的两个点
    paint..style = PaintingStyle.stroke..color = Colors.yellow..strokeWidth = 20..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.points, [Offset(300, 0),Offset(350, 0)], paint);
  }

  void _drawColor(Canvas canvas,Size size){
    canvas.drawColor(Colors.red, BlendMode.lighten);
  }

  void _drawPaint(Canvas canvas,Size size){

    final List<Color> colors = [
      Color(0xFFF60C0C),
      Color(0xFFF3B913),
      Color(0xFFE7F716),
      Color(0xFF3DF30B),
      Color(0xFF0DF6EF),
      Color(0xFF0829FB),
      Color(0xFFB709F4),
    ];
    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];

    Paint paint = Paint();
    paint..shader = ui.Gradient.linear(Offset(-size.width,-size.height), Offset(size.width,size.height), colors,pos);// LinearGradient(begin: Alignment(-1,-1),end: Alignment(1,1),colors: colors);
    paint.blendMode = BlendMode.lighten;
    canvas.drawPaint(paint);
  }
  
  void _drawShader(Canvas canvas,Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(-50, 50);
    path.lineTo(50, 50);
    path.close();
    canvas.drawShadow(path, Colors.blue, 3 , true);
    canvas.translate(100, 0);
    //最后一个参数控制实心还是空心
    canvas.drawShadow(path, Colors.blue, 3, false);
  }

  void _drawPath(Canvas canvas,Size size){
    Paint paint = Paint();
    paint.color = Colors.red;
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(-30, 30);
    path.lineTo(30, 30);
    path.lineTo(-30, -30);
    path.lineTo(30, -30);
    path.close();
    canvas.drawPath(path, paint);

    canvas.translate(100, 0);
    canvas.drawPath(path, paint..style = PaintingStyle.stroke);
  }

  void _drawClipRect(Canvas canvas,Size size){
    var rect = Rect.fromCenter(center: Offset(0,0),width: 200,height: 200);
    canvas.clipRect(rect,doAntiAlias: true,clipOp: ui.ClipOp.intersect);

    //再去绘制颜色，只在裁剪过后的区域进行绘制
    _drawPaint(canvas, size);

    //再次裁剪
    // canvas.clipRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(0,-60),width: 100,height: 50), Radius.circular(10)));
    // canvas.drawColor(Colors.red, BlendMode.darken);

    Paint paint = Paint();
    paint..color = Colors.blue..style = PaintingStyle.stroke..strokeWidth = 2;
    //裁剪路径
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(-40, 40);
    path.lineTo(40, 40);
    path.close();
    canvas.clipPath(path);
    canvas.drawColor(Colors.blue, BlendMode.darken);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}
