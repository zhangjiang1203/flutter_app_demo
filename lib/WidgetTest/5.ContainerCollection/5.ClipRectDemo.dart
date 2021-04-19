import 'package:flutter/material.dart';

class ClipRectDemo extends StatelessWidget {

  Widget headerIcon = Image.asset("assets/images/goodnight.jpeg",width: 80,height: 80,);
  Widget rectIcon = Image.asset("assets/images/goods_share_btn_weiixn.png",width: 100,height: 80,);
  Widget starIcon = Image.asset("assets/images/star.jpeg",width: 100,);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ClipRect"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //不裁剪
//            headerIcon,
//            //子组件为正方形裁剪为圆形，
//            ClipOval(child: headerIcon,),
//            //子组件为矩形裁剪为椭圆形
//            ClipOval(child: starIcon,),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: headerIcon,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //只展示0.5,溢出剩下的部分，会遮盖文字
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.5,
                  child: headerIcon,
                ),
                Text('我就是测试数据'),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //裁剪子组件到实际占用的空间，溢出部分会被裁剪
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 0.5,
                    child: headerIcon,
                  ),
                ),
                Text("我就是测试数据"),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //裁剪子组件到实际占用的空间，溢出部分会被裁剪
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: ClipRect(
                    //裁剪不会影响到之前的控件的占位空间,子控件的大小依然还是80*80
                    clipper: MyCliper(),
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 1,
                      child: headerIcon,
                    ),
                  ),
                ),
                Text("我就是测试数据"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//自定义裁剪器
class MyCliper extends CustomClipper<Rect> {

  //获取裁剪区域,指定区域设置
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTWH(10, 15, 30, 40);
  }

  //决定是否重新裁剪
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}