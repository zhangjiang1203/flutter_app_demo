//导入包

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/TextFieldModel.dart';
import 'package:flutter_app_demo/WidgetTest/TextFocusNode.dart';
import 'WidgetTest/StatelessWidgeTest.dart';
import 'WidgetTest/CupertinoStyle.dart';
import 'WidgetTest/WidgetStateTest.dart';
import 'WidgetTest/newRouteButton.dart';
import 'WidgetTest/InfoPage-IconAndImage.dart';
import 'WidgetTest/RandomWords.dart';
import 'WidgetTest/TextFieldModel.dart';

//应用程序的入口，使用=> 这是单行函数的简写
void main() => runApp(MyApp());

//MyApp类代表Flutter应用，它继承了 StatelessWidget类，这也就意味着应用本身也是一个widget。
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()
  //方法来描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      // 应用名称
//      title: 'Flutter Demo',
//      // APP的主题色
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      //注册路由表
//      routes: {
//        "new_page":(context)=>NewRoute(),
//      },
//      //应用首页的路由设
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );


    // 使用命名路由来跳转
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",//名为‘/’的路由作为应用的home首页
      routes: {
        "new_page":(context)=>NewRoute(),
        //TipRoute组件初始化的时候必须加参数，ModalRoute获取传参
        "info_page":(context)=>TipRoute(text: ModalRoute.of(context).settings.arguments),
        "/":(context) => MyHomePage(title: "Flutter Demo Home Page"),
        "counter_page":(context) => ZJCounterWidget(),
        "cupertino_page":(context) => CupertinoRoute(),
        "widget_self":(context) => WidgetSelfBoxA(),
        "parent_widget":(context) => ParentStateWidget(),
        "mix_widget":(context) => MixControlState(),
        "textField_widget":(context) => TextFieldModelTest(),
        "focus_widget":(context) => TextFocusModel(),
      },
    );
  }
}

//有状态的组件（Stateful widget） 和无状态的组件（Stateless widget）
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//_MyHomePageState类是MyHomePage类对应的状态类
class _MyHomePageState extends State<MyHomePage> {
//  该组件的状态，
  int _counter = 0;
//  该函数的作用是先自增_counter，然后调用setState 方法
//  setState方法的作用是通知Flutter框架，有状态发生了改变，Flutter框架收到通知后，
//  会执行build方法来根据新的状态重新构建界面，
//  Flutter 对此方法做了优化，使重新执行变的很快，所以你可以重新构建任何需要更新的东西，而无需分别去修改各个widget
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


  //构建首页的UI界面
  @override
  Widget build(BuildContext context) {
    //Scaffold 是Material库中提供的页面脚手架，它包含导航栏和Body以及FloatingActionButton
    //如果需要的话）。 本书后面示例中，路由默认都是通过Scaffold创建。
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display2,
            ),
            RandomWordsWidget(),
            Row(
              mainAxisSize:MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("新路由"),
                  textColor: Colors.white,
                  color: Colors.deepPurple,
                  onPressed: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context){
//                  return NewRoute();
//                }));
                    Navigator.pushNamed(context, "new_page");
                  },
                ),
                FlatButton(
                  textColor: Colors.white,
                  color: Colors.blueGrey,
                  onPressed: () async {
//                修改为命名路由展示
//                var result = await Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) {
//                      return TipRoute(text: "我是提示,你好啊 ",);
//                    }
//                  ),
//                );
                    var result = await Navigator.of(context).pushNamed("info_page",arguments:"你好");
                    //点击按钮返回的result会有一个返回值，点击左上角的按钮result没有返回值
                    print("输出路由返回值===$result");
                  },
                  child: Text("打开提示页"),
                ),
                //添加随机字符串

                FlatButton(
                  child: Text("加法器"),
                  textColor: Colors.white,
                  color: Colors.amber,
                  onPressed: () => Navigator.pushNamed(context, "counter_page"),
                ),
                FlatButton(
                  child: Text("提示框"),
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  onPressed: () => Navigator.pushNamed(context, "cupertino_page"),
                ),


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(
                  child: Text("自己管理"),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () => Navigator.pushNamed(context, "widget_self"),
                ),
                FlatButton(
                  child: Text("父管理"),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () => Navigator.pushNamed(context, "parent_widget"),
                ),
                FlatButton(
                  child: Text("混合管理"),
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () => Navigator.pushNamed(context, "mix_widget"),
                ),
                FlatButton(
                  child: Text("输入框"),
                  textColor: Colors.white,
                  color: Colors.deepPurpleAccent,
                  onPressed: () => Navigator.pushNamed(context, "textField_widget"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(
                  child: Text("键盘焦点"),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () => Navigator.pushNamed(context, "focus_widget"),
                ),
                FlatButton(
                  child: Text("占位"),
                  textColor: Colors.white,
                  color: Colors.blue,
//                  onPressed: () => Navigator.pushNamed(context, "parent_widget"),
                ),
                FlatButton(
                  child: Text("占位"),
                  textColor: Colors.white,
                  color: Colors.green,
//                  onPressed: () => Navigator.pushNamed(context, "mix_widget"),
                ),
                FlatButton(
                  child: Text("占位"),
                  textColor: Colors.white,
                  color: Colors.deepPurpleAccent,
//                  onPressed: () => Navigator.pushNamed(context, "textField_widget"),
                ),
              ],
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

//  final str = "你好";
////  const str1 = "我就是我😯";
//
//  dynamic a;
//  Object b;
//  main(){
//    a = "";
//    b = "";
//    printLengths();
//  }
//  //dart中dynamic与object相同之处在于他们申明的变量可以在后期改变赋值类型，dynamic与Object不同的是，dynamic声明的对象编译器会
//  // 提供所有的可能组合，而object声明的对象只能使用Object的属性方法，
//  printLengths(){
//    print(a.legth);
////    print(b.length);
//  }
//
////  dart 函数声明没有显示的声明返回值类型的时，会默认当做dynamic处理，函数返回值没有类型推断
//  bool isNoble( int auom) {
//    return auom == 0;
//  }
//  // 对只包含一个表达式的函数，可以使用简写的语法
//  bool isNoble1 (int atom)=> atom == 0;
//  //此时的函数返回值为dynamic
//  isOk(int index) {
//    return index == 1;
//  }
//  //函数作为参数传递
//  var say = (str){
//    print(str);
//  };
//
//  String say1(String name,String age,[String device]) {
//    var result = "$name says $age";
//    if (device != null) {
//      return "$result with $device";
//    }
//    return result;
//  }

}


