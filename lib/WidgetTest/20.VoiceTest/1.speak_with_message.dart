/**
 * @author[zhangjiang]
 * @version[创建日期，2022/10/18 16:23]
 * @function[功能简介 ]
 **/

import 'package:flutter/material.dart';
import 'tt_manager.dart';

class ZJSpeakMessageWidget extends StatefulWidget {
  ZJSpeakMessageWidget({Key? key}) : super(key: key);

  @override
  State<ZJSpeakMessageWidget> createState() => _ZJSpeakMessageWidgetState();
}

class _ZJSpeakMessageWidgetState extends State<ZJSpeakMessageWidget> {

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.text = "你好测试数据";
    _textEditingController.addListener(() {
      print("开始修改text");
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("语音播报"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
                labelText: "你好",
                hintText: "请输入文字",
                prefixIcon: Icon(Icons.person),
              ),
            ),
          TextButton(
              onPressed: startSpeakMessage,
              child: Text("开始播报",style: TextStyle(fontSize: 16,color: Colors.blue),),
          )
        ],
      ),
    );
  }

  void startSpeakMessage(){
    String message = _textEditingController.text;

    TTManager().speak(message);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    TTManager().stop();
    super.dispose();
  }
}
