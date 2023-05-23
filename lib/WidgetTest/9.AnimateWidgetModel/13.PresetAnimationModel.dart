/*
* PresetAnimationModel created by zhangjiang 
* on 2020/3/30 10:46 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/9.AnimateWidgetModel/11.AnimatedDecorationBoxModel.dart';
import 'package:flutter_app_demo/WidgetTest/9.AnimateWidgetModel/12.CustomImpcilityAnimationModel.dart';

class PresetAnimationModel extends StatefulWidget {
  PresetAnimationModel({Key? key}) : super(key: key);

  @override
  _PresetAnimationModelState createState() => _PresetAnimationModelState();
}

class _PresetAnimationModelState extends State<PresetAnimationModel> {

  //设置各种属性
  double _padding = 20;
  double _left = 20;
  double _height = 60;
  Color _color = Colors.red;
  var _align = Alignment.topRight;
  Color _decorationColor = Colors.blue;
  TextStyle _textStyle = TextStyle(color: Colors.black);
  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 3);
    return Scaffold(
        appBar: AppBar(
          title: Text("预置过渡动画"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: AnimatedPadding(
                  duration: duration,
                  padding: EdgeInsets.all(_padding),
                  child: Text("Padding Test"),
                ),
                onPressed: (){
                  (context as Element).markNeedsBuild();
                  _padding = _padding == 50 ? 20 : 50;
                },
              ),
              SizedBox(
                height: 50,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      duration: duration,
                      left: _left,
                      child: TextButton(
                        child: Text('positioned test'),
                        onPressed: (){
                          (context as Element).markNeedsBuild();
                          _left = _left == 20 ? 80 : 20;
                        },
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: 100,
                color: Colors.green,
                child: AnimatedAlign(
                  duration: duration,
                  alignment: _align,
                  child: TextButton(
                    child: Text("align test"),
                    onPressed: (){
                      (context as Element).markNeedsBuild();
                      _align = _align == Alignment.topRight ? Alignment.center : Alignment.topRight;
                    },
                  ),
                ),
              ),

              AnimatedContainer(
                duration: duration,
                height: _height,
                color: _color,
                child: TextButton(
                  child: Text("container test"),
                  onPressed: (){
                    //不用显式调用setstate
                    (context as Element).markNeedsBuild();
                    _color = _color == Colors.red ? Colors.blue : Colors.red;
                    _height = _height == 100 ? 60 : 100;
                  },
                ),
              ),
              AnimatedDefaultTextStyle(
                duration: duration,
                style: _textStyle,
                child: GestureDetector(
                  onTap: (){
                    (context as Element).markNeedsBuild();
                    _textStyle = TextStyle(
                      color: Colors.red,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.red,
                    );
                  },
                  child: Text("textStyle Model"),
                ) ,
              ),
              ShowAnimationDecorationBox(
                duration: duration,
                decoration: BoxDecoration(color: _decorationColor),
                child: TextButton(
                  child: Text("Decorationmodel"),
                  onPressed: (){
                    (context as Element).markNeedsBuild();
                    _decorationColor = _decorationColor == Colors.red ? Colors.blue : Colors.red;
                  },
                ),
              ),
            ].map((e){
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: e,
              );
            }).toList(),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}