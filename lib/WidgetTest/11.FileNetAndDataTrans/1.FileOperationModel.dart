/*
* FileOperationModel created by zhangjiang 
* on 2020/4/13 11:22 PM
* copyright on zhangjiang
*/
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class FileOperationModel extends StatefulWidget {
  FileOperationModel({Key key}) : super(key: key);

  @override
  _FileOperationModelState createState() => new _FileOperationModelState();
}

class _FileOperationModelState extends State<FileOperationModel> {

  int _counter;

  //获取路径
  Future<File> _getLocalPath() async{
    String path = (await getApplicationDocumentsDirectory()).path;
    return new File("$path/counter.txt");
  }

  //读取文字内容
  Future<int> _readCounter() async{
    try{
      File file = await _getLocalPath();
      String content = await file.readAsString();
      return int.parse(content);
    }on FileSystemException {
      return 0;
    }
  }

  //刷新文件中的数字
  Future<Null> _changeCounter() async{
    setState(() {
      _counter++;
    });
    File file = await _getLocalPath();
    await file.writeAsString("$_counter");
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _readCounter().then((value){
      print("获取的count的值==$value");
      setState(() {
        _counter = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FileOperationModel"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("点击次数$_counter"),
              TextButton(
                child: Text("开始点击"),
                onPressed: _changeCounter,
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}