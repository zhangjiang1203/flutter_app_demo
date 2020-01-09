import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';


class WillPopScopeDemo extends StatefulWidget {
  WillPopScopeDemo({Key key}) : super(key:key);

  @override
  _WillPopScopeState createState() => _WillPopScopeState();

}

class _WillPopScopeState extends State<WillPopScopeDemo> {
  //记录此刻的时间展示
  DateTime _duration ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("返回拦截"),
      ),
      body: WillPopScope(
        //这是一个异步方法
        onWillPop: () async{
          //两次点击超过一秒重新计算点击的时间间隔
          if (_duration == null || DateTime.now().difference(_duration) > Duration(seconds: 1)) {
            _duration = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("一秒内点击两次才能返回",style: ZJTextStyleTool.black_36,),
        ),

      )
    );
  }
}