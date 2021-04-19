import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class AlignLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AlignLayout',style: ZJTextStyleTool.red_28,),
        backgroundColor: Colors.blue,
      ),
      body: Wrap(
        alignment: WrapAlignment.center,
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            color: Colors.lightGreen,
            //Alignment Widget会以矩形的中心点作为坐标原点，即Alignment(0.0, 0.0) 。
            //x、y的值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离，因此2个水平（或垂直）单位则等于矩形的宽（或高），
            //如Alignment(-1.0, -1.0) 代表矩形的左侧顶点，而Alignment(1.0, 1.0)代表右侧底部终点，而Alignment(1.0, -1.0)
            //则正是右侧顶点，即Alignment.topRight。
           child: Align(
              alignment: Alignment.topLeft,//Alignment(-1.0, -1.0)
//              下面的公式就是子控件的偏移量
//              alignment.x*width/2 + width/2
//              alignment.y*height/2 + height/2 偏移为（0,0）中间显示
              child: FlutterLogo(size: 120,),
            ),
          ),
          Container(
//            width: 120,
//            height: 120,
            color: Colors.black12,
            //宽高因子 是为了确定Align的宽高的 60*2
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              //偏移（90，30）超出屏幕限制
              alignment: Alignment(2.0,0),
              child: FlutterLogo(size: 60,),
            ),
          ),
          Container(
            width: 120,
            height: 120,
            color: Colors.red,
            child: Align(
              //FractionalOffset 继承自 Alignment，它和 Alignment唯一的区别就是坐标原点不同！FractionalOffset 的坐标原点为矩形的左侧顶点，
              //实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight) 偏移为  (12,0)
              alignment: FractionalOffset(0.5,0),
              child: FlutterLogo(size: 60,),
            ),
          ),

          Align(
            widthFactor: 1,
            heightFactor: 1,
            alignment: FractionalOffset(0.5,0.5),
            child: FlutterLogo(size: 60,),
          ),

          Align(
            widthFactor: 1,
            heightFactor: 1,
            alignment: FractionalOffset(0.1,0.3),
            child: FlutterLogo(size: 60,),
          ),
          //当widthFactor和heightFactor为null时，Align占用尽可能多的空间
          Align(
            alignment: FractionalOffset(0.3,0.8),
            child: FlutterLogo(size: 60,),
          ),

          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("没有设置对应的widthFactor和heightFactor"),
            ),
          ),


          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("设置对应的widthFactor和heightFactor"),
            ),
          ),
        ],
      )
    );
  }
}