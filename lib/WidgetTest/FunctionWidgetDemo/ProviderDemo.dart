import 'package:flutter/material.dart';


//设置一个通用的InheritedWidget
class CommonInheritedWidget<T> extends InheritedWidget {

  CommonInheritedWidget({
    @required this.data,
    Widget child
  }):super(child:child);

  final T data;

  //通用的widget每次都会刷新依赖其的子孙节点的didUpdateDenpendencies方法
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}




class ProviderDemo extends StatefulWidget {
  ProviderDemo({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class _ProviderDemo extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('跨组件状态共享'),
      ),
      body: Center(
        child: Text('摸鱼'),
      ),
    );
  }
}