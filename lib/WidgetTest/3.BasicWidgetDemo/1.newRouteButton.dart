
import 'package:flutter/material.dart';

//创建一个没有状态的widget
class NewRoute extends StatelessWidget {

//  void _TapRecognizer() {
//
//  }

  void _ButtonClickAction() {
    print("开始点击了");
  }

  /*
  “const FlatButton({
  ...
  @required this.onPressed, //按钮点击回调
  this.textColor, //按钮文字颜色
  this.disabledTextColor, //按钮禁用时的文字颜色
  this.color, //按钮背景颜色
  this.disabledColor,//按钮禁用时的背景颜色
  this.highlightColor, //按钮按下时的背景颜色
  this.splashColor, //点击时，水波动画中水波的颜色
  this.colorBrightness,//按钮主题，默认是浅色主题
  this.padding, //按钮的填充
  this.shape, //外形
  @required this.child, //按钮的内容
})”
  * */

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
                  style: TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    //不设置的时候默认为color
                    decorationColor: Colors.blue,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
//                  recognizer: _TapRecognizer,
                ),
              ],
              ),
            ),
            Builder(
              builder: (context){
                RenderBox box = context.findRenderObject();
                final Shader linearGradinet = LinearGradient(colors: [Colors.purple,Colors.blue]).createShader(
                  Rect.fromLTWH(0, 0, box?.size?.width, box?.size?.height)
                );
                return Container();
              },
            ),
            RaisedButton(
              //漂浮按钮，带有默认的阴影和灰色的背景
              child:Text("点击试试看"),
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
            RaisedButton.icon(
              //带图标的按钮
              onPressed: _ButtonClickAction,
              icon: Icon(Icons.send),//Icons.add   Icons.info
              label: Text("发送"),
              textColor: Colors.blue,
              color: Colors.white,
            ),
            //自定义按钮
            RaisedButton(
              color: Colors.blue,
              hoverColor:Color(0x333333),
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text('Submit'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              //点击事件是一个匿名函数
              onPressed: (){},
            ),
          ],
        ),
      ),

    );
  }
}