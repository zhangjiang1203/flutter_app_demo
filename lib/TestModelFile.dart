import 'package:flutter/material.dart';
//task() async {
//  try{
//    String id = await login();
//    String userInfo = await getUserInfo();
//    await saveUserInfo(userInfo);
//  } catch(e){
//    //错误处理
//  }
//}

//await必须用在async函数中，Future函数的返回值都是Future类型，使用链式函数进行调用，then方法防治进入回调地狱

class TestModel extends StatefulWidget {
  TestModel({Key? key,required this.title}) : super(key:key);

  final String title;
  //创建状态
  @override
  _TestModelState createState() => new _TestModelState();
}

class _TestModelState extends State<TestModel> {
  int name = 0;

  void _incrementCounter() {
    setState(() {
      name++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("nihao",style: Theme.of(context).textTheme.subtitle1)
          ],
        ),
      ),
    );
  }


}