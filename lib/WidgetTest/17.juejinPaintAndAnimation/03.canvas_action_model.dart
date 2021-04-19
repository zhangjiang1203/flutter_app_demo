/*
* 03.canvas_action_model created by zj 
* on 2020/12/10 4:46 PM
* copyright on zhangjiang
*/

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CanvasActionModel extends StatefulWidget {
  @override
  _CanvasActionModelState createState() => _CanvasActionModelState();
}

class _CanvasActionModelState extends State<CanvasActionModel> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomPaint(
        painter: MyPainter0(),
        foregroundPainter: MyPainter3(),
      ),
    );
  }
}

class MyPainter3 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint..color = Colors.red..style = PaintingStyle.fill..strokeCap = StrokeCap.round;
    //画布起点移动到屏幕中心
    canvas.translate(size.width*0.5, size.height*0.5);
    //绘制一个圆和线条
    canvas.drawCircle(Offset(0, 0), 100, paint);
    canvas.drawLine(Offset(0, 0), Offset(100, 100), paint..color = Colors.blue..strokeWidth = 20);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}

class MyPainter0 extends CustomPainter{
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

    _drawLittleBot(canvas, size);
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


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}

