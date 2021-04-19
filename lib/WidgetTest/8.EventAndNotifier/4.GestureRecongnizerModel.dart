/*
* GestureRecongnizerModel created by zhangjiang 
* on 2020-02-16 23:10
* copyright on zhangjiang
*/

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerModel extends StatefulWidget {
  GestureRecognizerModel({Key key}) : super(key: key);

  @override
  _GestureRecognizerModelState createState() =>
      _GestureRecognizerModelState();
}

class _GestureRecognizerModelState extends State<GestureRecognizerModel> {

  TapGestureRecognizer _recognizer = new TapGestureRecognizer();
  bool _choose = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GestureRecognizerModel'),
        ),
        body: Column(
          children: <Widget>[
            Text.rich(
              TextSpan(
                  text:"你好",
                  children:[
                    TextSpan(text:"我就是"),
                    TextSpan(text: "点我啊",
                      style:TextStyle(
                        fontSize: 30,
                        color: _choose ? Colors.red : Colors.blue,
                      ),
                      recognizer:TapGestureRecognizer()..onTap=(){
                        setState(() {
                          _choose = !_choose;
                        });
                      }
                    ),
                    TextSpan(text: "你好，世界"),
                  ]
              ),
            ),
          ],
        )
    );
  }
}