/*
* CustomPaintTestModel created by zhangjiang 
* on 2020/4/8 10:11 PM
* copyright on zhangjiang
*/

import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//棋盘的横竖线条
const double ChessCountLine = 15;
//棋盘的大小
const double ChessBoardW = 330;
//线条之前的间距
const double ChessLinePadding = (ChessBoardW - 30) / ChessCountLine;
//棋子大小
const double ChessRadius = ChessLinePadding/2 - 2;

class CustomPaintTestModel extends StatefulWidget {
  CustomPaintTestModel({Key? key}) : super(key: key);

  @override
  _CustomPaintTestModelState createState() => _CustomPaintTestModelState();
}

class _CustomPaintTestModelState extends State<CustomPaintTestModel> {
  // 记录点击的位置信息
  List<Offset> pointSetList = [];

  void dealPointerInChessBoard(Offset pointSet){
    //限制点击的范围
    if(pointSet.dx < (15 - ChessRadius) || pointSet.dx > (315 + ChessRadius) || pointSet.dy < (15 - ChessRadius) || pointSet.dy > (315 + ChessRadius)){
      showCustomSizeLoadingDialogView("请在棋盘上点击");
      return;
    }
    //计算点击位置在棋盘上的点,在减去对应的棋子的半径，就是对应的绘制棋子真实的point,要向上取整
    double cx = (pointSet.dx / ChessLinePadding).ceil() * ChessLinePadding - ChessRadius/2;
    double cy = (pointSet.dy / ChessLinePadding).ceil() * ChessLinePadding - ChessRadius/2;
    //判断数组中是否含有对应的point
    if (pointSetList.contains(Offset(cx,cy))){
      showCustomSizeLoadingDialogView("不能在同一位置重复添加棋子");
      return;
    }
    pointSetList.add(Offset(cx,cy));
    (context as Element).markNeedsBuild();

  }

  //展示对应的错误信息
  void showCustomSizeLoadingDialogView(String message){
    showDialog(
      context:context,
      barrierDismissible: false,
      builder: (context){
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 350,
            height: 100,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.error),
                  Padding(padding: EdgeInsets.only(top: 10),),
                  Text(message),
                ],
              ),
            ),
          ),
        );
      },
    );
    Future.delayed(Duration(seconds: 2),(){
      //对话框消失
      Navigator.of(context).pop();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CustomPaintTestModel"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("我就是棋盘",style: TextStyle(fontSize: 28,color: Colors.blueAccent),),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),),
              GestureDetector(
                onTapUp: (TapUpDetails e){
                  //添加点击的点的位置到数组中更新pointer
                  dealPointerInChessBoard(e.localPosition);
                },
                child: CustomPaint(
                  size: Size(330, 330),
                  painter: CheckerBoardModel(),
                  foregroundPainter: ChessPiecesModel(piecesList: pointSetList),
                ),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




class CheckerBoardModel extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //绘制背景
    var paint = Paint()..isAntiAlias = true
      ..color = Color(0x77cdb175)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, paint);

    //绘制棋盘
    paint..strokeWidth = 1
         ..color = Colors.black87
         ..style = PaintingStyle.stroke;

    for(int i = 0; i <= ChessCountLine ; i++) {
      double dy = ChessLinePadding * i + 15;
      canvas.drawLine(Offset(15,dy), Offset(size.width-15,dy), paint);
    }

    for(int i = 0; i <= ChessCountLine ; i++) {
      double dx = ChessLinePadding * i + 15;
      canvas.drawLine(Offset(dx,15), Offset(dx,size.height-15), paint);
    }
  }

  //棋盘不用每次都更新
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

//绘制棋子
class ChessPiecesModel extends CustomPainter {
  ChessPiecesModel({
      required this.piecesList,
  });
  //绘制棋盘的位置
  final List piecesList;

  @override
  void paint(Canvas canvas, Size size) {
    if(piecesList.length <= 0) {
      return;
    }
    var paint = Paint();
    paint.style = PaintingStyle.fill;
    for(int i = 0; i < piecesList.length ; i++) {
      paint.color = i % 2 == 0 ? Colors.white : Colors.black;
      canvas.drawCircle(piecesList[i], ChessRadius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
