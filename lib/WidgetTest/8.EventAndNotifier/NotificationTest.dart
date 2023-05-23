/*
* NotificationTest created by zhangjiang 
* on 2020-02-27 23:39
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class NotificationTest extends StatefulWidget {
  NotificationTest({Key? key}) : super(key: key);

  @override
  _NotificationTestState createState() => _NotificationTestState();
}

//class _NotificationTestState extends State<NotificationTest> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text("NotificationTest"),
//        ),
//        body: NotificationListener(
//          onNotification: (notification){
//            switch(notification.runtimeType){
//              case ScrollStartNotification: print("开始滚动");break;
//              case ScrollEndNotification: print("停止滚动");break;
//              case ScrollUpdateNotification:
//                print("正在滚动");
//                break;
//              case OverscrollNotification:print("超过边界");break;
//            }
//          },
//          child: ListView.builder(
//              itemCount: 50,
//              itemBuilder:(context,index){
//                return ListTile(title: Text("我就是${index}",));
//          } ),
//        ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}

//指定监听类型
class _NotificationTestState extends State<NotificationTest> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotificationTest"),
      ),
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification){
          print("滚动的距离===${notification.scrollDelta}");
          return true;
        },
        child: ListView.builder(
            itemCount: 50,
            itemBuilder:(context,index){
              return ListTile(title: Text("我就是${index}",));
            } ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}