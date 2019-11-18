
import 'package:flutter/material.dart';

//创建一个没有状态的widget
class NewRoute extends StatelessWidget {

//  void _TapRecognizer() {
//
//  }

  void _ButtonClickAction() {
    print("开始点击了");
  }

  Widget build(BuildContext centext){
    return Scaffold(
      appBar: AppBar(
        title: Text("New route",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("this is new route",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 18,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.lineThrough,//underline 底部横线
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: "Home:"
                ),
                TextSpan(
                  text: "http://www.baidu.com",
                  style: TextStyle(color: Colors.red),
//                  recognizer: _TapRecognizer,
                ),
              ],
            ),),
            RaisedButton(child:
              //漂浮按钮，带有默认的阴影和灰色的背景
              Text("点击试试看"),
              onPressed: _ButtonClickAction,
              textColor: Colors.white,
              color: Colors.red,
              padding: EdgeInsets.all(30),
              //圆角设置
              shape: CircleBorder(
                side: BorderSide(
                  color: Colors.white,
                )
              ),
            ),
            FlatButton(
              //扁平按钮，默认背景透明并不带阴影
              child: Text("FlatButton"),
              onPressed: _ButtonClickAction,
              textColor: Colors.blue,
              color: Colors.white,
              //带边线的长方形边框
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.lightBlue,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ),
            OutlineButton(
              // 默认有一个边框，不带阴影且背景透明，按下后边框颜色会变亮，同时出现背景和阴影
              child: Text("OutLineButton"),
              onPressed: _ButtonClickAction,
              textColor: Colors.blue,
              color: Colors.yellow,
              //设置带有圆角的矩形
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.limeAccent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),

              ),
            ),
            FlatButton(
              textColor: Colors.green,
              color: Colors.red,
              child: Text("你好"),
              //两端都是半圆的边框
              shape: StadiumBorder(),
              onPressed: _ButtonClickAction,
            ),
            IconButton(
              //“是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景”
              icon: Icon(Icons.thumb_up),
              onPressed: _ButtonClickAction,
            ),
          ],
        ),
      ),

    );
  }
}