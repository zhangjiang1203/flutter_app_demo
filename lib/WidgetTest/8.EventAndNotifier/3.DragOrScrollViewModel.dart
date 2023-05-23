/*
* DragOrScrollViewModel created by zhangjiang 
* on 2020-02-12 13:15
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class DragOrScrollViewModel extends StatefulWidget {
  DragOrScrollViewModel({Key? key,}) : super(key: key);

  @override
  _DragOrScrollViewModelState createState() => _DragOrScrollViewModelState();
}

class _DragOrScrollViewModelState extends State<DragOrScrollViewModel> with SingleTickerProviderStateMixin{

  double topOffset = 0;
  double leftOffset = 0;

  //设置图片的高度
  double width = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("手势拖动"),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              //如果想在某个固定方向修改对应的位移，只设置一个就好
              left: leftOffset,
              top: topOffset,
              child: GestureDetector(
                onPanDown: (DragDownDetails e){
                  print("开始按下按钮${e.globalPosition}");

                },
                onPanUpdate: (DragUpdateDetails e){
                  setState(() {
                    topOffset += e.delta.dy;
                    leftOffset += e.delta.dx;
                  });
                },
                onPanEnd: (DragEndDetails e){
                  //结束时在x y轴上的速度
                  print("按下截止==${e.velocity}");
                },
                child: CircleAvatar(
                  radius: 50,
                  child: Text("我就是我",style: ZJTextStyleTool.white_36,),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onScaleEnd: (ScaleEndDetails e){
                  print("放缩结束${e.velocity}");
                },
                onScaleStart: (ScaleStartDetails e){
                  print("开始放缩");
                },
                onScaleUpdate: (ScaleUpdateDetails e){
                  setState(() {
                    //放大倍数在0.5 到 2 倍之间
                    width = 300 * e.scale.clamp(0.5, 10.0);
                  });
                },
                child: Image.asset("assets/images/star_name.png",width: width,),
              ),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}