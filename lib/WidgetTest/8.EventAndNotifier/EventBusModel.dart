/*
* EventBusModel created by zhangjiang 
* on 2020-02-17 22:58
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class EventBusModel extends StatefulWidget {
  EventBusModel({Key? key}) : super(key: key);

  @override
  _EventBusModelState createState() => _EventBusModelState();
}

class _EventBusModelState extends State<EventBusModel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("EventBusModel"),
        ),
        body: Center(
          child: Column(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//构造bus总线
typedef void EventCallBack(avg);

class EventBusTest {

  //构造单例
  EventBusTest.__internal();

  //Dart中实现单例模式的标准做法就是使用static变量+工厂构造函数的方式，这样就可以保证new EventBus()始终返回都是同一个实例
  //添加事件单例
  static EventBusTest _singleton = new EventBusTest();
  //工厂方法
  factory EventBusTest() => _singleton;

  //保存事件订阅者的队列，key为事件名，value为对应事件的订阅者队列
  var _emap = new Map<Object,List<EventCallBack>>();

  //添加观察者和移除观察者
  void on(eventName,EventCallBack f){
    //添加观察者
    if(eventName == null || f == null) return;
    _emap[eventName] ??= <EventCallBack>[];
    _emap[eventName]?.add(f);
  }

  //移除
  void off(eventName,[EventCallBack? f]){
    var listValue = _emap[eventName];
    if(eventName == null || listValue == null) return;
    if(f != null){
      //移除一个子集
      listValue.remove(f);
    }
  }

  //发送通知,触发事件后，该事件所有订阅者都会被触发
  void emit(eventName,[arg]){
    var list = _emap[eventName];
    if(list == null) return;
    int length = list.length - 1;
    //反向遍历，防止回调者在执行中移除自己带来的下标错误
    for (var i = length ; i>=0; --i){
      //传入参数 开始调用
      list[i](arg);
    }
  }
}

//定义一个全局的top-level,引入头文件就可以使用bus
var bus = new EventBusTest();


/*简单的最要示例*/
////页面A中
////监听登录事件
//bus.on("login", (arg) {
//// do something
//});
//
////登录页B中
////登录成功后触发登录事件，页面A中订阅者会被调用
//bus.emit("login", userInfo);