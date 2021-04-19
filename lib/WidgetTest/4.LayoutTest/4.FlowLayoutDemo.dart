import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class FlowLayoutDemo extends StatefulWidget {
  @override
  _FlowLayoutState createState()=> new _FlowLayoutState();
}


class _FlowLayoutState extends State<FlowLayoutDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('FlowLayout',style: ZJTextStyleTool.white_24,),
        backgroundColor: Color(0xff7000),
      ),
      body: Container(
        color: Colors.white,
        child: Flow(
          delegate: FlowLayoutDelegate(margin:EdgeInsets.all(5)),
          children: <Widget>[
            Container(
              color: Colors.blue,
              width: 80,
              height: 80,
            ),
            Container(
              color: Colors.grey,
              width: 80,
              height: 80,
            ),
            Container(
              color: Colors.green,
              width: 80,
              height: 80,
            ),
            Container(
              color: Colors.red,
              width: 80,
              height: 80,
            ),
            Container(
              color: Colors.blueGrey,
              width: 80,
              height: 80,
            ),
            Container(
              color: Colors.pink,
              width: 80,
              height: 80,
            ),
            Container(
              color: Colors.yellow,
              width: 80,
              height: 80,
            ),
            Container(
              color: Colors.purple,
              width: 80,
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}



//设置flow布局的代理
class FlowLayoutDelegate extends FlowDelegate {
  //设置代理的边界值
  EdgeInsets margin = EdgeInsets.zero;
  FlowLayoutDelegate({this.margin});

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: 指定flow的大小,整个视图的大小
    return Size(double.infinity, double.infinity);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每个控件的位置信息
    for(int i = 0;i < context.childCount;i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w >= context.size.width) {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }else{
        //绘制控件
        context.paintChild(i,transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}
