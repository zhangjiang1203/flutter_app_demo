/*
* AnimatedWidgetModel created by zhangjiang 
* on 2020-03-10 11:18
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class AnimatedWidgetModel extends StatefulWidget {
  AnimatedWidgetModel({Key key}) : super(key: key);

  @override
  _AnimatedWidgetModelState createState() => _AnimatedWidgetModelState();
}

class _AnimatedWidgetModelState extends State<AnimatedWidgetModel> with SingleTickerProviderStateMixin{

  Animation<double> animation ;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(duration:const Duration(seconds: 1),vsync: this);
    animation = new Tween(begin: 0.0,end: 300.0).animate(animationController)..addListener((){
      //不需要显示的调用setstate方法进行rebuild
      if (animation.value == 300.0){
        animationController.reverse();
      }else if (animation.value == 0.0){
        animationController.forward();
      }
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimatedWidgetModel"),
        ),
        body: AnimatedImage(animation: animation,)// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
}


//使用animatedWidget构建对应的动画UI
// 若果使用多组动画的话，要使用多个widget，在使用上不是很方便
class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key,Animation<double> animation}) : super(key:key,listenable:animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animate = listenable;
    return Center(
      child: Image.asset('assets/images/goodnight.jpeg',width: animate.value,height: animate.value,),
    );
  }

}