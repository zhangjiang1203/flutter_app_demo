/*
* 08.paint_color_widget created by zj 
* on 2020/12/16 4:15 PM
* copyright on zhangjiang
*/

import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/PaintAndAnimation/06.paint_image_text_model.dart';
import 'package:image/image.dart' as image ;

class PaintColorWidget extends StatefulWidget {
  @override
  _PaintColorWidgetState createState() => _PaintColorWidgetState();
}

class _PaintColorWidgetState extends State<PaintColorWidget> {


  late image.Image _image;
  late ui.Image _imageStr;
  late List<ColorImageBall> colorBalls;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);

    // _initImageBall("assets/images/touxiang789.jpg");
    _loadImageData("assets/images/touxiang789.jpg");
  }

  Future _initImageBall(String imagePath) async{
    double step = 2;
    _image = (await loadAssetImage(imagePath))!;
    print("当前图片的宽高width:${_image.width},height:${_image.height}");
    //根据图片的宽高 生成balls
    colorBalls = [];
    for (int i = 0; i < _image.width;i++) {
      for (int j = 0; j < _image.height;j++) {
        ColorImageBall ball = ColorImageBall(x: i * step+step*0.5,y: j * step+step*0.5);
        ball.radius = step*0.5;
        var color = Color(_image.getPixel(i, j));
        ball.color = Color.fromARGB(color.alpha, color.blue, color.green, color.red);
        colorBalls.add(ball);
      }
    }
    setState(() {});
  }

  Future<image.Image?> loadAssetImage(String imageName) async{
    ByteData byteData = await rootBundle.load(imageName);
    Uint8List bites = byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes);
    return image.decodeImage(bites);
  }

  Future<ui.Image?> _loadImageData(String path) async{
    ByteData data = await rootBundle.load(path);
    Uint8List bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
    _imageStr = await decodeImageFromList(bytes);
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: MyPainter8(),
        foregroundPainter: MyPainter10(colorImages: colorBalls,imageStr: _imageStr),
      ),
    );
  }
}

class MyPainter10 extends CustomPainter{

  MyPainter10({required this.colorImages,required this.imageStr});

  final ui.Image imageStr;

  final List<ColorImageBall> colorImages;

  Paint _paint = Paint();

  var colors = [
    Color(0xFFF60C0C),
    Color(0xFFF3B913),
    Color(0xFFE7F716),
    Color(0xFF3DF30B),
    Color(0xFF0DF6EF),
    Color(0xFF0829FB),
    Color(0xFFB709F4),
  ];
  var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width*0.5, size.height*0.5);
    // _drawColorBlock(canvas, size);
    // _drawLinearGradient(canvas,size);
    // _drawRadialGradient(canvas,size);
    // _drawSweepGradient(canvas,size);
    // _drawImageWithColor(canvas, size);
    // _drawImageShader(canvas, size);
    // _drawColorFilter(canvas, size);
    // _drawColorFilterByMatrix(canvas,size);
    // _drawMaskFilter(canvas,size);
    drawFilterQuality(canvas,size);
  }

  void _drawColorBlock(Canvas canvas,Size size){
    const double step = 20;
    const int count = 16;
    _paint..style = PaintingStyle.fill;
    List<Color> colors = List.generate(256, (index) => Color.fromARGB(255-index, 255, 0, 0));
    colors.asMap().forEach((index,value){
      //获取点的位置信息
      var i = index % count;//取余
      var j = index ~/ count;//取商
      var point = Offset(-(count*step/2)+i*step, -(count*step/2)+j*step);
      var rect = Rect.fromPoints(point, point.translate(step, step));
      canvas.drawRect(rect, _paint..color = value);
    });
  }

  void _drawLinearGradient(Canvas canvas,Size size){

    /*
    线性渐变的构造有六个参数，其中起点、终点是 Offset 对象，确定渐变的范围。colors 是颜色数组。这三参是必选的。
    colorStops 是每个颜色所处的分率，tileMode 是渐变模式，matrix4 是变换矩阵
    matrix4 可以对画笔填充进行变化。如下，依次是旋转、移动、倾斜
    * */
    _paint..strokeCap = StrokeCap.square
      ..strokeWidth = 50
      ..shader = ui.Gradient.linear(Offset(-100,0), Offset(0,0), colors,pos,);
    canvas.drawLine(Offset(0, -100), Offset(0, 100), _paint);
    _drawCombineText(canvas, "clamp 无旋转",fontSize: 12,offset: Offset(0, -130));

    canvas.translate(120, 0);
    _paint..shader = ui.Gradient.linear(Offset(-100,0), Offset(0,0), colors,pos,TileMode.mirror,Matrix4.rotationZ(pi*0.5).storage);
    canvas.drawLine(Offset(0, -100), Offset(0, 100), _paint);
    _drawCombineText(canvas, "mirror pi/2",fontSize: 12,offset: Offset(0, -130));

    canvas.translate(120, 0);
    _paint..shader = ui.Gradient.linear(Offset(-100,0), Offset(0,0), colors,pos,TileMode.repeated,Matrix4.rotationZ(pi*0.5).storage);
    canvas.drawLine(Offset(0, -100), Offset(0, 100), _paint);
    _drawCombineText(canvas, "repeated pi/2",fontSize: 12,offset: Offset(0, -130));

    canvas.translate(120, 0);
    _paint..shader = ui.Gradient.linear(Offset(-100,0), Offset(0,0), colors,pos,TileMode.clamp,Matrix4.rotationZ(pi/2).storage);
    canvas.drawLine(Offset(0, -100), Offset(0, 100), _paint);
    _drawCombineText(canvas, "clamp pi/2",fontSize: 12,offset: Offset(0, -130));

    canvas.translate(-480, 0);
    _paint..shader = ui.Gradient.linear(Offset(-100,0), Offset(0,0), colors,pos,TileMode.clamp,Matrix4.rotationZ(pi/6).storage);
    canvas.drawLine(Offset(0, -100), Offset(0, 100), _paint);
    _drawCombineText(canvas, "clamp pi/6",fontSize: 12,offset: Offset(0, -130));

    canvas.translate(-120, 0);
    _paint..shader = ui.Gradient.linear(Offset(-100,0), Offset(0,0), colors,pos,TileMode.mirror,Matrix4.rotationZ(pi/4).storage);
    canvas.drawLine(Offset(0, -100), Offset(0, 100), _paint);
    _drawCombineText(canvas, "mirror pi/4",fontSize: 12,offset: Offset(0, -130));

    canvas.translate(-120, 0);
    _paint..shader = ui.Gradient.linear(Offset(-100,0), Offset(0,0), colors,pos,TileMode.repeated,Matrix4.rotationZ(pi/3).storage);
    canvas.drawLine(Offset(0, -100), Offset(0, 100), _paint);
    _drawCombineText(canvas, "repeated pi/3",fontSize: 12,offset: Offset(0, -130));
  }

  void _drawRadialGradient(Canvas canvas,Size size){
    // Gradient.radial(
    //     Offset center, // 中心
    //     double radius, // 半径
    //     List<Color> colors, //颜色
    //     [
    //       List<double> colorStops, //每个颜色所处的分率
    //       TileMode tileMode = TileMode.clamp, //模式
    //       Float64List matrix4,  //变换矩阵
    //       Offset focal, //焦点坐标
    //       double focalRadius = 0.0 //焦点半径
    //     ])
    canvas.translate(40, 0);
    _paint.shader = ui.Gradient.radial(Offset(0,0), 30, colors,pos);
    _drawCombineText(canvas, "clamp 0,0",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

    canvas.translate(120, 0);
    _paint.shader = ui.Gradient.radial(Offset(0,0), 30, colors,pos,TileMode.repeated);
    _drawCombineText(canvas, "repeated 0,0",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

    canvas.translate(120, 0);
    _paint.shader = ui.Gradient.radial(Offset(0,0), 30, colors,pos,TileMode.mirror);
    _drawCombineText(canvas, "mirror 0,0",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

    canvas.translate(-360, 0);
    _paint.shader = ui.Gradient.radial(Offset(0,0), 30, colors,pos,TileMode.repeated,null,Offset(10,-10),10);
    _drawCombineText(canvas, "repeated 10,-10",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

    canvas.translate(-120, 0);
    _paint.shader = ui.Gradient.radial(Offset(0,0), 30, colors,pos,TileMode.mirror,null,Offset(-10,10),5);
    _drawCombineText(canvas, "mirror -10,10",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

    canvas.translate(-120, 0);
    _paint.shader = ui.Gradient.radial(Offset(0,0), 30, colors,pos,TileMode.clamp,null,Offset(15,-15),1);
    _drawCombineText(canvas, "clamp 15,-15",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

  }

  void _drawSweepGradient(Canvas canvas,Size size){
    // Gradient.sweep(
    //     Offset center, // 中心
    //     List<Color> colors, //颜色
    //     [
    //       List<double> colorStops, //每个颜色所处的分率
    //       TileMode tileMode = TileMode.clamp,  //模式
    //       double startAngle = 0.0,//起始角度
    //       double endAngle = math.pi * 2,//终止角度
    //       Float64List matrix4, //变换矩阵
    //     ])

    canvas.translate(40, 0);
    _paint.shader = ui.Gradient.sweep(Offset(0,0), colors,pos);
    _drawCombineText(canvas, "clamp 0,pi*2",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

    canvas.translate(120, 0);
    _paint.shader = ui.Gradient.sweep(Offset(0,0),colors,pos,TileMode.repeated,0,pi/2);
    _drawCombineText(canvas, "repeated 0,pi/2",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

    canvas.translate(120, 0);
    _paint.shader = ui.Gradient.sweep(Offset(0,0), colors,pos,TileMode.mirror,0,pi/3);
    _drawCombineText(canvas, "mirror 0,pi/3",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

    canvas.translate(-360, 0);
    _paint.shader = ui.Gradient.sweep(Offset(0,0), colors,pos,TileMode.repeated,0,pi/4);
    _drawCombineText(canvas, "repeated 0,pi/4",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

    canvas.translate(-120, 0);
    _paint.shader = ui.Gradient.sweep(Offset(0,0), colors,pos,TileMode.mirror,0,pi/5);
    _drawCombineText(canvas, "mirror 0,pi/5",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

    canvas.translate(-120, 0);
    _paint.shader = ui.Gradient.sweep(Offset(0,0), colors,pos,TileMode.clamp,0,pi/6);
    _drawCombineText(canvas, "clamp 0,pi/6",offset: Offset(0, -50));
    canvas.drawCircle(Offset(0, 0), 50, _paint);

  }

  void _drawCombineText(Canvas canvas,String string,{Offset offset = Offset.zero,double fontSize = 15}){
    //绘制对应的文字
    TextPainter painter1 = TextPainter(
      text: TextSpan(text:string,style: TextStyle(fontSize: fontSize,color: Colors.red,fontWeight: FontWeight.bold)),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    painter1.layout();
    Size size1 = painter1.size;
    painter1.paint(canvas, Offset(-size1.width/2 - offset.dx, -size1.height+offset.dy));
  }

  void _drawImageWithColor(Canvas canvas,Size size){

    if (colorImages == null) return;
    //获取image中的像素的点位，用点位去绘制对应的image
    _paint..style = PaintingStyle.fill;
    canvas.translate(-100, -100);
    colorImages.forEach((element) {
      canvas.drawCircle(Offset(element.x, element.y),  element.radius, _paint..color = element.color!);
    });
  }

  void _drawImageShader(Canvas canvas,Size size){
    //获取图片
    if(imageStr == null) return;
    _paint..shader = ui.ImageShader(
      imageStr,
      TileMode.repeated,
      TileMode.repeated,
      Float64List.fromList([
        1,0,0,0,
        0,1,0,0,
        0,0,1,0,
        0,0,0,1
      ])
    );

    //绘制图片
    canvas.drawCircle(ui.Offset(0, 0), 80, _paint);

    canvas.translate(200, 0);
    canvas.drawCircle(ui.Offset(0, 0), 60, _paint..style = PaintingStyle.stroke..strokeWidth = 40);

    canvas.translate(-350, 0);
    canvas.drawLine(Offset(-200, 0), Offset(0, 0), _paint..style = PaintingStyle.stroke..strokeWidth = 50);
    // canvas.drawCircle(ui.Offset(0, 0), 60, _paint..style = PaintingStyle.stroke..strokeWidth = 40);
  }

  void _drawColorFilter(Canvas canvas,Size size){
    if(imageStr == null)  return;
    canvas.translate(-size.width*0.5, -size.height*0.5);
    print("当前的总数===${BlendMode.values.length}");
    _drawCombineText(canvas, "绘制滤色器，各种混合模式",offset: Offset(-size.width*0.5, 50),fontSize: 30);

    BlendMode.values.asMap().forEach((index,element) {
      int row = index % 9;
      int column = index ~/ 9;
      print("object===row:$row,column:$column");
      var offset = Offset(80.0*row+30, 80.0*column+60);
      _drawValueColorFilter(canvas, imageStr, element.toString().substring(10),offset,colorFilter: ColorFilter.mode(Colors.green, element));
    });
    //绘制原图和其他的模式
    var oriRow = BlendMode.values.length % 9;
    var oriCol = BlendMode.values.length ~/ 9;

    var offset1 = Offset(80.0*oriRow+30, 80.0*oriCol+60);
    _drawValueColorFilter(canvas, imageStr, "original",offset1);
    var offset2 = Offset(80.0*(oriRow+1)+30, 80.0*oriCol+60);
    _drawValueColorFilter(canvas, imageStr, "linear",offset2,colorFilter: ColorFilter.linearToSrgbGamma());
    var offset3 = Offset(80.0*(oriRow+2)+30, 80.0*oriCol+60);
    _drawValueColorFilter(canvas, imageStr, "srgb",offset3,colorFilter: ColorFilter.srgbToLinearGamma());

  }

  void _drawValueColorFilter(Canvas canvas,ui.Image image,String name,Offset offset,{ColorFilter? colorFilter}){

    const double width = 60.0;
    final Rect src = Rect.fromCenter(center: Offset(50,40),width: width,height: width);
    Rect dst =  Rect.fromLTWH(offset.dx, offset.dy, width, width);
    canvas.drawImageRect(image, src, dst, _paint..colorFilter = colorFilter ?? null);
    canvas.drawRect(dst, _paint..style = PaintingStyle.stroke..strokeWidth = 1..color = Colors.red..colorFilter = null);
    //绘制文字
    _drawCombineText(canvas, name,offset: Offset(-offset.dx-width*0.5, offset.dy+width+15),fontSize: 10);
  }

  void _drawColorFilterByMatrix(Canvas canvas,Size size){

    const ColorFilter sepia = ColorFilter.matrix(<double>[
      0.393, 0.769, 0.189, 0, 0,
      0.349, 0.686, 0.168, 0, 0,
      0.272, 0.534, 0.131, 0 , 0,
      0,     0,     0,     1, 0,
    ]);
    canvas.drawImage(imageStr, Offset(-100,-100), _paint..colorFilter=sepia);

    const ColorFilter greyscale = ColorFilter.matrix(<double>[
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0,      0,      0,      1, 0,
    ]);
    canvas.drawImage(imageStr, Offset(0,-100), _paint..colorFilter=greyscale);

    const n = 90.0;
    const ColorFilter light = ColorFilter.matrix(<double>[
      1,0,0,0,n,
      0,1,0,0,n,
      0,0,1,0,n,
      0,0,0,1,0
    ]);
    canvas.drawImage(imageStr, Offset(-100,0), _paint..colorFilter=light);

    const n2 = -126.0;
    const ColorFilter darken = ColorFilter.matrix(<double>[
      1,0,0,0,n2,
      0,1,0,0,n2,
      0,0,1,0,n2,
      0,0,0,1,0
    ]);
    canvas.drawImage(imageStr, Offset(0, 0), _paint..colorFilter=darken);
  }

  void drawFilterQuality(Canvas canvas,Size size) {

    _drawCombineText(canvas, "设置滤镜质量",offset: Offset(0,-100),fontSize: 30);

    var paint = Paint();
    paint.imageFilter = ui.ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.6);
    paint.maskFilter = MaskFilter.blur(BlurStyle.inner, 20);
    paint.colorFilter = ColorFilter.mode(Colors.yellow, BlendMode.modulate);
    paint.filterQuality = FilterQuality.none;
    canvas.drawImage(imageStr, Offset(-300,-50), paint);
    _drawCombineText(canvas, "none",offset: Offset(250,-50));

    paint.filterQuality = FilterQuality.low;
    canvas.drawImage(imageStr, Offset(-150,-50), paint);
    _drawCombineText(canvas, "low",offset: Offset(100,-50));

    paint.filterQuality = FilterQuality.medium;
    canvas.drawImage(imageStr, Offset(0,-50), paint);
    _drawCombineText(canvas, "medium",offset: Offset(-50,-50));

    paint.filterQuality = FilterQuality.high;
    canvas.drawImage(imageStr, Offset(150,-50), paint);
    _drawCombineText(canvas, "high",offset: Offset(-200,-50));
  }

  void _drawMaskFilter(Canvas canvas,Size size){
    _paint..maskFilter = MaskFilter.blur(BlurStyle.inner, 20);
    canvas.drawImage(imageStr, Offset(-150,-150), _paint);

    _paint..maskFilter = MaskFilter.blur(BlurStyle.normal, 5);
    canvas.drawImage(imageStr, Offset(50,-150), _paint);

    _paint..maskFilter = MaskFilter.blur(BlurStyle.outer, 5);
    canvas.drawImage(imageStr, Offset(-50,-50), _paint);

    _paint..maskFilter = MaskFilter.blur(BlurStyle.solid, 5);
    canvas.drawImage(imageStr, Offset(-150,50), _paint);

    _paint..maskFilter = MaskFilter.blur(BlurStyle.solid, 10);
    canvas.drawImage(imageStr, Offset(50,50), _paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class ColorImageBall {
  ColorImageBall({required this.x,required this.y,this.color,this.radius = 20});
  double x;
  double y;
  Color? color;
  double radius;
}
