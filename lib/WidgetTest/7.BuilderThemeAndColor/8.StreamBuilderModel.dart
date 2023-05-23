import 'package:flutter/material.dart';

class StreamBuilderDemo extends StatelessWidget {
  Stream<int> getStreamData() {
    return Stream.periodic(Duration(seconds: 1),(i){return i;});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamBuilderDemo"),
      ),
      body: Center(
        child: StreamBuilder(
            stream: getStreamData(),
            builder: (context,snapshot){
              if(snapshot.hasError)
                return Text("请求出错");
              switch(snapshot.connectionState){
                case ConnectionState.none:
                  return Text("没有请求");
                case ConnectionState.active:
                  return Text("已有数据${snapshot.data}");
                case ConnectionState.done:
                  return Text("请求完成");
                case ConnectionState.waiting:
                  return Text("请求中");
              }
              return Text("执行");
        }),
      ),
    );
  }
}