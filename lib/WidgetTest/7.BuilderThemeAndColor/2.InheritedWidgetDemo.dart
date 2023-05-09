import 'package:flutter/material.dart';

//定义一个共享状态
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    @required this.data,
    Widget child
    }):super(child:child);

  //子widget中需要的共享数据
  final int data;

  //定义一个静态方法，方便子树中的widget调取对象
  static ShareDataWidget of(BuildContext context) {

    return context.findAncestorWidgetOfExactType<ShareDataWidget>();
    // return context.inheritFromWidgetOfExactType(ShareDataWidget);
    //context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget方法不用调用
    //updatedependencies方法
    //可以看到inheritFromElement方法中主要是注册了依赖关系！看到这里也就清晰了，调用inheritFromWidgetOfExactType()
    //和 ancestorInheritedElementForWidgetOfExactType()的区别就是前者会注册依赖关系，而后者不会，所以在调用inheritFromWidgetOfExactType()时，
    //InheritedWidget和依赖它的子孙组件关系便完成了注册，之后当InheritedWidget发生变化时，就会更新依赖它的子孙组件，
    //也就是会调这些子孙组件的didChangeDependencies()方法和build()方法。而当调用的是 ancestorInheritedElementForWidgetOfExactType()时，
    //由于没有注册依赖关系，所以之后当InheritedWidget发生变化时，就不会更新相应的子孙Widget。

    //注意，如果将上面示例中ShareDataWidget.of()方法实现改成调用ancestorInheritedElementForWidgetOfExactType()，运行示例后，点击"Increment"按钮，会发
    //现__TestWidgetState的didChangeDependencies()方法确实不会再被调用，但是其build()仍然会被调用！造成这个的原因其实是，
    //点击"Increment"按钮后，会调用_InheritedWidgetTestRouteState的setState()方法，此时会重新构建整个页面，由于示例中，
    //__TestWidget 并没有任何缓存，所以它也都会被重新构建，所以也会调用build()方法。
  }

  //当data发生变化时，是否要通知子树中依赖data的widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用”
    return oldWidget.data != data;
  }

}

//实现一个子widget
class TextWidgetDemo extends StatefulWidget {
  TextWidgetDemo({Key key}) : super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextWidgetState();
  }
}

class _TextWidgetState extends State<TextWidgetDemo> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("开始刷新");
    return Text(
      ShareDataWidget.of(context).data.toString()
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");

  }
}


//主要界面展示
class InheritedWidgetDemo extends StatefulWidget {
  InheritedWidgetDemo({Key key}) : super(key:key);

  @override
  _InheritedWidgetState createState() => _InheritedWidgetState();

}


class _InheritedWidgetState extends State<InheritedWidgetDemo> {
  //定义保存的值
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('数据共享'),
      ),
      body: ShareDataWidget(
        data: count,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                //子widget中依赖ShareDataWidget
                child: TextWidgetDemo(),
              ),
              TextButton(
                child: Text("Inherited"),
                //重新刷新build方法
                onPressed: ()=> setState(()=> ++count),
              ),

            ],
          ),
        )
      ),
    );
  }
}



