/*
* GestureDetectorModel created by zhangjiang 
* on 2020-02-11 23:21
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class GestureDetectorModel extends StatefulWidget {
  GestureDetectorModel({Key key,}) : super(key: key);
//  final String title;

  @override
  _GestureDetectorModelState createState() => _GestureDetectorModelState();
}

class _GestureDetectorModelState extends State<GestureDetectorModel> {

  String gestureStyle = "当前手势";
  @override
  void initState() {
    // TODO: implement initState
//    widget.title = "手势识别";
    super.initState();
  }

  //修改对应的展示数据
  void setOperation(String str){
    setState(() {
      gestureStyle = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("手势识别"),
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
            //onTap和onDoubleTap同时存在的时候，响应onTap会有200ms的延迟
            //如果只是监听了onTap就没有延迟
              onTap: ()=>setOperation("开始点击"),
              onDoubleTap: ()=>setOperation("开始双击"),
              onLongPress: ()=>setOperation("长按"),
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 200,
                  height: 200,
                  child: Text(gestureStyle,style: ZJTextStyleTool.white_40,),
              ),
            ),
          ],
        ),
    );
  }
}