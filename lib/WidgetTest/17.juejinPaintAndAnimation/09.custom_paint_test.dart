/*
* 09.custom_paint_test created by zj 
* on 2020/12/17 3:43 PM
* copyright on zhangjiang
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPaintTest extends StatefulWidget {
  @override
  _CustomPaintTestState createState() => _CustomPaintTestState();
}

class _CustomPaintTestState extends State<CustomPaintTest> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.red,
        child: SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
            size: Size(100,100),
            painter: MyPainter11(),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: CustomPaint(
        painter: MyPainter11(),
        child: CupertinoActivityIndicator()
      ),
    );
  }
}

class MyPainter11 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    //在Scaffold 中只设置painter，这里获取的size 为 0 0
    /*解决方法
    1.给CustomPaint设置大小
    2.CustomPaint的child指定大小
    3.使用LayoutBuilder获取布局区域
    * */
    //裁剪画布
    canvas.clipRect(Offset.zero&size);

    print("图像绘制的大小==$size");
    canvas.translate(size.width*0.5,   size.height*0.5);
    Paint paint = Paint();
    paint..color = Colors.blue..style = PaintingStyle.stroke..strokeWidth = 2;

    canvas.drawRect(Rect.fromCenter(center: Offset.zero,width: 100,height: 100), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}
