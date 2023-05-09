/*
* HttpClientModelTest created by zj 
* on 2020/4/18 4:02 PM
* copyright on zhangjiang
*/

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpClientModelTest extends StatefulWidget {
  HttpClientModelTest({Key key}) : super(key: key);

  @override
  _HttpClientModelTest createState() => _HttpClientModelTest();
}

class _HttpClientModelTest extends State<HttpClientModelTest> {

  bool _loading = false;
  String _text = "";


  void requestStep() async {
    //声明一个httpclient
    HttpClient httpClient = new HttpClient();
    //创建url
    Uri url = Uri(scheme: "https",host: "flutterchina.club",queryParameters: {"name":"123"});
    //获取http设置请求头，这里可以设置get  post put等方法
    HttpClientRequest request = await httpClient.getUrl(url);
    request.headers.add("user-agent", "text");
    //获取返回的内容
    HttpClientResponse response = await request.close();
    //获取对应的数据
    String content = await response.transform(utf8.decoder).join();
    //请求结束
    httpClient.close();
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  }
  
  void _getBaiduNetContent() async{
    setState(() {
      _loading = true;
      _text = "正在请求……";
    });
    try{
      //在模拟器上，这个app竟然无法联网，
      HttpClient client = new HttpClient();
      HttpClientRequest request = await client.getUrl(Uri.parse("http://blog.wtlucky.com/blog/2015/02/26/create-private-podspec/"));
      request.headers.add("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.162 Safari/537.36");
      HttpClientResponse response = await request.close();
      _text = await response.transform(utf8.decoder).join();
      print("获取的百度内容网页===$_text");

      client.close();
    } catch (e) {
      _text = "请求失败:$e";
    }finally{
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HttpClientModelTest"),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextButton(
                  onPressed: (){
                    _getBaiduNetContent();
                  },
                  child: Text("开始请求信息"),
                ),
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  secondChild: Container(
                    width: MediaQuery.of(context).size.width-50,
                    child: Text(_text.replaceAll(new RegExp(r"\s"), "")),
                  ),
                  crossFadeState:_loading ? CrossFadeState.showFirst : CrossFadeState.showSecond ,
                ),

              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}