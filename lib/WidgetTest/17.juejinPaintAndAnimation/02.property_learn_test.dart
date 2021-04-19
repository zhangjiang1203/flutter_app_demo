/*
* 02.property_learn_test created by zj 
* on 2020/12/10 3:06 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PropertyLearnDemo extends StatefulWidget {
  @override
  _PropertyLearnDemoState createState() => _PropertyLearnDemoState();
}

class _PropertyLearnDemoState extends State<PropertyLearnDemo> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: CustomPaint(
          painter: MyPainter2(),
        ),
      ),
    );
  }
}

class MyPainter2 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    //绘制两个大圆，设置是否抗锯齿
    // paint..color = Colors.blue..isAntiAlias = false;
    // canvas.drawCircle(Offset(50,100), 50, paint);
    //
    // paint..color = Colors.red;
    // canvas.drawCircle(Offset(150,100), 50, paint);
    //
    // //绘制空心和实心圆
    // paint..strokeWidth..style = PaintingStyle.stroke..strokeWidth = 20;
    // canvas.drawCircle(Offset(250,100), 40, paint);
    //
    // paint..strokeWidth..style = PaintingStyle.fill..color = Colors.lightGreen;
    // canvas.drawCircle(Offset(350,100), 50, paint);

    //设置线帽类型
    /*
    StrokeCap.butt - 不出头
    StrokeCap.round - 圆头
    StrokeCap.square - 方头
    * */
    // paint..strokeCap = StrokeCap.butt..strokeWidth = 10;
    // canvas.drawLine(Offset(420, 50), Offset(420, 150), paint);
    //
    // paint..strokeCap = StrokeCap.round..strokeWidth = 10;
    // canvas.drawLine(Offset(440, 50), Offset(440, 150), paint);
    //
    // paint..strokeCap = StrokeCap.square..strokeWidth = 10;
    // canvas.drawLine(Offset(460, 50), Offset(460, 150), paint);

    //设置线接类型  线接类型只适用于Path的线段绘制。它不适用于用【Canvas.drawPoints】绘制的线。

    // Path path = Path();
    // paint..strokeWidth = 20..color = Colors.lightBlueAccent..style = PaintingStyle.stroke;
    // for(int i = 0;i < 3; i++){
    //   path.reset();
    //   path.moveTo(50+90.0*i, 30);
    //   path.lineTo(50+90.0*i, 100);
    //   path.lineTo(100+90.0*i, 70);
    //   path.lineTo(100+90.0*i, 120);
    //   canvas.drawPath(path, paint..strokeJoin = StrokeJoin.values[i]);
    // }

    // strokeMiterLimit只适用于【StrokeJoin.miter】。
    // 它是一个对斜接的限定，如果超过阈值，会变成【StrokeJoin.bevel】。
    //数字越大，允许出现的尖角就可以越尖
    // paint..strokeJoin = StrokeJoin.miter;
    // for(int i = 0;i < 4; i++){
    //   path.reset();
    //   path.moveTo(50+90.0*i, 130);
    //   path.lineTo(50+90.0*i, 200);
    //   path.relativeLineTo(60, -i*20.0);
    //   canvas.drawPath(path, paint..strokeMiterLimit = 2);
    // }
    //
    // for(int i = 0;i < 4; i++){
    //   path.reset();
    //   path.moveTo(50+90.0*i, 230);
    //   path.lineTo(50+90.0*i, 300);
    //   path.relativeLineTo(60, -20.0*i);
    //   canvas.drawPath(path, paint..strokeMiterLimit = 3);
    // }


    // Shader  抽象类
    // |---- Gradient 渐变着色
    // |--- linear 线性渐变
    // |--- radial 径向渐变
    // |--- sweep  扫描渐变
    // |--- ImageShader 图片着色
    // 后续会对这部分进行详细说明

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}
