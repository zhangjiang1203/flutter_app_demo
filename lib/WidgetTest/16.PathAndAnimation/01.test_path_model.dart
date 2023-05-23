/*
* 01.test_path_model created by zj 
* on 2020/12/1 3:32 PM
* copyright on zhangjiang
*/

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/part_refresh_widget/single_data_line.dart';

class TestPathLocalModel extends StatefulWidget {
  @override
  _TestPathLocalModelState createState() => _TestPathLocalModelState();
}

class _TestPathLocalModelState extends State<TestPathLocalModel> with TickerProviderStateMixin,MultDataLine {

  //设置五角星变换
  late AnimationController _polygonController;
  late Animation _polygonAnimation;

  late AnimationController _bezierController;
  late Animation _bezierAnimation;

  late AnimationController _quXianController;
  late Animation _quXianAnimation;

  var offsetX = 0.0;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    _polygonController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _polygonController.reverse();
        }else if(status == AnimationStatus.dismissed){
          _polygonController.forward();
        }
      });
    _polygonAnimation = Tween(begin: 1.0,end: 4.0).animate(_polygonController);
    _polygonController.forward();

    _bezierController = AnimationController(
        lowerBound: -1.0,
        upperBound: 1.0,
        value: 0,
        duration: const Duration(seconds: 10),
        vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _bezierController.reverse();
        }else if(status == AnimationStatus.dismissed){
          _bezierController.forward();
        }
      });
    _bezierAnimation = Tween().animate(_bezierController);
    _bezierController.repeat();
    //
    _quXianController = AnimationController(
        duration: const Duration(seconds: 20),
        vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _quXianController.reverse();
        }else if(status == AnimationStatus.dismissed){
          _quXianController.forward();
        }
      });
    _quXianAnimation = Tween(begin: -10.0,end: 10.0).animate(_quXianController);
    _quXianController.forward();

    //创建定时器
    timer = Timer.periodic(const Duration(milliseconds: 120), (timer) {
      offsetX += 0.5;
      getObserver("sinCircle").setData(offsetX);
    });
  }

  @override
  void dispose() {
    _polygonController.dispose();
    _bezierController.dispose();
    _quXianController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义裁剪"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            // 绘制多边形
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipPath(
                  clipper: PolygonPath1(),
                  child: Container(
                    height: 80,
                    width: 80,
                    color: Colors.green,
                  ),
                ),
                ClipPath(
                  clipper: PolygonPath2(),
                  child: Container(
                    height: 80,
                    width: 80,
                    color: Colors.blue,
                  ),
                ),
                AnimatedBuilder(
                  animation: _polygonAnimation,
                  builder: (context,child){
                    return ClipPath(
                      clipper: PolygonPath3(scale: _polygonAnimation.value),
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Colors.red,
                      ),
                    );
                  },
                )
              ],
            ),
            //绘制曲线,一般弧度
            SizedBox(height: 5,),
            ClipPath(
              clipper: BezierPath1(),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.pinkAccent
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipPath(
                  clipper: BezierPath2(),
                  child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.pinkAccent
                  ),
                ),
                AnimatedBuilder(animation: _bezierController, builder: (context,child){
                  return ClipPath(
                    clipper: BezierPath1(progress: _bezierController.value),
                    child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.amberAccent
                    ),
                  );
                })
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     CustomPaint(
            //       size: Size(100,100),
            //       painter: BezierPainter1(50),
            //     ),
            //   ],
            // ),
            SizedBox(height: 5,),
            Container(
              // color: Colors.blue,
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width,50),
                painter: QuXianPainter2(excursion: offsetX),
              ),
            ),
            SizedBox(height: 10,),
            AnimatedBuilder(
              animation: _quXianAnimation,
              builder: (build,child){
                return Container(
                  // color: Colors.blue,
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width,50),
                    painter: QuXianPainter2(excursion: offsetX),
                  ),
                );
              },
            ),
            SizedBox(height: 10,),
            getObserver("sinCircle").addObserver(initValue: 0.0,builder:(context,value){
              return Container(
                // color: Colors.blue,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,100),
                  painter: QuXianPainter3(excursion: value),
                  // foregroundPainter: QuXianPainter2(excursion: offsetX),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class PolygonPath1 extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  @override
  Path getClip(Size size) {
    //获取当前的Size
    Path path = Path();
    //设置路径
    path.moveTo(0, 0);
    path.lineTo(0, 40);
    path.lineTo(40, 40);
    path.lineTo(40, 80);
    path.lineTo(80, 80);
    path.lineTo(80, 0);
    return path;
  }
}

class PolygonPath2 extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  @override
  Path getClip(Size size) {
    //获取当前的Size
    Path path = Path();
    //设置路径
    path.moveTo(0, 0);
    path.lineTo(80, 80);
    path.lineTo(80, 0);
    return path;
  }
}

class PolygonPath3 extends CustomClipper<Path> {
  PolygonPath3({this.scale = 2.5});

  final double scale;

  double perDegree = 36;
  //角度转弧度
  double degree2Radian(double degree){
    return (pi * degree / 180);
  }

  @override
  bool shouldReclip(PolygonPath3 oldClipper) {
    return oldClipper.scale != this.scale;
  }
  @override
  Path getClip(Size size) {
    //设置半径和宽高
    var R = min(size.width/2, size.height/2);
    var r = R/scale;
    var x = size.width/2;
    var y = size.height/2;
    //获取当前的Size
    Path path = Path();
    //设置路径,从顶点开始绘制
    path.moveTo(x, y-R);
    path.lineTo(x-sin(degree2Radian(perDegree))*r, y-cos(degree2Radian(perDegree))*r);
    path.lineTo(x-sin(degree2Radian(perDegree*2))*R, y-cos(degree2Radian(perDegree*2))*R);
    path.lineTo(x-sin(degree2Radian(perDegree*3))*r, y-cos(degree2Radian(perDegree*3))*r);
    path.lineTo(x-sin(degree2Radian(perDegree*4))*R, y-cos(degree2Radian(perDegree*4))*R);
    path.lineTo(x-sin(degree2Radian(perDegree*5))*r, y-cos(degree2Radian(perDegree*5))*r);
    path.lineTo(x-sin(degree2Radian(perDegree*6))*R, y-cos(degree2Radian(perDegree*6))*R);
    path.lineTo(x-sin(degree2Radian(perDegree*7))*r, y-cos(degree2Radian(perDegree*7))*r);
    path.lineTo(x-sin(degree2Radian(perDegree*8))*R, y-cos(degree2Radian(perDegree*8))*R);
    path.lineTo(x-sin(degree2Radian(perDegree*9))*r, y-cos(degree2Radian(perDegree*9))*r);
    path.lineTo(x-sin(degree2Radian(perDegree*10))*R, y-cos(degree2Radian(perDegree*10))*R);
    return path;
  }
}

class BezierPath1 extends CustomClipper<Path> {

  BezierPath1({this.progress = 0});

  final progress;

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height*0.5);
    //构建两个点 创建贝塞尔路径
    var firstPoint = Offset(size.width*0.5+(size.width*0.4+1)*sin(progress * pi), size.height*0.6 + size.height*0.5 * cos(progress * pi));
    var secondPoint = Offset(size.width, size.height/2);
    path.quadraticBezierTo(firstPoint.dx, firstPoint.dy, secondPoint.dx, secondPoint.dy);
    path.lineTo(size.width, 0);

    return path;
  }
}

class BezierPath2 extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height-30);
    //构建两个点 创建贝塞尔路径
    var firstPoint = Offset(size.width/4, size.height);
    var secondPoint = Offset(size.width/2.25, size.height-30);
    path.quadraticBezierTo(firstPoint.dx, firstPoint.dy, secondPoint.dx, secondPoint.dy);

    var thirdPoint = Offset(3*size.width/4, size.height-80);
    var fourthPoint = Offset(size.width, size.height-40);
    path.quadraticBezierTo(thirdPoint.dx, thirdPoint.dy, fourthPoint.dx, fourthPoint.dy);

    path.lineTo(size.width, 0);

    return path;
  }
}

class BezierPath3 extends CustomClipper<Path> {

  BezierPath3({this.height = 50});

  final double height;

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height/2);
    //构建两个点 创建贝塞尔路径
    var firstPoint = Offset(size.width/4, size.height/2 - height);
    var secondPoint = Offset(size.width/2, size.height/2);
    path.quadraticBezierTo(firstPoint.dx, firstPoint.dy, secondPoint.dx, secondPoint.dy);

    var thirdPoint = Offset(3*size.width/4, size.height/2+height);
    var fourthPoint = Offset(size.width, size.height/2);
    path.quadraticBezierTo(thirdPoint.dx, thirdPoint.dy, fourthPoint.dx, fourthPoint.dy);

    // path.lineTo(size.width, 0);

    return path;
  }
}

class BezierPath4 extends CustomClipper<Path> {

  BezierPath4({this.height = 50});

  final double height;

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    //构建两个点 创建贝塞尔路径
    var waveWidth = 80.0;
    var waveHeight = 40.0;
    path.moveTo(0, 0);

    // y=Asin(ωx+φ)+k
    var arr = List.generate(size.width.toInt(), (index) => index);
    for (var index in arr){
      print("dangqian====$index}");
      var dy =  waveHeight* sin((30*index))+waveHeight/2;
      path.lineTo(index.toDouble(), dy);

    }
    // path.relativeQuadraticBezierTo(waveWidth/2, -waveHeight*2, waveWidth, 0);
    // path.relativeQuadraticBezierTo(waveWidth/2, waveHeight*2, waveWidth, 0);
    // path.relativeQuadraticBezierTo(waveWidth/2, -waveHeight*2, waveWidth, 0);
    // path.relativeQuadraticBezierTo(waveWidth/2, waveHeight*2, waveWidth, 0);
    // path.close();
    // path.lineTo(waveWidth, waveHeight);

    return path;
  }
}

class QuXianPain extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class BezierPainter1 extends CustomPainter {
  final int height; //波的高度

  BezierPainter1(this.height);

  //路径画笔
  Paint _paint = Paint()
    ..color = Colors.deepOrange
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..strokeWidth = 10;

  //点画笔
  Paint _pointPaint = Paint()
    ..color = Colors.teal
    ..strokeWidth = 10
    ..isAntiAlias = true
    ..style = PaintingStyle.fill;

  //曲线路径
  Path _path = Path();

  @override
  void paint(Canvas canvas, Size size) {

    ///屏幕左上脚的坐标顶点对应着(0,0)点
    //屏幕中左侧点

    Offset offset1 = Offset(0, size.height / 2);

    //屏幕终点
    Offset offset2 = Offset(size.width / 2, size.height / 2);
    // TODO: implement paint
    // print('Size.width==>${size.width} Size.height==>${size.height}');
    // print(
    //     'Screen.width==>${Screen.screenWidthDp} Screen.height==>${Screen.screenHeightDp}');
    _path.moveTo(offset1.dx, offset1.dy);

    ///假设,整个波长=屏幕宽度=M,画的是一条正弦
    ///绘制波峰
    ///波峰控制点就在(M/4,centerY-波纹高度),终点在屏幕中点
    _path.quadraticBezierTo(
        size.width / 4,
        size.height / 2 - this.height,
        size.width / 2,
        size.height / 2);
    ///绘制波谷,此时画笔的起点已经在屏幕中心
    ///波谷控制点就在(3M/4,centerY+波纹高度),终点在屏幕中线终点
    _path.quadraticBezierTo(
        size.width / 4 * 3,
        size.height / 2 + this.height,
        size.width,
        size.height / 2);
    ///绘制,可以把style = PaintingStyle.fill换成stoke看看效果
    canvas.drawPath(_path, _paint);

    //描绘辅助控制点
    canvas.drawPoints(
        PointMode.points,
        [
          Offset(0, size.height / 2),
          Offset(size.width / 4,
              size.height / 2 - this.height),
          Offset(size.width / 2, size.height / 2)
        ],
        _pointPaint);
    canvas.drawPoints(
        PointMode.points,
        [
          Offset(size.width / 2, size.height / 2),
          Offset(size.width / 4 * 3,
              size.height / 2 + this.height),
          Offset(size.width, size.height / 2)
        ],
        _pointPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class QuXianPainter2 extends CustomPainter {

  QuXianPainter2({this.excursion = 0});

  final double excursion;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    var paint = Paint()..color = Colors.red..strokeWidth = 1;
    // paint.blendMode = BlendMode.color;
    // canvas.

    List<Offset> pointsList = [];
    for (int i = 0; i < width.toInt();i++){
      var dy = height/2 * sin(i*pi/360+excursion) + height/2;
      pointsList.add(Offset(i.toDouble(), dy));
    }
    canvas.drawPoints(PointMode.polygon, pointsList, paint);
    //如果不清除数组中的数据，将会展示两个颜色的数据，和一根来回切换的线
    // pointsList.clear();
    // for (int i = 0; i < width.toInt();i++){
    //   var dy = height/2 * cos(2*i*pi/360+excursion) + height/2;
    //   pointsList.add(Offset(i.toDouble(), dy));
    // }
    // paint..color = Colors.blue..strokeWidth = 1;
    // canvas.drawPoints(PointMode.polygon, pointsList, paint);
  }

}

class QuXianPainter3 extends CustomPainter {

  QuXianPainter3({this.excursion = 0});

  final double excursion;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    var paint = Paint()..color = Colors.red..strokeWidth = 1;

    List<Offset> pointsList = [];
    //如果不清除数组中的数据，将会展示两个颜色的数据，和一根来回切换的线
    pointsList.clear();
    var path = Path();
    //设置对应的点
    path..moveTo(width, 0)
      ..lineTo(width, height*0.5);
    for (int i = width.toInt(); i > 0;i--){
      var dy = height/8 * sin(2*i*pi/360-1+excursion) + height/2;
      path.lineTo(i.toDouble(), dy);
    }
    path.lineTo(0, height*0.5);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

}



abstract class BasePainter extends CustomPainter{
  Animation<double>? _xAnimation;
  Animation<double>? _yAnimation;

  set XAnimation(Animation<double>? value) {
    _xAnimation = value;
  }

  set YAnimation(Animation<double>? value) {
    _yAnimation = value;
  }

  Animation<double>? get YAnimation => _yAnimation;

  Animation<double>? get XAnimation => _xAnimation;

}

class WavePainter extends BasePainter {
  int waveCount;
  int crestCount;
  double? waveHeight;
  List<Color>? waveColors;
  double circleWidth;
  Color circleColor;
  Color circleBackgroundColor;
  bool showProgressText;
  TextStyle textStyle;

  WavePainter(
      {this.waveCount = 1,
        this.crestCount = 2,
        this.waveHeight,
        this.waveColors,
        this.circleColor = Colors.grey,
        this.circleBackgroundColor = Colors.white,
        this.circleWidth = 5.0,
        this.showProgressText = true,
        this.textStyle = const TextStyle(
          fontSize: 60.0,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(color: Colors.grey, offset: Offset(5.0, 5.0), blurRadius: 5.0)
          ],
        )});

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    if (waveHeight == null) {
      waveHeight = height / 10;
      height = height + (waveHeight ?? 0);
    }

    if (waveColors == null) {
      waveColors = [
        Color.fromARGB(
            100, Colors.blue.red, Colors.blue.green, Colors.blue.blue)
      ];
    }

    Offset center = new Offset(width / 2, height / 2);
    double xMove = width * (XAnimation?.value ?? 0);
    double yAnimValue = 0.0;
    if (YAnimation != null) {
      yAnimValue = (YAnimation?.value ?? 0);
    }
    double yMove = height * (1.0 - yAnimValue);
    Offset waveCenter = new Offset(xMove, yMove);

    var paintCircle = new Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill
      ..strokeWidth = circleWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 5.0);

   canvas.drawCircle(center, min(width, height) / 2, paintCircle);

    List<Path> wavePaths = [];

    for (int index = 0; index < waveCount; index++) {
      num direction = pow(-1.0, index);
      Path path = new Path()
        ..moveTo(waveCenter.dx - width, waveCenter.dy)
        ..lineTo(waveCenter.dx - width, center.dy + height / 2)
        ..lineTo(waveCenter.dx + width, center.dy + height / 2)
        ..lineTo(waveCenter.dx + width, waveCenter.dy);

      for (int i = 0; i < 2; i++) {
        for (int j = 0; j < crestCount; j++) {
          num a = pow(-1.0, j);
          path
            ..quadraticBezierTo(
                waveCenter.dx +
                    width * (1 - i - (1 + 2 * j) / (2 * crestCount)),
                waveCenter.dy + (waveHeight ?? 0) * a * direction,
                waveCenter.dx +
                    width * (1 - i - (2 + 2 * j) / (2 * crestCount)),
                waveCenter.dy);
        }
      }

      path..close();

      wavePaths.add(path);
    }
    var paint = new Paint()
      ..color = circleBackgroundColor
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 5.0);

    canvas.saveLayer(
        Rect.fromCircle(center: center, radius: min(width, height) / 2), paint);

//    canvas.drawCircle(center, min(width, height) / 2, paint);

    paint
//      ..blendMode = BlendMode.srcATop
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 10.0);

    for (int i = 0; i < wavePaths.length; i++) {
      if ((waveColors?.length ?? 0) >= wavePaths.length) {
        paint.color = waveColors![i];
      } else {
        paint.color = waveColors![0];
      }
      canvas.drawPath(wavePaths[i], paint);
    }
//    paint.blendMode = BlendMode.srcATop;
    if (showProgressText) {
      TextPainter tp = TextPainter(
          text: TextSpan(
              text: '${(yAnimValue * 100.0).toStringAsFixed(0)}%',
              style: textStyle),
          textDirection: TextDirection.rtl)
        ..layout();

      tp.paint(
          canvas, Offset(center.dx - tp.width / 2, center.dy - tp.height / 2));
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

abstract class BasePainterFactory {
  BasePainter getPainter();
}

class WavePainterFactory extends BasePainterFactory {
  BasePainter getPainter() {
    return WavePainter(
      waveCount: 1,
      waveColors: [
        Colors.lightBlueAccent[200]!,
      ],
      textStyle:
      TextStyle(
        fontSize: 60.0,
        foreground: Paint()
          ..color = Colors.lightBlue
          ..style = PaintingStyle.fill
          ..strokeWidth = 2.0
          ..blendMode = BlendMode.difference
          ..colorFilter = ColorFilter.mode(Colors.white, BlendMode.exclusion)
          ..maskFilter = MaskFilter.blur(BlurStyle.solid, 1.0),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProgressManager extends StatefulWidget {
  @override
  _ProgressManagerState createState() =>
      new _ProgressManagerState().._factory = WavePainterFactory();
}

class _ProgressManagerState extends State<ProgressManager>
    with TickerProviderStateMixin {
  late AnimationController xController;
  late AnimationController yController;
  late Animation<double> xAnimation;
  late Animation<double> yAnimation;
  List<double> _progressList = [];
  double curProgress = 0;
  late BasePainterFactory _factory;

  set painter(BasePainterFactory factory) {
    _factory = factory;
  }

  setProgress(double progress) {
    _progressList.add(progress);
    onProgressChange();
  }

  onProgressChange() {
    if (_progressList.length > 0) {
      if (yController != null && yController.isAnimating) {
        return;
      }
      double nextProgress = _progressList[0];
      _progressList.removeAt(0);
      final double begin = curProgress;
      yController = new AnimationController(
          vsync: this, duration: Duration(milliseconds: 1000));
      yAnimation =
          new Tween(begin: begin, end: nextProgress).animate(yController);
      yAnimation.addListener(_onProgressChange);
      yAnimation.addStatusListener(_onProgressStatusChange);
      yController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    xController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    xAnimation = new Tween(begin: 0.0, end: 1.0).animate(xController);
    xAnimation.addListener(_change);
    yController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    yAnimation = new Tween(begin: 0.0, end: 1.0).animate(yController);
    yAnimation.addListener(_onProgressChange);
    yAnimation.addStatusListener(_onProgressStatusChange);

    doDelay(xController, 0);

    Future.delayed(Duration(milliseconds: 3000), () {
      setProgress(0.66);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Container(
        width: MediaQuery.of(context).size.width,
        height: 400.0,
        child: new CustomPaint(
          painter: _factory.getPainter()
            ..XAnimation = xAnimation
            ..YAnimation = yAnimation,
          size: new Size(MediaQuery.of(context).size.width, 400.0),
        ),
      ),
    );
  }

  void _change() {
    setState(() {});
  }

  void _onProgressChange() {
    setState(() {
      curProgress = yAnimation.value;
    });
  }

  void _onProgressStatusChange(status) {
    if (status == AnimationStatus.completed) {
      onProgressChange();
    }
  }

  void doDelay(AnimationController controller, int delay) async {
    Future.delayed(Duration(milliseconds: delay), () {
      controller..repeat();
    });
  }

  @override
  void dispose() {
    xController.dispose();
    yController.dispose();
    xAnimation.removeListener(_change);
    yAnimation.removeListener(_onProgressChange);
    yAnimation.removeStatusListener(_onProgressStatusChange);
    super.dispose();
  }
}



