import 'package:flutter/material.dart';

void main(){
  doTask1();
  doTask2();
  doTask3();

  Color blue = Color(0xFF2196F3);
  print(blue.value);
}

void doTask1(){
  print("task1");
}

void doTask2() async{
  await Future.delayed( Duration(seconds: 1),(){
    print("开始执行111");
  });
}

void doTask3(){
  print("doTask3");
}



