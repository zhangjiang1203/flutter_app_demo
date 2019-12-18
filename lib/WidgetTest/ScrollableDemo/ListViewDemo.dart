import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class ListViewDemo extends StatefulWidget {
  @override
  ListViewDemo({Key key}):super(key:key);
  
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
  
}

class _ListViewDemoState extends State<ListViewDemo> {
  
  int _currentIndex = 1;
  String _currentTitle = "ListViewDemo";
  //创建复用的separator和字符串
  Widget devide1 = Divider(color: Colors.green,height: 0.0,);
  Widget devide2 = Divider(color: Colors.blue,height: 0.0,);
  String tempStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  //作用在4上面的表尾标记
  static const String loadingTag = "##loading##";
  //存放对应的展示数组
  var _words = <String>[loadingTag];
  
  void _onpressChange(){
    setState(() {
      if(_currentIndex >= 5){
        _currentIndex = 1;
      }else {
        _currentIndex++;
      }
      switch(_currentIndex){
        case 1:
          _currentTitle = "ListViewDemo";
          break;
        case 2:
          _currentTitle = "ListBuilder";
          break;
        case 3:
          _currentTitle = "ListSeparator";
          break;
        case 4:
          _createMyShowData();
          _currentTitle = "InfiniteList";
          break;
        case 5:
          _currentTitle = "addListTitle";
      }

    });
  }
  
  Widget createMyCustomWidget(int index) {
    switch (index){
      case 1:
        return ListView(
          children: tempStr.split("").map((e)=>Text(e,textScaleFactor: 2,)).toList(),
        );
      case 2:
        return ListView.builder(
          //每个item的高度
          itemExtent: 50,
          //item的数量
          itemCount: 50,
          itemBuilder: (BuildContext context,int index){
              return ListTile(title: Text("当前==$index"),);
              },
        );
      case 3:

        return ListView.separated(
            //item的数量
            itemCount: 100,
            //列表项构造
            itemBuilder: (BuildContext context,int index){
              return ListTile(title: Text("我有下划线的==$index"),subtitle: Text("类型也不一样"),);
            },
            //分割器构造
            separatorBuilder: (BuildContext context ,int index){
              return index%2 == 0 ? devide1 : devide2;
            },
        );
      case 4:
        return ListView.separated(
            itemBuilder: (BuildContext context,int index){
              if(_words[index] == loadingTag) {
                //不足100条数据的时候继续加载
                if(_words.length - 1 < 100) {
                  _createMyShowData();
                  //加载展示的loading
                  return Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    ),
                  );
                }else{
                  //已经加载了100条数据，不在获取数据
                  return Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: Text("没有更多数据了",style: TextStyle(color: Colors.grey[700])),
                  );
                }
              }
              return ListTile(title: Text(_words[index],style: ZJTextStyleTool.black_24,));
            },
            separatorBuilder: (BuildContext context,int index){
              return index % 2 == 0 ? devide1 : devide2;
            },
            itemCount: _words.length);
      case 5:
        //添加单个表头
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(title: Text("我是表头"),),
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemExtent: 50,
                itemBuilder: (context,index){
                  return ListTile(title: Text("title===$index",style: TextStyle(color: Colors.red,fontSize: 28)));
                },
              ),
            ),

          ],
        );
    }
  }

  void _createMyShowData() {
    Future.delayed(Duration(seconds: 2)).then((e){
      //每次插入20个单词，每个单词首字母大写放大数组中
      _words.insertAll(_words.length-1, generateWordPairs().take(20).map((e)=>e.asPascalCase).toList());
      //和上面的重复执行了
      setState(() {

      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTitle),
        actions: <Widget>[
          FlatButton(
            child: Text("list变化",style: TextStyle(color: Colors.white),),
            onPressed: _onpressChange,
          ),
        ],
      ),
      
      //添加滚动条
      body: createMyCustomWidget(_currentIndex),
    );
  }
}