import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';


class BottomNavBarDemo extends StatefulWidget {

  BottomNavBarDemo({Key? key}): super(key:key);

  @override
  _BottomNavBarState createState() => new _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarDemo>{

  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      ),
      //默认的抽屉
      drawer:new MyDrawer(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        //底部导航栏打一个圆形的洞
        shape: CircularNotchedRectangle(),
        child: Row(
          //均分空间
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: () {  },),
            //留出打洞的位置，可以根据下面floatingActionButton的位置设置这个SizedBox
            SizedBox(),
            IconButton(icon: Icon(Icons.settings), onPressed: () {  },)
          ],
        ),
      ),
      //设置floatingActionButton的位置信息,这样才能配合使用打洞效果
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),

      body: Center(child:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("测试数据"),
        ],
      ),
      ),
    );

//    PageView
  }
}

//BottomNavigationBar(
//items: <BottomNavigationBarItem>[
//BottomNavigationBarItem(
//icon: Icon(Icons.home),
//title: Text('首页'),
//),
//BottomNavigationBarItem(
//icon: Icon(Icons.business),
//title: Text('商务'),
//),
//BottomNavigationBarItem(
//icon: Icon(Icons.school),
//title: Text('学校'),
//),
//],
//currentIndex: _selectedIndex,
//fixedColor: Colors.blue,
//onTap: _onItemTap,
//)



//定义Drawer
class MyDrawer extends StatelessWidget {

  const MyDrawer({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(context: context,
        //移除顶部菜单默认的留白, 可以修改几个页面的数据进行对比
//          removeTop: true,
//          removeLeft: true,
//          removeBottom: true,
//          removeRight: true,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
                      child: Image.asset("assets/images/goods_share_btn_weiixn.png",width: 80,height: 80,),
                    ),
                  ),
                  Text("我就是我"),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("标题一"),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("标题二"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
