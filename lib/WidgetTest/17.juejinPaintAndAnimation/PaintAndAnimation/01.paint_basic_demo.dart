/*
* 01.paint_basic_demo created by zj 
* on 2020/12/10 2:10 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BasicPaintLearnDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BasicPaintLearnDemoState();
  }

}

class _BasicPaintLearnDemoState extends State<BasicPaintLearnDemo> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations( // 使设备横屏显示
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIOverlays([]); // 全屏显示
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: CustomPaint(
          painter: MyBasicPainter(),
        )
      ),
    );
  }
}

//绘制一个直径为10 的远点
class MyBasicPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint..color = Colors.red..strokeWidth = 4;
    canvas.drawCircle(Offset(100, 100), 10, paint);

    paint..color = Colors.blue..strokeJoin = StrokeJoin.round;
    canvas.drawLine(Offset(0, 100), Offset(100, 200), paint);

    paint..color = Colors.green..strokeJoin = StrokeJoin.round;
    canvas.drawLine(Offset(100, 200), Offset(200, 100), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}
