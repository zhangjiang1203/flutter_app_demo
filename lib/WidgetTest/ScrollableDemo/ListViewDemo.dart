import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String tempStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(title: Text("ListViewDemo"),),
      //添加滚动条
      body: ListView(
        children: tempStr.split("").map((e)=>Text(e,textScaleFactor: 2,)).toList(),
      ),
    );
  }
}