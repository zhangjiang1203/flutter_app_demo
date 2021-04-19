/*
* TestPushAnimationModel created by zhangjiang 
* on 2020-03-11 10:26
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class TestPushAnimationModel extends StatefulWidget {
  TestPushAnimationModel({Key key}) : super(key: key);

  @override
  _TestPushAnimationModelState createState() => _TestPushAnimationModelState();
}

class _TestPushAnimationModelState extends State<TestPushAnimationModel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TestPushAnimationModel"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('我就是push进来的widget'),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}