import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJColorsTool.dart';

class GridViewDemo extends StatefulWidget {
  GridViewDemo({Key key}) : super(key:key);

  @override
  _GridViewState createState() => _GridViewState();


}

class _GridViewState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('GridView'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //设置确定的大小
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //横轴上的最大长度
                maxCrossAxisExtent: 120,
                //主轴间距
                mainAxisSpacing: 0,
                //纵轴间距
                crossAxisSpacing: 0,
                //宽高比
                childAspectRatio: 1,
              ),
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            ),
          ),
        ],
      ),
    );
  }
}