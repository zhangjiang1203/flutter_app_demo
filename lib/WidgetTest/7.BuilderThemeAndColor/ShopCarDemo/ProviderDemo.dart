import 'package:flutter/material.dart';


//设置一个通用的InheritedWidget,保存跨组件的状态数据，就是对之前的子widget做一个缓存处理
class CommonInheritedProvider<T> extends InheritedWidget {

  CommonInheritedProvider({
    required this.data,
    required Widget child
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

  ChangeNotifierProvider({Key? key,
                          required this.data,
                          required this.child}) : super(key:key);

  final Widget child;
  final T data;

  //定义一个便捷的方法访问widget树中的共享数据,设置listen默认值为true
  static T of<T>(BuildContext context,{bool listener = true}) {
    print("widget====值==$listener");
    final type = _typeOf<CommonInheritedProvider<T>>();
    final provider = listener ? context.findAncestorWidgetOfExactType() as CommonInheritedProvider<T>
        : context.getElementForInheritedWidgetOfExactType()?.widget as CommonInheritedProvider<T>;
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
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //移除对应的listener
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  CommonInheritedProvider(
        data: widget.data,
        child: widget.child,
      );
  }
}

