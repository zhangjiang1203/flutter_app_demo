/*
* AnimatedStatusModel created by zhangjiang 
* on 2020-03-11 09:52
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/9.AnimateWidgetModel/3.AnimatedBuilderModel.dart';

class AnimatedStatusModel extends StatefulWidget {
  AnimatedStatusModel({Key? key}) : super(key: key);

  @override
  _AnimatedStatusModelState createState() => _AnimatedStatusModelState();
}

class _AnimatedStatusModelState extends State<AnimatedStatusModel> with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    animationController = new AnimationController(duration: const Duration(seconds: 1),vsync: this);
    animation = new CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animation = new Tween(begin: 0.0,end: 300.0).animate(animation);

//    dismissed	动画在起始点停止
//    forward	动画正在正向执行
//    reverse	动画正在反向执行
//    completed	动画在终点停止

    animation.addStatusListener((AnimationStatus status){
      if(status == AnimationStatus.completed){
        animationController.reverse();
      }else if (status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimatedStatusModel"),
        ),
        body: GrowTransition(animation: animation,child: Image.asset("assets/images/goodnight.jpeg"),),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}