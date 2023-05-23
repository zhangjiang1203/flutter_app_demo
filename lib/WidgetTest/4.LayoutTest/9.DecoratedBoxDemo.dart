import 'package:flutter/material.dart';
import 'dart:math' as math;


class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("DecoratedBox"),backgroundColor: Colors.blue,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: DecoratedBox(
              decoration: BoxDecoration(
//            color: Colors.red,
                gradient: LinearGradient(
                  colors: [Colors.red,Colors.orange[700]!],
//              stops: [0.2,0.5],
//              begin: Alignment(0.2,0.3),
//              end: Alignment(0.9,-0.5),

                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [BoxShadow(
                  blurRadius: 5,
                  color: Colors.black54,
                  offset: Offset(3,2),
                )],
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('我就是我，不一样的烟火',style: TextStyle(color:Colors.white,)),
              ),

            ),
          ),
          // 矩阵变换,Y轴变换
//          Wrap(
//            children: <Widget>[
//              Container(
//                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//                color: Colors.blue,
//                child: Transform(
//                  //变换后的子widget和父widget的对齐方式
//                  alignment: Alignment.topLeft,//相对于坐标系原点的对齐方式
//                  transform: new Matrix4.skewY(0.3),//沿y轴倾斜0.3弧度
//                  child: Container(
//                    padding: EdgeInsets.all(5),
//                    color: Colors.yellow,
//                    child: Text('我就是我'),
//                  ),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//                color: Colors.blue,
//                child: Transform(
//                  //变换后的子widget和父widget的对齐方式
//                  alignment: Alignment.topRight,//相对于坐标系原点的对齐方式
//                  transform: new Matrix4.skewY(0.3),//沿y轴倾斜0.3弧度
//                  child: Container(
//                    padding: EdgeInsets.all(5),
//                    color: Colors.yellow,
//                    child: Text('我就是我'),
//                  ),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//                color: Colors.blue,
//                child: Transform(
//                  //变换后的子widget和父widget的对齐方式
//                  alignment: Alignment.bottomLeft,//相对于坐标系原点的对齐方式
//                  transform: new Matrix4.skewY(0.3),//沿y轴倾斜0.3弧度
//                  child: Container(
//                    padding: EdgeInsets.all(5),
//                    color: Colors.yellow,
//                    child: Text('我就是我'),
//                  ),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//                color: Colors.blue,
//                child: Transform(
//                  //变换后的子widget和父widget的对齐方式
//                  alignment: Alignment.bottomRight,//相对于坐标系原点的对齐方式
//                  transform: new Matrix4.skewY(0.3),//沿y轴倾斜0.3弧度
//                  child: Container(
//                    padding: EdgeInsets.all(5),
//                    color: Colors.yellow,
//                    child: Text('我就是我'),
//                  ),
//                ),
//              ),
//            ],
//          ),
          // X轴变换
//          Wrap(
//            children: <Widget>[
//              Container(
//                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//                color: Colors.blue,
//                child: Transform(
//                  //变换后的子widget和父widget的对齐方式
//                  alignment: Alignment.topLeft,//相对于坐标系原点的对齐方式
//                  transform: new Matrix4.skewX(0.3),//沿y轴倾斜0.3弧度
//                  child: Container(
//                    padding: EdgeInsets.all(5),
//                    color: Colors.yellow,
//                    child: Text('我就是我'),
//                  ),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//                color: Colors.blue,
//                child: Transform(
//                  //变换后的子widget和父widget的对齐方式
//                  alignment: Alignment.topRight,//相对于坐标系原点的对齐方式
//                  transform: new Matrix4.skewX(0.3),//沿y轴倾斜0.3弧度
//                  child: Container(
//                    padding: EdgeInsets.all(5),
//                    color: Colors.yellow,
//                    child: Text('我就是我'),
//                  ),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//                color: Colors.blue,
//                child: Transform(
//                  //变换后的子widget和父widget的对齐方式
//                  alignment: Alignment.bottomLeft,//相对于坐标系原点的对齐方式
//                  transform: new Matrix4.skewX(0.3),//沿y轴倾斜0.3弧度
//                  child: Container(
//                    padding: EdgeInsets.all(5),
//                    color: Colors.yellow,
//                    child: Text('我就是我'),
//                  ),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//                color: Colors.blue,
//                child: Transform(
//                  //变换后的子widget和父widget的对齐方式
//                  alignment: Alignment.bottomRight,//相对于坐标系原点的对齐方式
//                  transform: new Matrix4.skewX(0.3),//沿y轴倾斜0.3弧度
//                  child: Container(
//                    padding: EdgeInsets.all(5),
//                    color: Colors.yellow,
//                    child: Text('我就是我'),
//                  ),
//                ),
//              ),
//            ],
//          ),
          // (X,Y)轴同时变换
          Wrap(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                color: Colors.blue,
                child: Transform(
                  //变换后的子widget和父widget的对齐方式
                  alignment: Alignment.topLeft,//相对于坐标系原点的对齐方式
                  transform: new Matrix4.skew(0.3,0.3),//沿y轴倾斜0.3弧度
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.yellow,
                    child: Text('我就是我'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                color: Colors.blue,
                child: Transform(
                  //变换后的子widget和父widget的对齐方式
                  alignment: Alignment.topRight,//相对于坐标系原点的对齐方式
                  transform: new Matrix4.skew(0.3,0.3),//沿y轴倾斜0.3弧度
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.yellow,
                    child: Text('我就是我'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                color: Colors.blue,
                child: Transform(
                  //变换后的子widget和父widget的对齐方式
                  alignment: Alignment.bottomLeft,//相对于坐标系原点的对齐方式
                  transform: new Matrix4.skew(0.3,0.3),//沿y轴倾斜0.3弧度
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.yellow,
                    child: Text('我就是我'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                color: Colors.blue,
                child: Transform(
                  //变换后的子widget和父widget的对齐方式
                  alignment: Alignment.bottomRight,//相对于坐标系原点的对齐方式
                  transform: new Matrix4.skew(0.3,0.3),//沿y轴倾斜0.3弧度
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.yellow,
                    child: Text('我就是我'),
                  ),
                ),
              ),
            ],
          ),
          //旋转 平移 缩放
          Wrap(
            children: <Widget>[
              //平移设置
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                color: Colors.blue,
                child: Transform.translate(
                  //默认原点为左上角
                  //变换后的子widget和父widget的对齐方式
                  offset: Offset(5,9),//沿x轴向右平移5  y轴向下平移9
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.yellow,
                    child: Text('我就是我'),
                  ),
                ),
              ),
              //旋转设置
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                color: Colors.blue,
                child: Transform.rotate(
                  //默认原点为左上角
                  //旋转90度
                  angle: math.pi/2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.yellow,
                    child: Text('我就是我'),
                  ),
                ),
              ),

              //缩放
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                color: Colors.blue,
                child: Transform.scale(
                  //默认原点为左上角
                  //旋转90度
                  scale: 1.2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.yellow,
                    child: Text('我就是我'),
                  ),
                ),
              ),
              Row(
                //变换后的widget还占有对应的位置和空间，不会影响相邻的widget
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    color: Colors.blue,
                    child: Transform.scale(
                      //默认原点为左上角
                      //旋转90度
                      scale: 1.2,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.yellow,
                        child: Text('我就是我'),
                      ),
                    ),
                  ),
                  Text("Hello"),
                ],
              ),
            ],
          ),
          //先平移在旋转,变换之后默认的原点改变，两次修改产生的效果也不会相同，每次变换 参照点发生变化
          Wrap(
            children: <Widget>[
              //先平移在旋转
              Container(
                margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                color: Colors.blue,
                child: Transform.translate(
                  //默认原点为左上角
                  //变换后的子widget和父widget的对齐方式
                  offset: Offset(5,9),//沿x轴向右平移5  y轴向下平移9
                  child: Transform.rotate(
                      angle: math.pi/2,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.yellow,
                        child: Text('先平移在旋转'),
                      ),
                  ),
                ),
              ),
              //旋转设置
              Container(
                margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                color: Colors.cyan,
                child: Transform.rotate(
                  //默认原点为左上角
                  //旋转90度
                  angle: math.pi/2,
                  child: Transform.translate(
                    offset: Offset(5,9),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.blue,
                      child: Text('先旋转在平移'),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(left: 100),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.red,Colors.orange],
                center: Alignment.topLeft,
                radius: 0.9,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3, 3),
                  blurRadius: 4.0,
                ),
              ],
              borderRadius:BorderRadius.all(Radius.circular(10)),
            ),
            constraints: BoxConstraints.tightFor(width:200,height: 150),
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(0.2),
            child: Text("我就是我",style: TextStyle(fontSize: 30,color: Colors.white),),
          ),

        ],
      ),
    );
  }
}