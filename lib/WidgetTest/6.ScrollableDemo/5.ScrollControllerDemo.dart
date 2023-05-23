import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJColorsTool.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class ScrollControllerDemo extends StatefulWidget {

  ScrollControllerDemo({Key? key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScrollControllerDemo();
  }

}

class _ScrollControllerDemo extends State<ScrollControllerDemo> {
  ScrollController _scrollController = new ScrollController();
  bool  _showBtn = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener((){
      if (_scrollController.offset < 1000 && _showBtn) {
        setState(() {
          _showBtn = false;
        });
      }else if (_scrollController.offset >= 1000 && !_showBtn) {
        setState(() {
          _showBtn = true;
        });
      }
    });

  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动设置',style: ZJTextStyleTool.white_40,),
      ),
      body: ListView.separated(
        controller: _scrollController,
        itemBuilder: (context,index){
          return ListTile(title: Text("你好$index",),subtitle: Text("开始计算"),);
        },
        separatorBuilder: (context,index){
          return const Divider(color: Colors.blue,height: 0.0,);
        },
        itemCount: 100,
      ),

      floatingActionButton: !_showBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          //回滚到最顶部，隐藏按钮
          _scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}