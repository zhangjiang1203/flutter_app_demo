import 'package:flutter/material.dart';

class BuilderWidgetModel extends StatelessWidget {
  
  
  Future<String> getAsyData() async{
    return Future.delayed(Duration(seconds: 2),(){
      return "我是获取的数据";
    });

  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("BuilderDemo"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getAsyData(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
//  状态设置
//  enum ConnectionState {
//  /// 当前没有异步任务，比如[FutureBuilder]的[future]为null时
//    none,
//    /// 异步任务处于等待状态
//    waiting,
//    /// Stream处于激活状态（流上已经有数据传递了），对于FutureBuilder没有该状态。
//    active,ConnectionState.active只在StreamBuilder中才会出现
//
//    /// 异步任务已经终止.
//    done,
//  }
            if (snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                //请求失败
                return Text("Error:${snapshot.error})");
              }else{
                //展示返回的数据
                return Text("${snapshot.data}");
              }
            }else{
              //可根据需要定制Progress
              return CircularProgressIndicator();
            }
          }
        ),
      ),
    );
  }
}