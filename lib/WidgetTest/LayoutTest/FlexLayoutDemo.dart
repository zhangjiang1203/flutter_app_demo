import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class FlexStateDemo extends StatefulWidget {

  @override
  _FlexState createState() => new _FlexState();
}

class _FlexState extends State<FlexStateDemo> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text("Flow布局"),
      ),
      //Flex中的控件，按照1：2的比例平分Flex的占用空间
      body: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('你在不在'),
                  Text('我不在'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.cyan,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('我是第二个'),
                  Text('我是第三个'),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}