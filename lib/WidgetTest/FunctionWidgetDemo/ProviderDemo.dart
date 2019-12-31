import 'package:flutter/material.dart';


//设置一个通用的InheritedWidget,保存跨组件的状态数据
class CommonInheritedProvider<T> extends InheritedWidget {

  CommonInheritedProvider({
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




//获取模板类型
Type _typeOf<T>() => T;
//添加notificationProvider
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {

  ChangeNotifierProvider({Key key,
                          this.data,
                          this.child}) : super(key:key);

  final Widget child;
  final T data;

  //定义一个便捷的方法访问widget树中的共享数据
  static T of<T>(BuildContext context) {
    final type = _typeOf<CommonInheritedProvider<T>>();
    final provider = context.inheritFromWidgetOfExactType(type) as CommonInheritedProvider<T>;
    return provider.data;

  }

  @override
  _ChangeNotifierProviderState<T> createState() => _ChangeNotifierProviderState<T>();

}


class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {

  void update(){
    //如果数据发生变化（model类调用了notifyListeners），重新构建 CommonInheritedProvider
    setState(() {

    });
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    // TODO: implement didUpdateWidget
    if(widget.data != oldWidget.data){
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('跨组件状态共享'),
      ),
      body: CommonInheritedProvider(
        data: widget.data,
        child: widget.child,
      )
    );
  }
}