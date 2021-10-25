/*
* AnimationSwitcherModel created by zhangjiang 
* on 2020-03-16 10:32
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class AnimationSwitcherModel extends StatefulWidget {
  AnimationSwitcherModel({Key key}) : super(key: key);

  @override
  _AnimationSwitcherModelState createState() => _AnimationSwitcherModelState();
}

class _AnimationSwitcherModelState extends State<AnimationSwitcherModel> {
  //实现点击 数字增加，期间数字由大变小的动画
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimationSwitcherModel"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (Widget child,Animation<double> animation){
                  return ScaleTransition(child: child,scale: animation,);
                },
                child: Text('$_count',
                  //显示的指定key,不同的key被认为是不同的widget,这样才能执行动画
                  key: ValueKey<int>(_count),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    _count += 1;
                  });
                },
                child: Text('点击修改数据'),
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}