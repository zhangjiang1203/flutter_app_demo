import 'package:flutter/material.dart';


class ProcessAnimateModelTest extends StatefulWidget {
  ProcessAnimateModelTest({Key key}) : super(key:key);

  @override
  _ProcessAnimateModelState createState() => new _ProcessAnimateModelState();

}

class _ProcessAnimateModelState extends State<ProcessModelTest> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ProcessTest"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 0,top: 10,right: 0,bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: 0.4,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                ),
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

          ],
        ),
      ),
    );
  }
}