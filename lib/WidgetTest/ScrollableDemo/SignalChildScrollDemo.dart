import 'package:flutter/material.dart';

class SignalScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String tempStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(title: Text("scrollView"),),
      //添加滚动条
      body: Scrollbar(
        //单个的滚动视图
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //遍历添加多个子控件
              children: tempStr.split("").map((e){
                return Text(e,style: TextStyle(color: Colors.blue),textScaleFactor: 2,);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}