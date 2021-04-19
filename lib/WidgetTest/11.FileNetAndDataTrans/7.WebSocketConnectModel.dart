/*
* WebSocketConnectModel created by zj 
* on 2020/4/21 5:03 PM
* copyright on zhangjiang
*/

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketConnectModel extends StatefulWidget {
  WebSocketConnectModel({Key key}) : super(key: key);

  @override
  _WebSocketConnectModel createState() => _WebSocketConnectModel();
}

class _WebSocketConnectModel extends State<WebSocketConnectModel> {
  TextEditingController editingController = new TextEditingController();
  IOWebSocketChannel channel;
  String _text = "";
  String _response = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    channel = new IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WebSocketConnectModel"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Form(
                child: new TextFormField(
                  controller: editingController,
                  decoration: InputDecoration(labelText: "发送消息"),
                ),
              ),
              Container(
                child:  StreamBuilder(
                  stream: channel.stream,
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      _text = "网络不通";
                    }else if (snapshot.hasData){
                      _text = 'echo:' + snapshot.data;
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: new Text(_text),
                    );
                  },
                ),
              ),

              Container(
                child: Text(_response),
                height: 200,
              ),


            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: new FloatingActionButton(
          onPressed: _sendMessage,
          tooltip: 'send Message',
          child: new Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if(editingController.text.isNotEmpty) {
      //发送数据到服务器
      // channel.sink.add(editingController.text);
    }
  }

  void _socketRequest() async {
    //建立连接
    var socket = await Socket.connect("baidu.com", 80);
    // 根据协议发送请求头
    socket.writeln("GET/HTTP/1.1");
    socket.writeln("Host:baidu.com");
    socket.writeln("Connection:close");
    socket.writeln();
    //开始发送
    await socket.flush();
    //这个不知为何报错，原文是传的格式不正确
//    _response = await socket.transform(base64.decoder).join();
    await socket.close();

  }


  @override
  void dispose() {
    // TODO: implement dispose
    editingController.dispose();
    //关闭socket
    channel.sink.close();
    super.dispose();
  }
}