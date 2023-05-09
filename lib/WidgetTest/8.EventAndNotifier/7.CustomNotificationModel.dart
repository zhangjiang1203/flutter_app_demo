/*
* CustomNotificationModel created by zhangjiang 
* on 2020-03-08 00:00
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class CustomNotificationModel extends StatefulWidget {
  CustomNotificationModel({Key key}) : super(key: key);

  @override
  _CustomNotificationModelState createState() =>
      _CustomNotificationModelState();
}

class _CustomNotificationModelState extends State<CustomNotificationModel> {

  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CustomNotificationModel"),
        ),
        body: NotificationListener<CustomNotification>(
          onNotification: (notification){
            setState(() {
              _msg += notification.msg + " " + notification.name;
            });
            return true;
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Builder(builder: (context){
                  return TextButton(
                    onPressed: (){
                      //dispatch函数用来分发方法 展示实现逻辑
                      CustomNotification("你好","我就是我").dispatch(context);
                    },
                    child: Text("点击我看一看"),
                  );
                }),
                Text(_msg),
              ],
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class CustomNotification extends Notification {

  CustomNotification(this.msg,this.name);
  //添加自定义的字段
  final String msg;
  final String name;
}