/*
* AnimatedBuilderModel created by zhangjiang 
* on 2020-03-10 14:22
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class AnimatedBuilderModel extends StatefulWidget {
  AnimatedBuilderModel({Key key}) : super(key: key);

  @override
  _AnimatedBuilderModelState createState() => _AnimatedBuilderModelState();
}

class _AnimatedBuilderModelState extends State<AnimatedBuilderModel> with SingleTickerProviderStateMixin{
  
  Animation<double> animation;
  AnimationController animationController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = new CurvedAnimation(parent: animationController,curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0,end: 300.0).animate(animation)..addListener( (){
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
          title: Text("AnimatedBuilderModel"),
        ),
        body: Center(
//          child:  AnimatedBuilder(
//            animation: animation,
//            child: Image.asset('assets/images/goodnight.jpeg'),
//            builder: (BuildContext context,Widget child){
//              return new Container(
//                child: child,
//                width: animation.value,
//                height: animation.value,
//              );
//            },
//          ),
        //使用自定义的动画组件
          child: GrowTransition(
            animation: animation,
            child: Image.asset("assets/images/goodnight.jpeg"),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
}


//包装AnimatedBuilder
class GrowTransition extends StatelessWidget {
  GrowTransition({Key key,@required this.animation, @required this.child,})
      :assert(animation != null),
       assert(child != null),
        super(key:key);

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: AnimatedBuilder(
        child: child,
        animation: animation,
        builder: (BuildContext context,Widget child){
          return Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}


//继承AnimatedWidget 自定义动画展示，必须实现的是animate和对用的widget
//内部会自动构建对应的animationController执行动画
class CustomAninated extends AnimatedWidget {
  const CustomAninated({
    Key key,
    @required Animation<double> custom,
    this.child
  }):assert(custom != null),
        assert(child != null),
        super(key:key,listenable:custom);

  Animation<double> get custom => listenable;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Transform.rotate(
      angle: custom.value,
      child: child,
    );
  }


}