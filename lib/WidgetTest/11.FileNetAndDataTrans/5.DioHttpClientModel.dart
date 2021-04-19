/*
* DioHttpClientModel created by zj 
* on 2020/4/20 3:08 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

enum ResponseStatus {
  loading,
  success,
  fail,
}



class DioHttpClientModel extends StatefulWidget {
  DioHttpClientModel({Key key}) : super(key: key);

  @override
  _DioHttpClientModel createState() => _DioHttpClientModel();
}

class _DioHttpClientModel extends State<DioHttpClientModel> {
  //全局一个dio实例就可以，如果要区别设置请求头或者其他的配置，可以新建新的dio实例
  Dio _dio = new Dio();

  List<String> _showData;

  void _getMethod() async {
    showDialogContent(ResponseStatus.loading);
    Response response = await _dio.get("http://www.baidu.com");
    if(response.statusCode >= 200  && response.statusCode <= 210){
      Navigator.of(context).pop();
      showDialogContent(ResponseStatus.success);
    }else{
      Navigator.of(context).pop();
      showDialogContent(ResponseStatus.fail);
    }

    _dio.post("http://www.baidu.com",data: {"name":"zhangjiang","pwd":"password"});
    //发起多个并发请求，合并对应的请求数据
    var showName = await Future.wait([_dio.get(""),_dio.get("")]);

//    print(response.data.toString());
  }

  Future<Response> _getGitHubData() async{
    return _dio.get("https://api.github.com/orgs/flutterchina/repos");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DioHttpClientModel"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                child: Text("get请求"),
                onPressed: _getMethod,
              ),
              Expanded(
                child: FutureBuilder(
//                initialData: _showData,
                  future: _getGitHubData(),
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      Response response = snapshot.data;
                      if(snapshot.hasError){
                        return Text(snapshot.error.toString());
                      }
                      return ListView(
                        itemExtent: 44,
                        children: response.data.map<Widget>((e)=> ListTile(title: Text(e["full_name"]),)).toList(),
                      );
                    }
                    //设置大小，防止变形
                    return UnconstrainedBox(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void showDialogContent(ResponseStatus status) {
    //调用之前，其他的dialog dismiss掉

    String showTitle = "";
    Widget childWidget ;
    switch (status){
      case ResponseStatus.fail:
        showTitle = "加载失败";
        childWidget = Image.asset('assets/images/fail.png');
        break;
      case ResponseStatus.loading:
        showTitle = "加载中……";
        childWidget = CircularProgressIndicator();
        break;
      case ResponseStatus.success:
        showTitle = "加载成功";
        childWidget = Image.asset('assets/images/success.png');
        break;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext builder){
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              childWidget,
              Text(showTitle),
            ],
          ),
        );
      }
    );
    if(status == ResponseStatus.loading){
      return;
    }
    Future.delayed(const Duration(seconds: 1),(){
      Navigator.of(context).pop();
    });
  }
}