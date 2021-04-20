//
//  01.testApp
//  flutter_app_demo
//
//  Created by zhangjiang on .
//  Copyright © flutter_app_demo. All rights reserved.


import 'package:flutter/material.dart';

/*
dart 在语法分析的时候已经开始对代码进行了测试，你也可以自己手动启动
flutter analyze


2.使用flutter run 启动应用程序。当程序运行时 打开对应的 Observatory Url对应的WEB界面，单步查看程序
3.语句级的单步调试
debugger() 采用一个可选的when 参数，指定该参数仅在特停条件为真的中断：
void someFunc(double offset){
  debugger(when: offset > 30.0);
}

输出到对应的控制台
print
debugprint() 输出限制在一个级别，避免被android内核丢弃
flutter logs


转存  widgets库的状态， 请调用debugDumpApp() ，只要程序构建了一次(在build方法之后的任何时间都可以调用)

渲染层 设置 debugFullProperties() 设置
* */