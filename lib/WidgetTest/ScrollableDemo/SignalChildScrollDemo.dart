import 'package:flutter/material.dart';

class SignalScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String tempStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: tempStr.split("").map((e){
              return Text(e,style: TextStyle(color: Colors.blue),);
            }).toList(),
          ),
        ),
      ),
    );
  }
}