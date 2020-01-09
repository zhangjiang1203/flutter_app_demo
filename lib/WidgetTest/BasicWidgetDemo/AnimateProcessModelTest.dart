import 'package:flutter/material.dart';


class AnimateProcessModelTest extends StatefulWidget {
  AnimateProcessModelTest({Key key}) : super(key:key);

  @override
  _AnimateProcessModelState createState() => new _AnimateProcessModelState();

}

//这个class中添加了 SingleTickerProviderStateMixin这个协议
class _AnimateProcessModelState extends State<AnimateProcessModelTest> with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = new AnimationController(vsync: this,
        duration: Duration(seconds: 3),
    );
    _animationController.forward();
    _animationController.addListener(()=>setState(()=>{}));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ProcessTest"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //没有动画的进度条
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.green),// Colors.green[400],
            ),

            Padding(padding: EdgeInsets.only(left: 0,top: 10,right: 0,bottom: 0),),
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.green),
            ),
            Padding(padding: EdgeInsets.only(left: 0,top: 10,right: 0,bottom: 0),),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                ),
                Padding(padding: EdgeInsets.only(left: 5,top: 0,right: 0,bottom: 0),),
                CircularProgressIndicator(
                  value: 0.5,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                ),

              ],
            ),
            //指定容器的宽高
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 10),),
                SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: 0.4,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10),),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: 0.4,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 4,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: ColorTween(begin: Colors.grey,end: Colors.blue).animate(_animationController),
                    value: _animationController.value,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10),),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: _animationController.value,
                    valueColor: ColorTween(begin: Colors.grey,end: Colors.red).animate(_animationController),
                    backgroundColor: Colors.grey[200],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}