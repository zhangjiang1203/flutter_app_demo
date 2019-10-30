//import 'package:flutter/material.dart';
//task() async {
//  try{
//    String id = await login();
//    String userInfo = await getUserInfo();
//    await saveUserInfo(userInfo);
//  } catch(e){
//    //错误处理
//  }
//}

//await必须用在async函数中，Future函数的返回值都是Future类型，使用链式函数进行调用，then方法防治进入回调地狱