/*
* 10.AdvanceAnimatedModel created by zj 
* on 2020/3/24 3:38 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class AdvanceAnimatedModel extends StatefulWidget {
  AdvanceAnimatedModel({Key key}) : super(key: key);
  @override
  _AdvanceAnimatedModelState createState() => _AdvanceAnimatedModelState();
}

class _AdvanceAnimatedModelState extends State<AdvanceAnimatedModel> {

  int count = 0;
  var buttonStrList = ["up","down","left","right"];
  var direction = AxisDirection.down;

  void setIncrementCount(AxisDirection dire){
    setState(() {
      direction = dire;
      count += 1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AdvanceAnimatedModel"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 20),),
              //由于新旧widget执行的动画是相反的，在这个里面实现不了左出右进，只能自定义AnimatedSwitcher
              AnimatedSwitcher(
                child: Text("$count",key: ValueKey<int>(count),style: TextStyle(fontSize: 30)),
                duration: const Duration(seconds: 3),
                transitionBuilder: (Widget child,Animation<double> animation){
                  var tween = Tween<Offset>(begin: Offset(1,0),end: Offset(0,0));
                  return SlideTransition(
                    child: child,
                    position: tween.animate(animation),
                  );
                },
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),),
              //AnimatedSwitcher自定义实现的动画方向
              //对超出范围的widget进行裁剪
              ClipRect(
                child: AnimatedSwitcher(
                  child: Text("$count",key: ValueKey<int>(count),style: TextStyle(fontSize: 30)),
                  duration: const Duration(seconds: 3),
                  transitionBuilder: (Widget child,Animation<double> animation){
                    return MySlideTransition(
                      child: child,
                      direction: direction,
                      position: animation,
                    );
                  },
                ),
              ),
//              Container(
//                width: 80,
//                height: 50,
//                color: Colors.black12,
//                child:
//              ),

//              Wrap(
//                children: buttonStrList.map((e){
//                  return RaisedButton(
//                    key: ValueKey<String>(e),
//                    child: Text(e,style: TextStyle(fontSize: 20),),
//                    onPressed: (){
//
//                      setState(() {
//                        count += 1;
//                      });
//                    },
//                  );
//                }).toList(),
//              ),
              TextButton(
                child: Text("up",style: TextStyle(fontSize: 20),),
                onPressed: ()=>setIncrementCount(AxisDirection.up),
              ),
              TextButton(
                child: Text("down",style: TextStyle(fontSize: 20),),
                onPressed: ()=>setIncrementCount(AxisDirection.down),
              ),
              TextButton(
                child: Text("left",style: TextStyle(fontSize: 20),),
                onPressed: ()=>setIncrementCount(AxisDirection.left),
              ),
              TextButton(
                child: Text("right",style: TextStyle(fontSize: 20),),
                onPressed: ()=>setIncrementCount(AxisDirection.right),
              ),
            ],
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}

class MySlideTransition extends AnimatedWidget {

  MySlideTransition({
    Key key,
    this.child,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down
  }):assert(position != null),super(key:key,listenable:position){
    switch(direction){
      case AxisDirection.down:
        tween = Tween(begin: Offset(0,-1),end: Offset(0,0));
        break;
      case AxisDirection.up:
        tween = Tween(begin: Offset(0,1),end: Offset(0,0));
        break;
      case AxisDirection.left:
        tween = Tween(begin: Offset(1,0),end: Offset(0,0));
        break;
      case AxisDirection.right:
        tween = Tween(begin: Offset(-1,0),end: Offset(0,0));
        break;
    }
  }

  Animation<double> get position => listenable;
  final bool transformHitTests;
  final Widget child;
  final AxisDirection direction;
  //内部处理tween
  Tween<Offset> tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = tween.evaluate(position);

    //执行反向动画的时候
    if (position.status == AnimationStatus.reverse){
      switch(direction){
        case AxisDirection.down:
          offset = Offset(offset.dx,-offset.dy);
          break;
        case AxisDirection.up:
          offset = Offset(offset.dx,-offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx,offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx,offset.dy);
          break;
      }

    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}