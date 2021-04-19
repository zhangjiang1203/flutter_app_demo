import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class SliverGridViewDemo extends StatefulWidget {
  SliverGridViewDemo({Key key}):super(key:key);

  _SliverGridState createState() => new _SliverGridState();
}

class _SliverGridState extends State<SliverGridViewDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      //CustomScrollView只能添加Sliver子组件
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              FlatButton(
                child: Text('分享',style: ZJTextStyleTool.white_36,),
                onPressed: (){
                  print("分享按钮点击");
                },
              ),
            ],
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("你好",style: ZJTextStyleTool.white_40,),
              background: Hero(
                child: Image.asset('assets/images/star_name.png',height: 200,fit: BoxFit.cover,),
                tag: "transition_app_header",),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4,
              ),
              delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                return Container(
                  color: Colors.green[100*(index%9)],
                  alignment: Alignment.center,
                  child: Text("currentItem==$index"),
                );
              },
              childCount: 30,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate((context,index) {
              return Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                color: Colors.red[100*(index%9)],
                child: Text("listView==$index"),
              );
            },
            childCount: 50),
          ),

        ],
      ),
    );
  }
}
