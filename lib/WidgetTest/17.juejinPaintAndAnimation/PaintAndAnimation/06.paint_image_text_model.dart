/*
* 06.paint_image_text_model created by zj 
* on 2020/12/14 5:47 PM
* copyright on zhangjiang
*/

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '04.paint_point_model.dart';
import 'dart:ui' as ui show Image, ParagraphBuilder,ParagraphStyle,TextStyle,TextBaseline,Paragraph,ParagraphConstraints;

class PaintImageAndTextModel extends StatefulWidget {
  @override
  _PaintImageAndTextModelState createState() => _PaintImageAndTextModelState();
}

class _PaintImageAndTextModelState extends State<PaintImageAndTextModel> {

  //注意要引入的头文件
  late ui.Image _image;
  late ui.Image _chatImage;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    // _loadImageData("assets/images/touxiang123.jpg").then((value) => setState((){
    //   print("当前获取的头像===$value");
    //   _image = value;
    // }));

    _loadImageData("assets/images/touxiang789.jpg").then((value) => setState((){
      print("当前获取的头像===$value");
      _chatImage = value;
    }));
  }

  Future<ui.Image> _loadImageData(String path) async{
    ByteData data = await rootBundle.load(path);
    Uint8List bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
    return decodeImageFromList(bytes);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: MyPainter8(),
        foregroundPainter: MyPainter7(image: _chatImage),
      ),
    );
  }
}

class MyPainter7 extends CustomPainter{

  late Paint _paint;

  MyPainter7({required this.image}){
    //初始化值
    _paint = Paint()..color = Colors.red..strokeWidth = 2..style = PaintingStyle.fill;
  }

  final ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    canvas.translate(width/2, height/2);
    
    //开始绘制图片和文字
    _drawImage(canvas, size);
    // _drawText(canvas, TextAlign.center);
    // _drawText(canvas, TextAlign.left);
    // _drawText(canvas, TextAlign.right);
    //
    // _drawTextPainter(canvas,size);
  }
  
  void _drawImage(Canvas canvas,Size size){
    if (image == null) {
      return;
    }
    print("开始绘制图片");
    //绘制图片的大小就是图片原始的大小
    canvas.drawImage(image, Offset(-image.width*0.5, -image.height*0.5), _paint);


    //绘制指定区域的图片
    var width = 60.0;
    canvas.drawImageRect(image,
        Rect.fromCenter(center: Offset(50,40),width: width,height: width),
        Rect.fromCenter(center: Offset(-140,-140),width:width,height: width),
        _paint
    );

    //开始绘制气泡
    // center 表示从资源图片image上一块可缩放的矩形域，所以原点是图片的左上角。
    // dst 表示将抠出的图片填充到画布的哪个矩形域中，所以原点是画布原点。
    // var center = Rect.fromLTWH(10, 10, image.width.toDouble()-20, image.height.toDouble()-40);
    // var dst = Rect.fromCenter(center: Offset(0,0),width: 300,height: 100);
    // canvas.drawImageNine(image, center, dst, _paint);
    //
    // var dst1 = Rect.fromCenter(center: Offset(-200,0),width: 50,height: 100);
    // canvas.drawImageNine(image, center, dst1, _paint);
    //
    // var dst2 = Rect.fromCenter(center: Offset(250,0),width: 100,height: 50);
    // canvas.drawImageNine(image, center, dst2, _paint);

  }

  void _drawText(Canvas canvas,TextAlign align){

    var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: align,
      fontSize: 40,
      textDirection: TextDirection.ltr,
      maxLines: 1
    ));
    builder.pushStyle(ui.TextStyle(
      color: Colors.red,
      textBaseline: ui.TextBaseline.alphabetic
    ));
    builder.addText("hello Flutter");
    ui.Paragraph paragraph = builder.build();
    paragraph.layout(ui.ParagraphConstraints(width: 300));
    var dy = 0.0;
    if (align == TextAlign.left) {
      dy = -100;
    }else if (align == TextAlign.right) {
      dy = 0;
    }else{
      dy = 100;
    }
    canvas.drawParagraph(paragraph, Offset(0, dy));
    canvas.drawRect(Rect.fromLTWH(0, dy, 300, 40), _paint..color = Colors.blue.withAlpha(33));

  }

  void _drawTextPainter(Canvas canvas,Size size){
    var textPainter = TextPainter(
      text: TextSpan(text: "我就是我，不一样的烟火",style: TextStyle(color: Colors.red,fontSize: 40)),
      textAlign: TextAlign.start,
      maxLines: 1,
      textDirection: TextDirection.ltr
    );
    //layout 可以设置文字展示的最大和最小宽度 高度
    textPainter.layout();
    //计算文字所占的位置大小,必须在layout之后再获取text的大小
    Size size = textPainter.size;
    //设置绘制的点在屏幕中心
    textPainter.paint(canvas, Offset(-size.width/2, -size.height/2));
    //根据计算将画布中的文字移动到屏幕中心
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height).translate(-size.width/2, -size.height/2), _paint..color = Colors.blue.withAlpha(44));
  }

  @override
  bool shouldRepaint(covariant MyPainter7 oldDelegate) {
    return oldDelegate.image != image;
  }

}


class MyPainter8 extends CustomPainter{
  final int step = 20;
  final double arrowLine = 10;
  final _textPainter = TextPainter(textDirection: TextDirection.ltr);
  final Paint _paint = Paint()..color = Colors.blue;
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    canvas.translate(width*0.5, height*0.5);
    _drawGridViewByPath(canvas,size);
    // _drawAllGridView(canvas,size);
    _drawGridLines(canvas, size);
    // _drawLittleBot(canvas, size);
    _drawXScale(canvas, size);
    _drawYScale(canvas, size);
  }

  void _drawAllGridView(Canvas canvas,Size size){
    /*注意: 画布变换之后，如果不做处理，之后所有的操作都会在变化后画布的基础上进行。
    当使用 canvas.save() 时，当前画布的状态就会被保存，当执行 canvas.restore() 时，画布就会回到上次保存的状态。
    比如：在上面画横线前save画布这时画布的[顶点在屏幕中心]，画横线的过程中画布的顶点被[下移到了最后]。
    画完后restore画布，就能让画布顶点重新回到[屏幕中心]。
    */
    double width = size.width;
    double height = size.height;
    canvas.translate(width*0.5, height*0.5);
    _drawGridViewByPath(canvas, size);

    /*现在已经画完四分之一了，也许你正想傻傻再画出其他三个。有更巧妙的方法：
    如果是相同或者对称的对象，可以通过缩放进行对称变化。
    沿x轴镜像，就相当于canvas.scale(1, -1)；
    沿y轴镜像，就相当于canvas.scale(-1, 1)；
    沿原点镜像，就相当于canvas.scale(-1, -1)；
    */

    //对画布进行变换
    canvas.save();
    canvas.scale(1,-1);
    _drawGridViewByPath(canvas, size);
    canvas.restore();

    //对画布进行变换
    canvas.save();
    canvas.scale(-1,1);
    _drawGridViewByPath(canvas, size);
    canvas.restore();

    //对画布进行变换
    canvas.save();
    canvas.scale(-1,-1);
    _drawGridViewByPath(canvas, size);
    canvas.restore();
  }

  //平移画布创建网格坐标
  void _drawGridViewByCanvas(Canvas canvas,Size size){
    double width = size.width;
    double height = size.height;
    //绘制网格
    canvas.save();
    _paint..color = Colors.grey;

    for(int i = 0; i < width * 0.5 ; i++){
      canvas.drawLine(Offset.zero, Offset(0,height*0.5), _paint);
      canvas.translate(step.toDouble(), 0);
    }
    canvas.restore();

    canvas.save();
    for(int i = 0; i < height * 0.5 ; i++){
      canvas.drawLine(Offset.zero, Offset(width*0.5,0), _paint);
      canvas.translate(0, step.toDouble());
    }
    canvas.restore();
  }

  //使用path绘制路径
  void _drawGridViewByPath(Canvas canvas,Size size){
    double width = size.width;
    double height = size.height;
    var path = Path();
    //绘制网格
    _paint..color = Colors.grey..strokeWidth = 0.15..style = PaintingStyle.stroke;
    for(int i = 0; i < width * 0.5 ; i++){
      path.moveTo(i*step.toDouble(), -height*0.5);
      path.relativeLineTo(0, height);
      path.moveTo(-i * step.toDouble(), -height*0.5);
      path.relativeLineTo(0, height);
    }
    for(int i = 0; i < height * 0.5 ; i++){
      path.moveTo(-width*0.5, i * step.toDouble());
      path.relativeLineTo(width, 0);
      path.moveTo(-width*0.5, -i * step.toDouble());
      path.relativeLineTo(width, 0);
    }
    canvas.drawPath(path, _paint);
  }

  void _drawLittleBot(Canvas canvas,Size size){
    //如下，通过旋转画布可以画出一圈的小线，不过不要画布旋转，而是计算点位，那就会相当痛苦。
    int count = 18;
    _paint..color = Colors.orangeAccent..strokeWidth = 5..strokeCap = StrokeCap.round;
    double step = 2 * pi / count;
    canvas.save();
    for (int i = 0;i < count;i++) {
      canvas.drawLine(Offset(0,150), Offset(0,120), _paint);
      canvas.rotate(step);
    }
    canvas.restore();
  }

  void _drawGridLines(Canvas canvas,Size size){
    var width = size.width * 0.5;
    var height = size.height * 0.5;
    _paint..color = Colors.blue..strokeWidth = 2;
    //绘制线
    canvas.drawLine(Offset(-width, 0), Offset(width, 0), _paint);
    //绘制箭头
    canvas.drawLine(Offset(width-arrowLine-30,-arrowLine), Offset(width-30, 0), _paint);
    canvas.drawLine(Offset(width-arrowLine-30,arrowLine), Offset(width-30, 0), _paint);

    //绘制线
    canvas.drawLine(Offset(0, -height), Offset(0, height), _paint);
    //绘制箭头
    canvas.drawLine(Offset(-arrowLine, height-arrowLine), Offset(0, height), _paint);
    canvas.drawLine(Offset(arrowLine, height-arrowLine), Offset(0, height), _paint);
  }

  void _drawXScale(Canvas canvas,Size size){
    // 绘制的大小
    var count = size.width*0.5 / step;
    canvas.save();
    for (int i = 0; i < count ;i++){
      //偶数绘制文字
      if (i == 0) {
        _drawText(canvas, "0",color: Colors.black,isX: false);
      }
      if (i.isEven && i != 0) {
        var axin = i * step;
        _drawText(canvas, axin.toString());
        //平移canvas
      }
      canvas.translate(step.toDouble(), 0);

    }
    canvas.restore();

    canvas.save();
    for (int i = 0; i < count ;i++){
      //偶数绘制文字
      if (i.isEven && i != 0) {
        var axin = -i * step;
        _drawText(canvas, axin.toString());
        //平移canvas
      }
      canvas.translate(-step.toDouble(), 0);
    }
    canvas.restore();
  }

  void _drawYScale(Canvas canvas,Size size){
    // 绘制的大小
    var count = size.width*0.5 / step;
    canvas.save();
    for (int i = 0; i < count ;i++){
      //偶数绘制文字
      if (i.isEven && i != 0) {
        var axin = i * step;
        _drawText(canvas, axin.toString(),isX: false);
        //平移canvas
      }
      canvas.translate(0,step.toDouble());

    }
    canvas.restore();

    canvas.save();
    for (int i = 0; i < count ;i++){
      //偶数绘制文字
      if (i.isEven && i != 0) {
        var axin = -i * step;
        _drawText(canvas, axin.toString(),isX: false);
        //平移canvas
      }
      canvas.translate(0,-step.toDouble());
    }
    canvas.restore();

  }

  void _drawText(Canvas canvas,String text,{Color color = Colors.blue,bool isX = true}){
    var textSpan = TextSpan(text: text,style: TextStyle(fontSize: 10,color: color));
    _textPainter.text = textSpan;
    _textPainter.layout();

    Size size = _textPainter.size;
    Offset offset = Offset.zero;
    if (isX == null) {
      offset = Offset(4, size.height/2);
    }else if (isX) {
      offset = Offset(-size.width/2, size.height/2);
    }else{
      offset = Offset(size.height/2, -size.height/2);
    }
    _textPainter.paint(canvas, offset);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}


