/*
* 03.test_transform_model created by zj 
* on 2020/12/3 5:46 PM
* copyright on zhangjiang
*/

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/part_refresh_widget/single_data_line.dart';

class TestTransformModel extends StatefulWidget {
  @override
  _TestTransformModelState createState() => _TestTransformModelState();
}

class _TestTransformModelState extends State<TestTransformModel> with MultDataLine{

  double rotateX = 0;
  double rotateY = 0;

  double translateX = 0;
  double translateY = 0;

  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("transform变换"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getObserver("rotate").addObserver(initValue: 0,builder: (context,data){
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(rotateX)..rotateY(rotateY)..setEntry(3, 2, 0.0001),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      print("开始点击");
                    },
                    onPanUpdate: (details){
                      print("当前偏移的点===${details.delta.dx}==${details.delta.dy}");
                      rotateX += details.delta.dx * 0.01;
                      rotateY += details.delta.dy * -0.01;
                      getObserver("rotate").setData(0);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      height: 80,
                      width: 80,
                      child: Text('开始3D变化'),
                    ),
                  ),
                );
              }),
              //超出区域之后无法拖动
              getObserver("translate").addObserver(initValue: 0.0,builder: (context,data){
                return Transform.translate(
                  offset: Offset(translateX,translateY),
                  child: GestureDetector(
                    onPanUpdate: (details){
                      getObserver("translate").setData(0);
                      print("当前偏移===${details.delta.dx}==${details.delta.dy}");
                      translateX += details.delta.dx;
                      translateY += details.delta.dy;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      height: 80,
                      width: 80,
                      child: Text('平移变换'),
                    ),
                  ),
                );
              }),
              getObserver("scale").addObserver(initValue: 0.0,builder: (context,data){
                return Transform.scale(
                  scale: scale,
                  child: GestureDetector(
                    onTap: (){
                      scale = scale * Random().nextDouble() + 0.2;
                      print("缩小变换===$scale");
                      getObserver("scale").setData(0.0);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      height: 80,
                      width: 80,
                      child: Text('放大缩小'),
                    ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(height: 10,),
          //设置图片翻页展示动画
          FlipUpMultiDemo(
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.blue,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.red,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.green,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.yellow,
              ),
            ],
          ),

          SizedBox(height: 20,),
          Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.red,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.lightBlue,
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateX(40*pi/180),
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 150,
                  color: Colors.greenAccent,
                  child: Text('测试动画'),
                )
              ),

            ],
          ),
        ],
      ),
    );
  }
}

class FlipUpMultiDemo extends StatefulWidget {
  FlipUpMultiDemo({Key? key,required this.children}):super(key: key);

  List<Widget> children;

  @override
  State<StatefulWidget> createState() => _FlipUpMultiDemoState();
}

class _FlipUpMultiDemoState extends State<FlipUpMultiDemo> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation1;
  late Animation _animation2;

  late AnimationController _reverseAnimationController;
  late Animation _reverseAnimation1;
  late Animation _reverseAnimation2;

  late Timer _timer;

  double rotateX = 0;
  double reverseRotateX = - pi/2.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 5),vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
        }
        print("当前动画的执行状态===$status");
      })..addListener(() {
        setState(() {});
      });
    _animation1 = Tween(begin: .0,end: pi/2.0).animate(CurvedAnimation(parent: _animationController,curve: Interval(0.0,0.5)));
    _animation2 = Tween(begin: - pi/2.0,end: 0.0).animate(CurvedAnimation(parent: _animationController,curve: Interval(0.5,1.0)));
    _animationController.forward();


    _reverseAnimationController = AnimationController(duration: Duration(seconds: 5),vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
        }
        print("当前动画的执行状态===$status");
      })..addListener(() {
        setState(() {});
      });
    _reverseAnimation1 = Tween(begin: .0,end: -pi/2.0).animate(CurvedAnimation(parent: _reverseAnimationController,curve: Interval(0.0,0.5)));
    _reverseAnimation2 = Tween(begin: - pi/2.0,end: 0.0).animate(CurvedAnimation(parent: _reverseAnimationController,curve: Interval(0.5,1.0)));
    _reverseAnimationController.forward();

  }


  @override
  void dispose() {
    _animationController.dispose();
    _reverseAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("当前展示的值===${_animation1.value}==${_animation2.value}");
    return Stack(
      children: widget.children.asMap().keys.map((e) {
        int index = e;
        if(index + 1 >= widget.children.length){
          index = 0;
        }
        Widget backWidget = widget.children[index];
        Widget frontWidget = widget.children[index+1];
        //创建小clip
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                 GestureDetector(
                    onTap: ()=> _reverseAnimationController.reverse(),
                    child: Transform(
                      alignment: Alignment.centerRight,
                      transform: Matrix4.identity()..setEntry(3, 2, 0.003)..rotateY(_reverseAnimation2.value),
                      child: ClipRect(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          widthFactor: 0.5,
                          child: backWidget,
                        ),
                      ),
                    ),
                  ),
                GestureDetector(
                  onTap: ()=> _animationController.reverse(),
                  child: Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()..setEntry(3, 2, 0.003)..rotateY(_animation2.value),
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.5,
                        child: frontWidget,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 5,),
            Stack(
              children: [
                GestureDetector(
                  onTap: ()=> _reverseAnimationController.reverse(),
                  child: Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()..setEntry(3, 2, 0.003)..rotateY(_reverseAnimation1.value),
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.5,
                        child: frontWidget,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _animationController.forward(),
                  child: Transform(
                    transform: Matrix4.identity()..setEntry(3, 2, 0.003)..rotateY(_animation1.value),
                    alignment: Alignment.centerLeft,
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.centerRight,
                        widthFactor: 0.5,
                        child: backWidget,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      }).toList(),
    );
    return Stack(
      children: widget.children.map((e) => Row(
        children: [
          GestureDetector(
            onTap: (){
              print("开始点击");
              _animationController.reverse();
            },
            child: Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()..setEntry(3, 2, 0.003)..rotateY(_animation2.value),
              child: ClipRect(
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.5,
                  child: e,
                ),
              ),
            )
          ),
          GestureDetector(
            onTap: (){
              print("开始点击1221");
              _animationController.forward();
            },
            child: Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()..setEntry(3, 2, 0.003)..rotateY(_animation1.value),
              child: ClipRect(
                child: Align(
                  widthFactor: 0.5,
                  alignment: Alignment.centerRight,
                  child: e,
                ),
              ),
            )
          ),
        ],
      )).toList(),
    );
  }
}
