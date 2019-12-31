//导入包

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJColorsTool.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';

import 'package:flutter_app_demo/WidgetTest/BasicWidgetDemo/FormsModelTest.dart';
import 'package:flutter_app_demo/WidgetTest/BasicWidgetDemo/TextFieldModel.dart';
import 'package:flutter_app_demo/WidgetTest/BasicWidgetDemo/TextFocusNode.dart';
import 'WidgetTest/BasicWidgetDemo//StatelessWidgeTest.dart';
import 'WidgetTest/BasicWidgetDemo/CupertinoStyle.dart';
import 'WidgetTest/BasicWidgetDemo/WidgetStateTest.dart';
import 'WidgetTest/BasicWidgetDemo/newRouteButton.dart';
import 'WidgetTest/BasicWidgetDemo/InfoPage-IconAndImage.dart';
import 'WidgetTest/BasicWidgetDemo/TextFieldModel.dart';
import 'WidgetTest/BasicWidgetDemo/ProcessModelTest.dart';
import 'WidgetTest/BasicWidgetDemo/AnimateProcessModelTest.dart';

import 'WidgetTest/LayoutTest/ColumnAndRowTest.dart';
import 'WidgetTest/LayoutTest/FlexLayoutDemo.dart';
import 'WidgetTest/LayoutTest/WrapLayoutDemo.dart';
import 'WidgetTest/LayoutTest/FlowLayoutDemo.dart';
import 'WidgetTest/LayoutTest/StackAndPositionDemo.dart';
import 'WidgetTest/LayoutTest/AlignLayoutDemo.dart';
import 'WidgetTest/ContainerCollection/PaddingDemo.dart';
import 'WidgetTest/ContainerCollection/ContainerBoxDemo.dart';
import 'WidgetTest/ContainerCollection/DecoratedBoxDemo.dart';
import 'WidgetTest/SimpleDemo/ScaffoldDemo.dart';
import 'WidgetTest/SimpleDemo/AppBarDemo.dart';
import 'WidgetTest/SimpleDemo/DrawerDemo.dart';
import 'WidgetTest/SimpleDemo/BottomNavBarDemo.dart';
import 'WidgetTest/SimpleDemo/ClipRectDemo.dart';
import 'WidgetTest/ScrollableDemo/SignalChildScrollDemo.dart';
import 'WidgetTest/ScrollableDemo/ListViewDemo.dart';
import 'WidgetTest/ScrollableDemo/GridViewDemo.dart';
import 'WidgetTest/ScrollableDemo/SliverGridViewDemo.dart';
import 'WidgetTest/ScrollableDemo/ScrollControllerDemo.dart';
import 'WidgetTest/ScrollableDemo/NotificationScrollController.dart';

import 'WidgetTest/FunctionWidgetDemo/WillPopScopeDemo.dart';
import 'WidgetTest/FunctionWidgetDemo/InheritedWidgetDemo.dart';
import 'WidgetTest/FunctionWidgetDemo/ProviderDemo.dart';

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
        "/":(context) => MyHomePage(title: "Flutter Demo Home Page"),
        "new_page":(context)=>NewRoute(),
        //TipRoute组件初始化的时候必须加参数，ModalRoute获取传参
        "info_page":(context)=>TipRoute(text: ModalRoute.of(context).settings.arguments),
        "counter_page":(context) => ZJCounterWidget(),
        "cupertino_page":(context) => CupertinoRoute(),
        "widget_self":(context) => WidgetSelfBoxA(),
        "parent_widget":(context) => ParentStateWidget(),
        "mix_widget":(context) => MixControlState(),
        "textField_widget":(context) => TextFieldModelTest(),
        "focus_widget":(context) => TextFocusModel(),
        "forms_widget":(context) => FormsModelTest(),
        "process_widget":(context) => ProcessModelTest(),
        "process_animate_widget":(context) => AnimateProcessModelTest(),
        "layout_Column":(context) => ColumnAndRowTest(),
        "layout_Flex":(context) => FlexStateDemo(),
        "layout_Wrap":(context) => WrapLayoutDemo(),
        "layout_Flow":(context) => FlowLayoutDemo(),
        "layout_Stack":(context) => StackAndPositonDemo(),
        "layout_Align":(context) => AlignLayoutDemo(),
        "Container_padding":(context) => PaddingModelTest(),
        "Container_Box":(context) => ContainerBoxDemo(),
        "Contailer_DecoratedBox":(context) => DecoratedBoxDemo(),
        "Scaffold_demo":(context) => ScaffoldDemo(),
        "AppBar_demo":(context) => AppBarDemo(),
        "Drawer_demo":(context) => DrawerDemo(),
        "BottomNavBar_demo":(context) => BottomNavBarDemo(),
        "ClipRect_demo":(context) => ClipRectDemo(),
        "SignalChild_demo":(context) => SignalScrollViewDemo(),
        "listview_demo":(context) => ListViewDemo(),
        "gridview_demo":(context) => GridViewDemo(),
        "sliver_grid_view":(context) => SliverGridViewDemo(),
        "scrollcontroller_demo":(context) => ScrollControllerDemo(),
        "notification_scrollView":(context) => NotificationScrollController(),
        "nav_popScope_demo":(context) => WillPopScopeDemo(),
        "inherited_demo":(context) => InheritedWidgetDemo(),
        "provider_demo":(context) => ChangeNotifierProvider(),
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
  bool _showFloatBtn = false;
  SectionTableController _controller;

  List<Map<String,Object>> pushVCArr;
//  该函数的作用是先自增_counter，然后调用setState 方法
//  setState方法的作用是通知Flutter框架，有状态发生了改变，Flutter框架收到通知后，
//  会执行build方法来根据新的状态重新构建界面，
//  Flutter 对此方法做了优化，使重新执行变的很快，所以你可以重新构建任何需要更新的东西，而无需分别去修改各个widget

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = SectionTableController(sectionTableViewScrollTo: (section, row, isScrollDown) {
//      print('received scroll to $section $row scrollDown:$isScrollDown');
      setState(() {
        _showFloatBtn = section > 2;
      });
    });

    _controller.addListener((){
      print(_controller);
    });
    //初始化对应的信息
    pushVCArr = [
      {"section":"基础组件","row":[
        {"title":"新路由", "pushVC":"new_page", },
        {"title":"打开提示页", "pushVC":"info_page", },
        {"title":"加法器", "pushVC":"counter_page", },
        {"title":"提示框", "pushVC":"cupertino_page", },
        {"title":"自己管理", "pushVC":"widget_self", },
        {"title":"父管理", "pushVC":"parent_widget", },
        {"title":"混合管理", "pushVC":"mix_widget", },
        {"title":"输入框", "pushVC":"textField_widget", },
        {"title":"键盘焦点", "pushVC":"focus_widget", },
        {"title":"forms表单", "pushVC":"forms_widget", },
        {"title":"进度条", "pushVC":"process_widget", },
        {"title":"进度条动画", "pushVC":"process_animate_widget", }
        ]
     },
     {"section":"布局类组件","row":[
       {"title":"Column布局", "pushVC":"layout_Column", },
       {"title":"Flex布局", "pushVC":"layout_Flex", },
       {"title":"Wrap布局", "pushVC":"layout_Wrap", },
       {"title":"Flow布局", "pushVC":"layout_Flow", },
       {"title":"Stack布局", "pushVC":"layout_Stack", },
       {"title":"Align布局", "pushVC":"layout_Align", },
       {"title":"Padding布局", "pushVC":"Container_padding", },
       {"title":"Container布局", "pushVC":"Container_Box", },
       ]
     },
     {"section":"容器类组件","row":[
      {"title":"Scaffold设置", "pushVC":"Scaffold_demo", },
      {"title":"AppBar设置", "pushVC":"AppBar_demo", },
      {"title":"Drawer设置", "pushVC":"Drawer_demo", },
      {"title":"navBar设置", "pushVC":"BottomNavBar_demo", },
      {"title":"clip设置", "pushVC":"ClipRect_demo", },
      ]
    },
    {"section":"可滚动组件","row":[
      {"title":"signalScrollView", "pushVC":"SignalChild_demo", },
      {"title":"listView", "pushVC":"listview_demo", },
      {"title":"GridView", "pushVC":"gridview_demo", },
      {"title":"SliverGridView", "pushVC":"sliver_grid_view", },
      {"title":"ScrollController", "pushVC":"scrollcontroller_demo", },
      {"title":"NotificationScroll", "pushVC":"notification_scrollView", },
      ]
    },
      {"section":"功能型组件","row":[
        {"title":"导航返回拦截", "pushVC":"nav_popScope_demo", },
        {"title":"数据共享", "pushVC":"inherited_demo", },
        {"title":"跨组件状态共享", "pushVC":"provider_demo", },

      ]
      }
    ];
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
        title: Text("FlutterDemo"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: !_showFloatBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          //直接划到顶部
          _controller.animateTo(0, 0);
        },
      ),
      body: SafeArea(
        child: SectionTableView(
          sectionCount: pushVCArr.length,
          numOfRowInSection: (section){
            Map sectionData = pushVCArr[section];
            List rowData = sectionData["row"];
            return rowData.length;
          },
          cellAtIndexPath: (section,row){
            Map sectionData = pushVCArr[section];
            List rowData = sectionData["row"];
            Map rowMapData = rowData[row];
            return Container(
              height: 40,
              alignment: Alignment.center,
//              color: rowMapData["color"],
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  //没哟用positioned包裹的子widget会expaned父widget
                  Positioned(
                    left: 15,
                    top:10,
                    child: Text(rowMapData["title"],style: TextStyle(color: Color(0xff333333)),),
                  ),
                  FlatButton(
                    onPressed: () => Navigator.pushNamed(context, rowMapData["pushVC"]),
                  ),
                ],
              ),
            );

          },
          headerInSection: (section){
            Map sectionData = pushVCArr[section];
            return Container(
              color: Colors.black26,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(sectionData['section'].toString(),style: ZJTextStyleTool.white_40,),
              ),
            );
          },
          divider: Container(
            color: Colors.green,
            height: 0.1,
          ),
          sectionHeaderHeight: (section)=> 30,
          cellHeightAtIndexPath: (section,row) => 40,
          dividerHeight:()=> 0.1,
          controller: _controller,
        ),

      ),
    );

//    return Material(
//      child: CustomScrollView(
//        slivers: <Widget>[
//          //AppBar
//          SliverAppBar(
//            pinned: true,
//            flexibleSpace: FlexibleSpaceBar(
//              title: Text("flutterDemo",style: ZJTextStyleTool.white_40,),
//              background: Image.asset("assets/images/star_name.png",fit: BoxFit.cover,),
//            ),
//          ),
//          SliverPadding(
//            padding: EdgeInsets.all(8),
//            sliver: SliverGrid(
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2,
//                mainAxisSpacing: 5,
//                crossAxisSpacing: 5,
//                childAspectRatio: 4,
//              ),
//              delegate: SliverChildBuilderDelegate((context,index){
//                return Container(
//                  decoration: BoxDecoration(
//                    boxShadow:[
//                      BoxShadow(
//                        color: ZJColor.randomColor(),
//                      ),],
//                    borderRadius: BorderRadius.all(Radius.circular(5)),
//                  ),
//                  child: FlatButton(
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text(pushVCArr[index]["title"],style: ZJTextStyleTool.white_22,)
//                      ],
//                    ),
//                    onPressed: ()=> Navigator.pushNamed(context, pushVCArr[index]["pushVC"]),
//                  ),
//                );
//              },
//              childCount: pushVCArr.length),
//            ),
//          ),
//        ],
//      ),
//    );

    /*return Scaffold(
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
//            Row(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                FlatButton(
//                  child: Text("新路由",style: ZJTextStyleTool.white_22,),
//                  textColor: Colors.white,
//                  color: ZJColor.randomColor(),
//                  onPressed: (){
////                Navigator.push(context, MaterialPageRoute(builder: (context){
////                  return NewRoute();
////                }));
//                    Navigator.pushNamed(context, "new_page");
//                  },
//                ),
//                FlatButton(
//                  textColor: Colors.white,
//                  color: Colors.blueGrey,
//                  onPressed: () async {
////                修改为命名路由展示
////                var result = await Navigator.push(
////                  context,
////                  MaterialPageRoute(
////                    builder: (context) {
////                      return TipRoute(text: "我是提示,你好啊 ",);
////                    }
////                  ),
////                );
//                    var result = await Navigator.of(context).pushNamed("info_page",arguments:"你好");
//                    //点击按钮返回的result会有一个返回值，点击左上角的按钮result没有返回值
//                    print("输出路由返回值===$result");
//                  },
//                  child: Text("打开提示页",style: ZJTextStyleTool.white_22,),
//                ),
//              ],
//            ),
            Wrap(
              spacing: 5,
              runSpacing: -5,
              runAlignment: WrapAlignment.start,
              children: pushVCArr.map((e){
                return FlatButton(
                  child: Text(e["title"],style: ZJTextStyleTool.white_22,),
                  textColor: Colors.white,
                  color: ZJColor.randomColor(),
                  onPressed: () => Navigator.pushNamed(context, e["pushVC"]),
                );
              }).toList(),
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

     */
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


