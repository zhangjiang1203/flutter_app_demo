import 'dart:math' as math;

import 'package:flutter/material.dart';


class ZJColor {
  //静态使用方法
  ZJColor._();

  static Color randomColor(){
    math.Random random = math.Random();
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
//    print("输出的颜色值$r,$g,$b");
    return Color.fromARGB(255, r, g, b);
  }





}