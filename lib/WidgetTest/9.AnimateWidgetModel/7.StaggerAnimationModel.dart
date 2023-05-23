/*
* StaggerAnimationModel created by zhangjiang 
* on 2020-03-11 15:55
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class StaggerAnimationModel extends StatefulWidget {
  StaggerAnimationModel({Key? key}) : super(key: key);

  @override
  _StaggerAnimationModelState createState() => _StaggerAnimationModelState();
}

class _StaggerAnimationModelState extends State<StaggerAnimationModel> with TickerProviderStateMixin {

  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("StaggerAnimationModel"),
        ),
        body: GestureDetector(
          onTap: _playerAnimation,
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(color: Colors.black.withOpacity(0.5)),
              ),
              child: StaggerAnimatedTest(controller: animationController),
            ),
          ),

        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //动画执行方法
  Future<Null> _playerAnimation() async{
    try{
      await animationController.forward().orCancel;
      await animationController.reverse().orCancel;
    }on TickerCanceled{
      //动画被取消
      print("动画取消");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
}


//定义对应的交织动画
class StaggerAnimatedTest extends StatelessWidget {
  StaggerAnimatedTest({Key? key,required this.controller}):super(key:key){
    heightAnimation = Tween(begin: 0.0,end: 300.0).animate(CurvedAnimation(
      parent: controller,
      //间隔，前60%的动画
      curve: Interval(
          0.0,0.6,curve: Curves.ease
      ),
    ));

    colorAnimation = ColorTween(begin: Colors.green,end: Colors.red).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0,0.6, curve: Curves.easeIn,
      ),
    ));

    insetAnimation = Tween<EdgeInsets>(begin: EdgeInsets.only(left: 0.0),
        end: EdgeInsets.only(left: 200.0))
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.6,1.0, curve: Curves.ease),
    ));
  }

  final AnimationController controller;
  late Animation<double?> heightAnimation;
  late Animation<Color?> colorAnimation;
  late Animation<EdgeInsets?> insetAnimation;

  Widget _buildAnimation(BuildContext context,Widget? child) {
    return Container(
      child: Container(
        height: heightAnimation.value,
        color: colorAnimation.value,
        width: 50.0,
      ),
      alignment: Alignment.bottomCenter,
      padding: insetAnimation.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }
}