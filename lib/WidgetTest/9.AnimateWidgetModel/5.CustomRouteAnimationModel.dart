/*
* CustomRouteAnimationModel created by zhangjiang 
* on 2020-03-11 10:18
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/9.AnimateWidgetModel/TestPushAnimationModel.dart';

class CustomRouteAnimationModel extends StatefulWidget {
  CustomRouteAnimationModel({Key key}) : super(key: key);

  @override
  _CustomRouteAnimationModelState createState() =>
      _CustomRouteAnimationModelState();
}

class _CustomRouteAnimationModelState extends State<CustomRouteAnimationModel> {

  final Duration timer = new Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CustomRouteAnimationModel"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text("fadeTransition"),
                onPressed: (){
                  //跳转到新的路由
                  Navigator.push(context,
                      PageRouteBuilder(
                          transitionDuration: timer,
                          pageBuilder: (BuildContext context,Animation animation,Animation secondaryAnimation){
                            return new FadeTransition(opacity: animation,child: TestPushAnimationModel(),);
                          }));
                },
              ),
              TextButton(
                child: Text('SizeTransition'),
                onPressed: (){
                  Navigator.push(context,
                      PageRouteBuilder(
                          transitionDuration: timer,
                          pageBuilder: (BuildContext context,Animation animation,Animation secondaryAnimation){
                            return new SizeTransition(sizeFactor: animation,child: TestPushAnimationModel(),);
                          }
                      ));
                },
              ),

              TextButton(
                child: Text('ScaleTransition'),
                onPressed: (){
                  Navigator.push(context,
                      PageRouteBuilder(
                          transitionDuration: timer,
                          pageBuilder: (BuildContext context,Animation animation,Animation secondaryAnimation){
                            return new ScaleTransition(scale: animation,child: TestPushAnimationModel(),);
                          }
                      ));
                },
              ),

              TextButton(
                child: Text('customTransition'),
                onPressed: (){
                  Navigator.push(context,
                      MySelfPageRouter(builder: (context){
                        return TestPushAnimationModel();
                      }));
                },
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



//自定义继承pagerouter,实现下面的特定方法，进行对应的方法和属性设置
class MySelfPageRouter extends PageRoute {
  MySelfPageRouter({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;


  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    //返回的时候不展示动画，使用isActive这个属性去判断
    if (isActive){
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    }else{
      return Padding(padding: EdgeInsets.zero,);
    }

  }
}