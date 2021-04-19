import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class ColumnAndRowTest extends StatefulWidget {

  @override
  _ColumenAndRowState createState() => new _ColumenAndRowState();
}

class _ColumenAndRowState extends State<ColumnAndRowTest> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ColumnAndRowTest',style: ZJTextStyleTool.black_24),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.pink,
        child:  Column(
          // Column和Row本身没有设置大小的属性，其大小都是通过子控件的大小撑开的，
          // 如果Row里面嵌套Row，或者Column里面再嵌套Column，
          // 那么只有对最外面的Row或Column会占用尽可能大的空间，
          // 里面Row或Column所占用的空间为实际大小，”
          // 这个column充满整个屏幕
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('hello'),
                Text('world'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Hello"),
                Text("jack"),
              ],
            ),
            Row(
              //从右向左对齐
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text("Hello"),
                Text("jack"),
              ],
            ),
            Row(
              //底部对齐
              verticalDirection: VerticalDirection.up,
              crossAxisAlignment: CrossAxisAlignment.start,//底对齐
              children: <Widget>[
                Text("Hello"),
                Text("jack"),
                Text("Hello123"),
                Text("jack456",style: ZJTextStyleTool.black_40),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("Hello"),
                Text("jack"),
                Text("Hello123"),
                Text("我就是我不一样的烟火",style: ZJTextStyleTool.black_40),
              ],
            ),
            Container(
              color: Colors.blue,
              //Container不设置对应的约束，宽高也是子控件撑开的
              //将minWidth设为double.infinity，可以使宽度占用尽可能多的空间
//              constraints: BoxConstraints(minWidth: double.infinity),
              child: Column(
                //此时Column的尺寸就是自己的实际尺寸，外层的为最大的尺寸
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("你好中国"),
                  Text("走向世界"),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

