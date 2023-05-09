import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/3.BasicWidgetDemo/RandomWords.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';


class ScaffoldDemo extends StatefulWidget {

  ScaffoldDemo({Key key}): super(key:key);

  @override
  _ScaffoldState createState() => new _ScaffoldState();
}

class _ScaffoldState extends State<ScaffoldDemo> {

  int _selectedIndex = 0;


  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {

    setState(() {
      //刷新展示的
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ScaffoldDemo",style: ZJTextStyleTool.white_36,),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _onAdd,
          ),
        ],

      ),
      //默认的抽屉
      drawer:new Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '商务',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '学校',
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTap,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),

      body:Center(child:
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("测试数据"),
            RandomWordsWidget(),
         ],
        ),
      ),
    );
  }
}