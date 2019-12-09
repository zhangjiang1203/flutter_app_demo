
//Wrap相对于Column和Row是会自动换行
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/LayoutTest/WrapLayoutDemo.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';


class WrapLayoutDemo extends StatefulWidget {
  @override
  _WrapLayoutState createState() => new _WrapLayoutState();
}

class _WrapLayoutState extends State<WrapLayoutDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("WrapDemo",style: ZJTextStyleTool.white_28,),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: Colors.blue,
        constraints: BoxConstraints(minWidth: double.infinity,minHeight: double.infinity),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 2,
          runSpacing: 0,
          runAlignment: WrapAlignment.center,//修改对应的start end去展示数据
          children: <Widget>[
            new Chip(
              label: new Text("A Family"),
              avatar: new CircleAvatar(
                child: Text('A'),
                backgroundColor: Colors.blue,
              ),
            ),
            new Chip(
              label: new Text("Bool Value"),
              avatar: new CircleAvatar(
                child: Text('B'),
                backgroundColor: Colors.blue,
              ),
            ),
            new Chip(
              label: new Text("Cut Paper"),
              avatar: new CircleAvatar(
                child: Text('C'),
                backgroundColor: Colors.blue,
              ),
            ),
            new Chip(
              label: new Text("Dog hot"),
              avatar: new CircleAvatar(
                child: Text('D'),
                backgroundColor: Colors.blue,
              ),
            ),
            new Chip(
              label: new Text("Eat dinner"),
              avatar: new CircleAvatar(
                child: Text('E'),
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
