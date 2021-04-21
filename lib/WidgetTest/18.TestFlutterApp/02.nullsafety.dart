//
//  03.nullsafety
//  flutter_app_demo
//
//  Created by zhangjiang on .
//  Copyright © flutter_app_demo. All rights reserved.

import 'package:flutter/material.dart';


// 1.全局变量和静态变量声明必须初始化
int topLevel = 0;
class SomeClass {
  static int showLevel = 3;

  //2.实例变量直接声明时初始化或者通过构造器来初始化
  int atDec = 0;
  int formal;
  int showList;

  String notAString;


  SomeClass(this.formal);


  //3.局部变量时候时候都可以赋值，使用之前必须确定已经赋值
  //4.命名参数必须有默认值或者设置request关键字修饰



//null safety 执行设置
/*
* 1.dart migrate
* 2.flutter pub putdated --mode=null-safety  查看不支持null-safety的类库
* */


}