/*
* CustomTextSpanModel created by zhangjiang 
* on 2020/4/6 12:58 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJRegExpTool.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';
class CustomTextSpanModel extends StatefulWidget {
  CustomTextSpanModel({Key key}) : super(key: key);

  @override
  _CustomTextSpanModelState createState() => _CustomTextSpanModelState();
}

class _CustomTextSpanModelState extends State<CustomTextSpanModel> {

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
    //测试匹配的值
//    String testStr = '''发哈恢复发货https://www.baidu.com/\n我寄顺丰你说的回复is返回时代峰峻刻录机，
//    https://www.sina.com.cn/,\n就是正,阿斯顿发生解放路https://tensorflow.google.cn/你好''';
//
//    var result = ZJRegExpTool.allMatchUrl(testStr);
//    for(var x in result){
//      print("当前的值为===${x.group(0)}");
//    }

//    String name = "你好";
//
//    var isChinese = ZJRegExpTool.isChinese(name);
//    print("是否是中文==$isChinese");
//
//    List<Widget> contentList = new List();
//    RegExp url = new RegExp(r"((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
//    List listString = testStr.split(url);
//    print("当前的liststr ==== $listString");
//    List listUrl = new List();
//
//    Iterable<Match> matches = url.allMatches(testStr);
//
//    int urlIndex = 0;
//
//    for (Match m in matches) {
//      print("当前的值为===${m.group(0)}");
//      listUrl.add(m.group(0));
//
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CustomTextSpanModel"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("你好"),
              MyRichTextModel(text: "发哈恢复发货https://www.baidu.com/",style: TextStyle(color: Colors.blue),),
              MyRichTextModel(text: '''发哈恢复发货https://www.baidu.com/\n我寄顺丰你说的回复is返回时代峰峻刻录机，
              https://www.sina.com.cn/,\n就是正,阿斯顿发生解放路https://tensorflow.google.cn/你好''',style: TextStyle(color: Colors.red),),
              MyRichTextModel(text: "发哈恢复发货https://www.baidu.com/,我就是这样打算的",style: TextStyle(color: Colors.blue),),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class MyRichTextModel extends StatefulWidget {
  MyRichTextModel({
    Key key,
    this.text,
    this.style,
  }):super(key:key);

  final String text;
  final TextStyle style;

  @override
  _MyRichTextState createState() =>  _MyRichTextState();

}

class _MyRichTextState extends State<MyRichTextModel> {

  TextSpan _span;

  /// 解析文本中的url
  TextSpan _parseText(String text){
    List<InlineSpan> contentList = new List();

    RegExp url = new RegExp(r"((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
    List listString = text.split(url);

    List listUrl = new List();
    Iterable<Match> matches = ZJRegExpTool.allMatchUrl(text);
    int urlIndex = 0;
    for (Match m in matches) {
      listUrl.add(m.group(0));
    }

    for (var i = 0;i<listString.length;i++){
      if(listString[i] == ''){
        contentList.add(TextSpan(text: listUrl[urlIndex],style: widget.style));
        urlIndex++;
      }else{
        contentList.add(TextSpan(text: listString[i],style: ZJTextStyleTool.black_20));
      }
    }

    //识别其中的url链接，进行特殊样式设置
    return TextSpan(
      children:contentList.map((e){
        return e;
      }).toList(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
//    print("当前初始化的值===${widget.text}");
    _span = _parseText(widget.text);
    super.initState();
  }

  @override
  void didUpdateWidget(MyRichTextModel oldWidget) {
    // TODO: implement didUpdateWidget
    if(oldWidget.text != widget.text){
       _span = _parseText(widget.text);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(text: _span,);
  }
}