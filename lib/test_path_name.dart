/*
* test_path_name created by zj 
* on 2020/10/28 3:50 PM
* copyright on zhangjiang
*/

import 'dart:io';

import 'package:flutter/material.dart';
void walk(){


  //获取当前路径信息
  // var path = new Directory(CONVERT_PATH);
  // var path1 = path.absolute("../..").toString() ;//+ "/assets/fonts/iconfont/";// + CLASSNAME + ".css";
  // path1 = path.absolute("");
  //
  // print("当前路径信息===$path1,${path.current.toString()},${path.dirname("icon_font_covert.dart")}");
  //
  var src = new Directory("./jsons");
  List<FileSystemEntity> list = src.listSync();
  list.forEach((element) {
    print("当前文件路径==${element.absolute.path}");
  });

  var directory = new Directory("./jsons");
  // directory.createSync();
  //absolute返回path为绝对路径的Directory对象
  print(directory.absolute.path);

}

void main(){

}