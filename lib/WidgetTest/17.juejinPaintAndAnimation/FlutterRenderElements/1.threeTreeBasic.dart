/**
 * @author[zhangjiang]
 * @version[创建日期，2022/10/12 16:31]
 * @function[功能简介 ]
 **/

import 'dart:async';

import 'package:flutter/material.dart';

class ThreeTreeBasic extends StatefulWidget {
  ThreeTreeBasic({Key? key}) : super(key: key);

  @override
  State<ThreeTreeBasic> createState() => _ThreeTreeBasicState();
}

class _ThreeTreeBasicState extends State<ThreeTreeBasic> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }


  /// 测试数据
  static void runTime(void Function() callback){
    new Timer(Duration.zero,callback);
  }
}





void main(){
  //测试数据
  print("1");

  Timer.run(() {
    print("2");
  });

  print(3);
}