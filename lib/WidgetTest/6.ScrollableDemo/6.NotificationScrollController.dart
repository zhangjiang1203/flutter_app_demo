import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJColorsTool.dart';


class NotificationScrollController extends StatefulWidget {

  NotificationScrollController({Key? key}) : super(key:key);
  _NotificationScrollControllerState createState() => new _NotificationScrollControllerState();
}


class _NotificationScrollControllerState extends State<NotificationScrollController> {

  //记录当前的滚动位置的百分比
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动通知"),

      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification){
            double progress = notification.metrics.pixels/notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            return true;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemBuilder: (context,index){
                  return ListTile(title: Text("测试数据$index"),);
                },
                itemExtent: 40,
                itemCount: 100,
              ),
              Positioned(
                top: 20,
                right: 30,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0x66000000),
                  child: Text(_progress,style: ZJTextStyleTool.white_24,),
                ),
              ),
              //居中显示
              CircleAvatar(
                radius: 30,
                backgroundColor: Color(0x66000000),
                child: Text(_progress,style: ZJTextStyleTool.white_24,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}