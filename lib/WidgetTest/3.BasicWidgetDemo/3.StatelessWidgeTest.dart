import 'package:flutter/material.dart';

/*
* 按照惯例，widget的构造函数参数应使用命名参数，命名参数中的必要参数要添加@required标注，
* 这样有利于静态代码分析器进行检查。另外，在继承widget时，第一个参数通常应该是Key，
* 另外，如果Widget需要接收子Widget，
* 那么child或children参数通常应被放在参数列表的最后。
* 同样是按照惯例，Widget的属性应尽可能的被声明为final，防止被意外改变。
* */

class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor:Colors.blue,

  }) : super (key:key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

/*
* 一个StatefulWidget类会对应一个State类，State表示与其对应的StatefulWidget要维护的状态，State中的保存的状态信息可以：
     在widget 构建时可以被同步读取。
     在widget生命周期中可以被改变，当State被改变时，可以手动调用其setState()方法通知Flutter framework状态发生改变，
* Flutter framework在收到消息后，会重新调用其build方法重新构建widget树，从而达到更新UI的目的。
* */

class ZJCounterWidget extends StatefulWidget {
  const ZJCounterWidget({
   Key key,
   this.initValue = 0,
});

  final int initValue;

  @override
  _ZJCounterWidgetState createState() => new _ZJCounterWidgetState();
}

class _ZJCounterWidgetState extends State<ZJCounterWidget> {
  int _counter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.initValue;
    print('初始化状态');
  }

  @override
  Widget build(BuildContext context){
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("开始测试"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Builder(builder: (context) {
          return ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("我是SnackBar")));
            },
            child: Text("显示SnackBar"),
          );
        }),


//        child: FlatButton(
//          child: Text("$_counter"),
//          onPressed: ()=>setState(()=> ++_counter),
//        ),
      ),
    );
  }

  @override
  void didUpdateWidget(ZJCounterWidget oldWidget) {
    //widget重新构建的时候回调用此方法
    super.didUpdateWidget(oldWidget);
    print("update widget");
  }

  @override
  void deactivate() {
    //state对象从树中被移除的时候
    // TODO: implement deactivate
    super.deactivate();
    print("deactive");
  }

  @override
  void reassemble() {
    //测试环境才会有用
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {

    //“当State对象的依赖发生变化时会被调用
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didchangeDependencies");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 当state对象从树中被永久移除时调用
    super.dispose();
  }
}