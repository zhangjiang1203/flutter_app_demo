/*
* GestureCompeteAndConflict created by zhangjiang 
* on 2020-02-17 00:14
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class GestureCompeteAndConflict extends StatefulWidget {
  GestureCompeteAndConflict({Key key}) : super(key: key);

  @override
  _GestureCompeteAndConflictState createState() =>
      _GestureCompeteAndConflictState();
}

class _GestureCompeteAndConflictState extends State<GestureCompeteAndConflict> {

  double _top1 = 0;
  double _top2 = 100;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GestureCompeteAndConflict"),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: _top1,
              left: _left,
              width: 100,
              height: 100,
              //只会在一个防线进行移动，不会再多个方向进行移动，首次移动是看点击的时候在水平方向和竖直方向上那个的偏移量大在那个方向移动
              child: GestureDetector(
                onHorizontalDragUpdate: (DragUpdateDetails e){
                  setState(() {
                    _left += e.delta.dx;
                  });
                },
                //hor verend这个方法会和下面的onTapUp手势相冲突，之后响应verend和horend这两个方法
                onHorizontalDragEnd: (DragEndDetails e){
                  print("Hor end");
                },
                onVerticalDragEnd: (DragEndDetails e){
                  print("Ver end");
                },
                onVerticalDragUpdate: (DragUpdateDetails e){
                  setState(() {
                    _top1 += e.delta.dy;
                  });
                },
                onTapDown: (e){
                  print("开始按下");
                },
                onTapUp: (e){
                  print("手势抬起");
                },
                child: CircleAvatar(
                  child: Text("我就是你"),
                ),
              ),
            ),
            Positioned(
              top: _top2,
              left: 100,
              //使用listener来避免手势冲突带来的方法不响应的
              child: Listener(
                onPointerDown: (details){
                  print("手势按下");
                },
                onPointerUp: (details){
                  print("手势抬起");
                },
                child: GestureDetector(
                  onVerticalDragEnd: (detail){
                    print("拖动结束");
                  },
                  onVerticalDragUpdate: (DragUpdateDetails e){
                    setState(() {
                      _top2 += e.delta.dy;
                    });

                  },
                  child: CircleAvatar(
                    radius: 50,
                    child:Text("我据实我"),
                  ),
                ),
              ),
            ),
            ],
        )
    );
  }
}