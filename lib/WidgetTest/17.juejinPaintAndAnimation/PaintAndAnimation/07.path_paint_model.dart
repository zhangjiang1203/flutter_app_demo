/*
* 07.path_paint_model created by zj 
* on 2020/12/15 4:36 PM
* copyright on zhangjiang
*/

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '06.paint_image_text_model.dart';

class PathPaintTest extends StatefulWidget {
  @override
  _PathPaintTestState createState() => _PathPaintTestState();
}

class _PathPaintTestState extends State<PathPaintTest> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);

    _controller = AnimationController(duration: const Duration(seconds: 3),vsync: this);
    _controller..forward()..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: MyPainter8(),
        foregroundPainter: MyPainter9(process: _controller),
      ),
    );
  }
}

class MyPainter9 extends CustomPainter {
  MyPainter9({this.process}):super(repaint: process);

  final Animation<double> process;


  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width/2, size.height/2);
    // _pathLine(canvas, size);
    // _pathRelativeLine(canvas, size);
    // _drawArc(canvas,size);
    // _drawArcPoint(canvas,size);
    // _drawConic(canvas, size);
    // _drawBezier(canvas,size);
    // _drawRelativeBezier(canvas,size);
    // _drawCubicBezier(canvas,size);
    // _drawPolygonRect(canvas,size);
    // _drawPathWithAPI(canvas,size);
    // _drawPathWithCombine(canvas, size);
    _drawComputerMetrics(canvas, size);
  }

  void _pathLine(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..color = Colors.red..style = PaintingStyle.fill;
    //绘制path
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(60, 80);
    path.lineTo(60, 0);
    path.lineTo(0, -80);
    path.close();
    canvas.drawPath(path, paint);

    paint..style = PaintingStyle.stroke..strokeWidth = 2..color = Colors.blue;
    //去除之前的路径信息
    path.reset();
    path.moveTo(0, 0);
    path.lineTo(-60, 80);
    path.lineTo(-60, 0);
    path.lineTo(0, -80);
    path.close();
    canvas.drawPath(path, paint);
  }

  void _pathRelativeLine(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..color = Colors.red..style = PaintingStyle.fill;

    Path path = Path();
    path.relativeMoveTo(0, 0);
    path.relativeLineTo(100, 140);
    path.relativeLineTo(-10, -60);
    path.relativeLineTo(60 , 10);
    path.close();
    canvas.drawPath(path, paint);

    paint..color = Colors.red..style = PaintingStyle.stroke..strokeWidth = 2;

    path.reset();// = Path();
    path.relativeMoveTo(-200, 0);
    path.relativeLineTo(100, 140);
    path.relativeLineTo(-10, -60);
    path.relativeLineTo(60 , 10);
    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawArc(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..style = PaintingStyle.stroke..strokeWidth = 2..color = Colors.blue;
    var rect = Rect.fromCenter(center: Offset(0,0),width: 160,height: 100);
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(30, 30);
    path.arcTo(rect, 0 , pi/2*3, false);
    canvas.drawPath(path, paint);

    //
    canvas.translate(200, 0);
    path.reset();
    path.moveTo(0, 0);
    path.lineTo(30, 30);
    path.arcTo(rect, 0 , pi/2*3, true);
    canvas.drawPath(path, paint);
  }

  void _drawArcPoint(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..color = Colors.red..style = PaintingStyle.stroke..strokeWidth = 2;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(80, -40);
    /*
    接受一个点位入参 Offset，是圆弧的终点，可指定圆弧半径radius、是否使用优弧、是否顺时针
    左侧: 使用优弧: largeArc: true ,逆时针:clockwise: false
    中间: 使用劣弧: largeArc: false ,顺时针:clockwise: true
    右侧: 使用优弧: largeArc: true ,顺时针:clockwise: true
    * */
    path.arcToPoint(Offset(40 , 40),radius: Radius.circular(30),largeArc: true,clockwise: false);
    path.close();
    canvas.drawPath(path, paint);


    canvas.translate(100, 0);
    path.reset();
    path.moveTo(0, 0);
    path.lineTo(80, -40);
    /*
    接受一个点位入参 Offset，是圆弧的终点，可指定圆弧半径radius、是否使用优弧、是否顺时针
    左侧: 使用优弧: largeArc: true ,逆时针:clockwise: false
    中间: 使用劣弧: largeArc: false ,顺时针:clockwise: true
    右侧: 使用优弧: largeArc: true ,顺时针:clockwise: true
    * */
    path.arcToPoint(Offset(40 , 40),radius: Radius.circular(30),largeArc: true,clockwise: true);
    path.close();
    canvas.drawPath(path, paint);

    canvas.translate(-200, 0);
    path.reset();
    path.moveTo(0, 0);
    path.lineTo(80, 40);
    /*
    接受一个点位入参 Offset，是圆弧的终点，可指定圆弧半径radius、是否使用优弧、是否顺时针
    左侧: 使用优弧: largeArc: true ,逆时针:clockwise: false
    中间: 使用劣弧: largeArc: false ,顺时针:clockwise: true
    右侧: 使用优弧: largeArc: true ,顺时针:clockwise: true
    * */
    path.arcToPoint(Offset(40 , 40),radius: Radius.circular(30),largeArc: false,clockwise: false);
    path.close();
    canvas.drawPath(path, paint);

    canvas.translate(-100, 0);
    path.reset();
    path.moveTo(0, 0);
    path.lineTo(80, 40);
    /*
    接受一个点位入参 Offset，是圆弧的终点，可指定圆弧半径radius、是否使用优弧、是否顺时针
    左侧: 使用优弧: largeArc: true ,逆时针:clockwise: false
    中间: 使用劣弧: largeArc: false ,顺时针:clockwise: true
    右侧: 使用优弧: largeArc: true ,顺时针:clockwise: true
    * */
    path.arcToPoint(Offset(40 , 40),radius: Radius.circular(30),largeArc: false,clockwise: true);
    path.close();
    canvas.drawPath(path, paint);



  }

  void _drawConic(Canvas canvas,Size size){
    /*
    当权重< 1 时，圆锥曲线是椭圆线,如下左图
    当权重= 1 时，圆锥曲线是抛物线,如下中图
    当权重> 1 时，圆锥曲线是双曲线,如下右图
    * */
    final Offset p1 = Offset(0, -100);
    final Offset p2 = Offset(160, 0);
    Paint paint = Paint();
    paint..color = Colors.red..style = PaintingStyle.stroke..strokeWidth = 10..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.points, [p1,p2], paint);

    paint..strokeWidth = 2;
    Path path = Path();
    // path.moveTo(0, 0);
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1);
    canvas.drawPath(path, paint);


    path.reset();
    canvas.translate(200, 0);
    paint..color = Colors.red..style = PaintingStyle.stroke..strokeWidth = 10..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.points, [p1,p2], paint);
    paint..strokeWidth = 2;
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1.5);
    canvas.drawPath(path, paint);

    path.reset();
    canvas.translate(-400, 0);
    paint..color = Colors.red..style = PaintingStyle.stroke..strokeWidth = 10..strokeCap = StrokeCap.round;
    //绘制连个点
    canvas.drawPoints(PointMode.points, [p1,p2], paint);
    paint..strokeWidth = 2;
    //绘制对应的圆锥曲线
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 0.5);
    canvas.drawPath(path, paint);
  }

  void _drawBezier(Canvas canvas,Size size){

    Paint paint = Paint();
    paint..color = Colors.blue..style = PaintingStyle.stroke..strokeWidth = 2;

    var p1 = Offset(-100, -150);
    var p2 = Offset(100, -50);
    var p3 = Offset(100, 0);
    var p4 = Offset(300, 50);

    Path path = Path();
    // path.moveTo(-120, -100);
    path.quadraticBezierTo(p1.dx, p1.dy, p3.dx, p3.dy);
    // path.moveTo(p3.dx, p3.dy);
    canvas.drawPath(path, paint);
    path.reset();
    path.moveTo(p3.dx, p3.dy);
    path.quadraticBezierTo(p2.dx, p2.dy, p4.dx, p4.dy);
    canvas.drawPath(path, paint);

    path.reset();
    path.lineTo(p1.dx, p1.dy);
    path.lineTo(p3.dx, p3.dy);
    paint..strokeWidth = 1..color = Colors.green;
    canvas.drawPath(path, paint);

    paint..strokeCap = StrokeCap.round..strokeWidth = 10;
    canvas.drawPoints(PointMode.points, [p1], paint);


    path.reset();
    path.moveTo(p3.dx, p3.dy);
    path.lineTo(p2.dx, p2.dy);
    path.lineTo(p4.dx, p4.dy);
    paint..strokeWidth = 1..color = Colors.green;
    canvas.drawPath(path, paint);

    paint..strokeCap = StrokeCap.round..strokeWidth = 10;
    canvas.drawPoints(PointMode.points, [p2], paint);

    //绘制对应的文字
    TextPainter painter1 = TextPainter(
        text: TextSpan(text:"控制点",style: TextStyle(fontSize: 10,color: Colors.red)),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    painter1.layout();
    Size size1 = painter1.size;
    painter1.paint(canvas, Offset(p1.dx-size1.width/2, p1.dy-size1.height-5));

    //绘制对应的文字
    TextPainter painter2 = TextPainter(
      text: TextSpan(text:"控制点",style: TextStyle(fontSize: 10,color: Colors.red)),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    painter2.layout();
    Size size2 = painter2.size;
    painter2.paint(canvas, Offset(p2.dx-size2.width/2, p2.dy-size2.height-5));

  }

  void _drawRelativeBezier(Canvas canvas,Size size){

    var p1 = Offset(-100, -150);
    var p2 = Offset(100, -50);
    var p3 = Offset(100, 0);
    var p4 = Offset(200, 50);

    Paint paint = Paint();
    paint..color = Colors.lightBlue..style = PaintingStyle.stroke..strokeWidth = 2;

    Path path = Path();
    path.quadraticBezierTo(p1.dx, p1.dy, p3.dx, p3.dy);
    path.relativeQuadraticBezierTo(p2.dx, p2.dy, p4.dx, p4.dy);
    canvas.drawPath(path, paint);

  }

  void _drawCubicBezier(Canvas canvas,Size size){
    var p1 = Offset(-100, -150);
    var p2 = Offset(100, -50);
    var p3 = Offset(100, 0);
    var p4 = Offset(200, 50);

    Paint paint = Paint();
    paint..color = Colors.lightBlue..style = PaintingStyle.stroke..strokeWidth = 2;

    Path path = Path();
    path.cubicTo(p1.dx, p1.dy, p2.dx, p2.dy, p3.dx, p3.dy);
    path.relativeCubicTo(p2.dx, p2.dy, p3.dx, p3.dy, p4.dx, p4.dy);
    canvas.drawPath(path, paint);

  }

  void _drawPolygonRect(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..color = Colors.lightBlue..style = PaintingStyle.stroke..strokeWidth = 2;
    var controlP = Offset(125, -150);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(100, 100);
    var p0 = Offset(100, 100);
    path..addPolygon([
      p0,
      p0.translate(20, -20),
      p0.translate(40, -20),
      p0.translate(60, 0),
      p0.translate(60, 20),
      p0.translate(40, 40),
      p0.translate(20, 40),
      p0.translate(0, 20),
    ], true)
      ..addPath(Path()..relativeQuadraticBezierTo(controlP.dx, controlP.dy, 260, 0), Offset.zero)
      ..lineTo(160, 100);
    canvas.drawPath(path, paint);

    path.reset();
    path.lineTo(controlP.dx, controlP.dy);
    path.lineTo(260, 0);
    paint..color = Colors.red..strokeWidth = 1;
    canvas.drawPath(path, paint);
    paint..color = Colors.red..strokeWidth = 10..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.points, [controlP], paint);

    //绘制对应的文字
    TextPainter painter1 = TextPainter(
      text: TextSpan(text:"控制点",style: TextStyle(fontSize: 12,color: Colors.red)),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    painter1.layout();
    Size size1 = painter1.size;
    painter1.paint(canvas, Offset(controlP.dx-size1.width/2, controlP.dy-size1.height-5));
  }

  void _drawPathWithAPI(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..style = PaintingStyle.stroke..strokeWidth = 1..color = Colors.pink;

    Path path = Path();

    path.lineTo(80, 60);
    path.lineTo(80, 120);
    path.close();
    canvas.drawPath(path, paint);
    //返回一条新路径
    canvas.drawPath(path.shift(Offset(100, 0)), paint);
    canvas.drawPath(path.shift(Offset(200, 0)), paint);

    //判断点是否在这个路径信息里面
    var offset1 = Offset(70, 59);
    var offset2 = Offset(70, 30);
    bool isContains1 = path.contains(offset1);
    bool isContains2 = path.contains(offset2);
    print("当前是否包含==1:$isContains1,===2:$isContains2");

    //获取这个path对应的rect
    Rect rect = path.getBounds();
    paint..color = Colors.red..strokeWidth = 0.5;
    canvas.drawRect(rect, paint);
    
    //path的旋转变换
    canvas.translate(-240, 0);
    path.reset();
    // path.moveTo(-240, 0);
    path.relativeLineTo(-30, 120);
    path.relativeLineTo(30 , -30);
    path.relativeLineTo(30, 30);
    path.close();
    paint..color = Colors.red..style = PaintingStyle.fill;
    for (int i = 0; i < 8 ; i++){
      canvas.drawPath(path.transform(Matrix4.rotationZ(i*pi/4).storage), paint);
    }
  }

  void _drawPathWithCombine(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..style = PaintingStyle.fill..color = Colors.blueAccent;

    _drawCombineText(canvas, "Path 路径绘制之Combine五种联合方式",offset: Offset(0, 60),fontSize: 30);

    Path path1 = Path();
    path1.relativeLineTo(-30, 120);
    path1.relativeLineTo(30 , -30);
    path1.relativeLineTo(30, 30);
    path1.close();

    var path2 = Path()..addOval(Rect.fromCenter(center:Offset(0,0),width: 60,height: 60));
    _drawCombineText(canvas, "difference");
    canvas.drawPath(Path.combine(PathOperation.difference, path1, path2), paint);
    
    canvas.translate(100, 0);
    _drawCombineText(canvas, "intersect");
    canvas.drawPath(Path.combine(PathOperation.intersect, path1, path2), paint);

    canvas.translate(150, 0);
    _drawCombineText(canvas, "reverseDifference");
    canvas.drawPath(Path.combine(PathOperation.reverseDifference, path1, path2), paint);

    canvas.translate(-350, 0);
    _drawCombineText(canvas, "union");
    canvas.drawPath(Path.combine(PathOperation.union, path1, path2), paint);

    canvas.translate(-100, 0);
    _drawCombineText(canvas, "xor");
    canvas.drawPath(Path.combine(PathOperation.xor, path1, path2), paint);
  }

  void _drawCombineText(Canvas canvas,String string,{Offset offset = Offset.zero,double fontSize = 15}){
    //绘制对应的文字
    TextPainter painter1 = TextPainter(
      text: TextSpan(text:string,style: TextStyle(fontSize: fontSize,color: Colors.red)),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    painter1.layout();
    Size size1 = painter1.size;
    painter1.paint(canvas, Offset(-size1.width/2 - offset.dx, -size1.height-5-30-offset.dy));
  }

  void _drawComputerMetrics(Canvas canvas,Size size){
    Paint paint = Paint();
    paint..style = PaintingStyle.stroke..color = Colors.blueAccent..strokeWidth = 1;

    Path path1 = Path();
    path1.relativeLineTo(-30, 120);
    path1.relativeLineTo(30 , -30);
    path1.relativeLineTo(30, 30);
    path1.close();

    path1.addOval(Rect.fromCenter(center:Offset(0,0),width: 60,height: 60));

    //通过PathMetrics对象可以获得路径长度 length、路径索引 contourIndex 及 isClosed路径是否闭合isClosed。
    //甚至还能得到改点的角度、速度信息。
    // 下面通过pm.length * 0.5表示在路径长度50%的点的信息
    PathMetrics metric = path1.computeMetrics();
    metric.forEach((element) {
      Tangent tangent = element.getTangentForOffset(element.length * process.value);
      canvas.drawCircle(tangent.position , 5, paint..color = Colors.red..style = PaintingStyle.fill);
      // print("当前的位置===${tangent.position}，速度==${tangent.vector},角度==${tangent.angle}");
    });
    paint..color = Colors.blue..style = PaintingStyle.stroke;
    canvas.drawPath(path1, paint);

  }


  @override
  bool shouldRepaint(covariant MyPainter9 oldDelegate) {
    // return oldDelegate.process != this.process;
    return true;
  }

}
