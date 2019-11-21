import 'package:flutter/material.dart';

class FormsModelTest extends StatefulWidget {
  FormsModelTest({Key key}) : super(key:key);

  @override
  _FormsModelState createState() => new _FormsModelState();
}


class _FormsModelState extends State<FormsModelTest> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
//        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "用户名",
                hintText:"请输入用户名",
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.phone,
              //限制输入展示
//                  maxLength: 8,
//                  maxLengthEnforced: true,
              //带有参数的回调
              onChanged: (value){
                print("当前的变化值$value");
              },
              //不会带有任何参数
              onEditingComplete: (){
                print("编辑结束");
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock),
              ),
              //密码输入加密处理
              obscureText: true,
              keyboardType: TextInputType.text,
            ),

          ],
        ),
      ),
    );
  }
}

