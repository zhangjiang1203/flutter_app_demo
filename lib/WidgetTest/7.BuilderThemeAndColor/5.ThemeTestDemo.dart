import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';


class ThemeTestDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ThemeTestState();
  }
}

class _ThemeTestState extends State<ThemeTestDemo> {

  MaterialColor _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(color: _themeColor)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("ChangeTheme"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //设置按钮点击修改颜色点击调用setState方法
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //颜色跟随主题设置
                  Icon(Icons.home),
                  Icon(Icons.arrow_upward),
                  Text('颜色跟随主题变化'),
                ],
              ),
              //自定义其他颜色
              Theme(
                data: ThemeData(
                  primarySwatch: Colors.yellow,
                  iconTheme: IconThemeData(color: Colors.yellow),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //颜色跟随主题设置
                    Icon(Icons.home),
                    Icon(Icons.arrow_upward),
                    Text('颜色主题自定义',style: TextStyle(color: Colors.yellow),),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.palette),
          onPressed: (){
            setState(() {
              _themeColor = _themeColor == Colors.teal ? Colors.red : Colors.teal;
            });
          },
        ),
      ),
    );
  }
}