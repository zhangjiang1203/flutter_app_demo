import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';


class PaddingModelTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Padding设置"),
        backgroundColor: Colors.blue,
      ),
      //Padding的主要的四个方法
      // all 所有方向相同的间距
      // fromLTRB 四个方向设置间距
      // only  某个方向的具体间距，可以设置多个
      // symmetric 设置对称方向的间距
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('我就是我，不一样的烟火'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10,0,10,0),
              child: Text('我就是我，不一样的烟火12'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              child: Text('我就是我，不一样的烟火1133'),
            )
          ],
        ),
      ),
    );
  }
}
