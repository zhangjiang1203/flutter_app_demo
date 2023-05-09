import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';


class AppBarDemo extends StatefulWidget {

  AppBarDemo({Key key}): super(key:key);

  @override
  _AppBarDemoState createState() => new _AppBarDemoState();
}

class _AppBarDemoState extends State<AppBarDemo> with SingleTickerProviderStateMixin{

  int _selectedIndex = 0;
  //定义一个视图VC
  TabController _tabVC;
  List body = ["新闻","历史","图片"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabVC = TabController(length: body.length,vsync: this);
    //添加监听的时候，addListener要执行两遍
    _tabVC.addListener((){
      int index = _tabVC.index;
      print("当前index==$index");
    });
  }


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

  /*动态添加颜色生成*/
  Color _createMyColor(String e) {
    if(e == "新闻") {
      return Colors.red;
    }else if (e == "历史"){
      return Colors.yellow;
    }else{
      return Colors.brown;
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ScaffoldDemo",style: ZJTextStyleTool.white_36,),
        backgroundColor: Colors.blue,
        //导航栏 leftbaritem视图
        leading: Builder(builder: (context){
          return IconButton(
            icon: Icon(Icons.business),
            onPressed: ()=> Scaffold.of(context).openDrawer(),
          );
        },),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _onAdd,
          ),
        ],
        bottom: TabBar(
          controller: _tabVC,
          //对Tab也可以设置对应的title icon 和 child
          tabs: body.map((e)=>Tab(text: e,)).toList(),
        ),


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

      body: TabBarView(
        controller: _tabVC,
        children: body.map((e){
          return Container(
            color: _createMyColor(e),
            alignment: Alignment.center,
            child: Text(e,textScaleFactor: 5),
          );
        }).toList(),
      ),
    );

//    PageView
  }
}