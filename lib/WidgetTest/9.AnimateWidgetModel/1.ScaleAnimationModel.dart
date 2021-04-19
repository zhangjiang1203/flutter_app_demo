/*
* ScaleAnimationModel created by zhangjiang 
* on 2020-03-09 12:53
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class ScaleAnimationModel extends StatefulWidget {
  ScaleAnimationModel({Key key}) : super(key: key);

  @override
  _ScaleAnimationModelState createState() => _ScaleAnimationModelState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationModelState extends State<ScaleAnimationModel> with SingleTickerProviderStateMixin {

  Animation<double> scaleAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    animationController = new AnimationController(duration: Duration(seconds: 1),vsync: this);
    //线性动画
    scaleAnimation = new CurvedAnimation(parent: animationController, curve: Curves.easeInQuart);
    scaleAnimation = new Tween(begin: 0.0,end: 300.0).animate(scaleAnimation)..addListener((){
      setState(() {});
      //重复执行该动作
      if (scaleAnimation.value == 300.0){
        animationController.reverse();
      }else if (scaleAnimation.value == 0.0){
        animationController.forward();
      }
    });
    //开始执行动画
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ScaleAnimationModel"),
        ),
        body: Center(
          child: Image.asset("assets/images/goodnight.jpeg",
              width: scaleAnimation.value,
              height: scaleAnimation.value,
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    // TODO: 销毁时释放动画资源
    animationController.dispose();
    super.dispose();
  }
}