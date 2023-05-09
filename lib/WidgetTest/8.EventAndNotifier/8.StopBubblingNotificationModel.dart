/*
* StopBubblingNotificationModel created by zhangjiang 
* on 2020-03-08 22:02
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/8.EventAndNotifier/7.CustomNotificationModel.dart';

class StopBubblingNotificationModel extends StatefulWidget {
  StopBubblingNotificationModel({Key key}) : super(key: key);

  @override
  _StopBubblingNotificationModelState createState() =>
      _StopBubblingNotificationModelState();
}

class _StopBubblingNotificationModelState
    extends State<StopBubblingNotificationModel> {

  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("StopBubblingNotificationModel"),
        ),
        body: NotificationListener(
          onNotification: (ontification){
            return false;
          },
          child: NotificationListener<CustomNotification>(
            onNotification: (notification){
              setState(() {
                _msg += notification.msg + ' ' + notification.name;
              });
              //设置为false为不阻止冒泡，在父节点依然可以收到通知
              //子NotificationListener的onNotification回调返回了false，表示不阻止冒泡，所以父NotificationListener仍然会受到通知，
              return false;
            },
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Builder(builder: (context){
                    return TextButton(
                      child: Text("点我开始测试"),
                      onPressed: (){
                        //通知分发
                        CustomNotification('我就是我','哈哈哈').dispatch(context);
                      },
                    );
                  }),
                  Text(_msg),
                ],
              ),
            ),
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}