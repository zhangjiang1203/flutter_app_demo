/*
* 02.wave_path_demo created by zj 
* on 2020/12/2 4:23 PM
* copyright on zhangjiang
*/

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class WaveTestModel extends StatefulWidget {
  @override
  _WaveTestModelState createState() => _WaveTestModelState();
}

class _WaveTestModelState extends State<WaveTestModel> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  double offsetX = 0;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(seconds: 2),lowerBound: -1.0,upperBound: 1.0,value: 0,vsync: this);
    _animationController.repeat();

    timer = Timer.periodic(const Duration(milliseconds: 70), (timer) {
      setState(() {
        offsetX += 0.2;
      });
    });
  }
  
  @override
  void dispose() {
    timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wave设置"),
        elevation: 0,
      ),
      body: Column(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,100),
            painter: WavePaint(progress: offsetX,showColor: Colors.blueGrey),
            foregroundPainter: ForWavePaint(progress: offsetX,showColor: Color(0x8800ff00)),
           ),
          // AnimatedBuilder(animation: _animationController, builder: (context,child){
          //   return CustomPaint(
          //     size: Size(MediaQuery.of(context).size.width,200),
          //     painter: WavePaint(progress: _animationController.value,showColor: Colors.green),
          //     // foregroundPainter: WavePaint(progress: 0.2,showColor: Colors.blue),
          //   );
          // }),
        ],
      ),
    );
  }
}

class WaveCliper extends CustomClipper<Path>{
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper != this;
  }

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    return Path();
  }
}

class WavePaint extends CustomPainter {
  WavePaint({this.progress = 0,required this.showColor});

  final double progress;
  final Color showColor;
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //设置对应的宽高
    var width = size.width;
    var height = size.height;
    //创建path
    var paint = Paint()..color = showColor..strokeWidth = 1;//..colorFilter = ColorFilter.mode(Colors.green, BlendMode.difference);

    var path = Path();
    //设置对应的点
    path..moveTo(0, height*0.5)
    ..lineTo(0, height);
    // ..lineTo(width, height)
    // ..lineTo(width, height*0.5);
    //开始绘制二次贝塞尔曲线
    // var firstPoint = Offset(3*width/4, height*0.5);
    // var secondPoint = Offset(size.width*0.5, height*0.5);
    // var firstPoint = Offset(width*0.75+width*0.2*sin(pi*progress), height*0.2+height*0.7*cos(pi*progress));
    // var secondPoint  = Offset(width*0.5, height*0.5 );
    //
    // path.quadraticBezierTo(firstPoint.dx, firstPoint.dy, secondPoint.dx, secondPoint.dy);
    //
    // var thirdPoint = Offset(width*0.3-width*0.3*sin(pi*progress),height*0.6-height*0.6*cos(pi*progress));
    // var fourthPoint = Offset(0, height/2);
    // path.quadraticBezierTo(thirdPoint.dx, thirdPoint.dy, fourthPoint.dx, fourthPoint.dy);
    List<Offset> points = [];
    for (int i = 0; i < width.toInt();i++){
      var dy = height/8 * cos(2*i*pi/360+progress) + height/8;
      points.add(Offset(i.toDouble(), dy));
    }
    path.addPolygon(points, false);
    path.lineTo(width, height);
    path.lineTo(0, height);
    // path.relativeCubicTo(firstPoint.dx, firstPoint.dy, secondPoint.dx, secondPoint.dy, thirdPoint.dx, thirdPoint.dy);
    canvas.drawPath(path, paint);
  }
}

class ForWavePaint extends CustomPainter {
  ForWavePaint({this.progress = 0,required this.showColor});

  final double progress;
  final Color showColor;
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //设置对应的宽高
    var width = size.width;
    var height = size.height;
    //创建path
    var paint = Paint()..color = showColor..strokeWidth = 1;
    var path = Path();
    //设置对应的点
    path..moveTo(0, height*0.5)
      ..lineTo(0, height);
    for (int i = 0; i < width.toInt();i++){
      var dy = height/8 * sin(2*i*pi/360+progress-1) + height/8;
      path.lineTo(i.toDouble(), dy);
    }
    path.lineTo(width, height);
    path.lineTo(0, height);
    // path.relativeCubicTo(firstPoint.dx, firstPoint.dy, secondPoint.dx, secondPoint.dy, thirdPoint.dx, thirdPoint.dy);
    canvas.drawPath(path, paint);
  }
}
