/*
* JosnToModelTest created by zj 
* on 2020/4/24 9:43 AM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'dart:convert';
import  '9.UserJsonModelChange.dart';

class JosnToModelTest extends StatefulWidget {
  JosnToModelTest({Key key}) : super(key: key);

  @override
  _JosnToModelTest createState() => _JosnToModelTest();
}

class _JosnToModelTest extends State<JosnToModelTest> {
  String _name;
  Person _person;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String jsonStr = '[{"name":"zhang","age":"18","email":"798787@qq.com"},{"name":"wang","age":"90","email":"79878787@qq.com"}]';
    List items = json.decode(jsonStr);
    _name = items[0]['name'];

    //自己序列化的json解析
    String personStr = '{"name":"hahaha","email":"9799998@qq.com","age":18}';
    _person = Person.fromJson(json.decode(personStr));

    User user = User.fromJson(json.decode(personStr));
    print("当前解析的类===${user.name},${user.age},${user.email}");
    Map<String,dynamic> jsonStr1 = user.toJson();
    print("model To json ===$jsonStr1");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JosnToModelTest"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('系统直接json解析:$_name'),
              Text('序列化json解析:${_person.name}'),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class Person {
  Person(this.name,this.email);

  final String name;
  final String email;

  Person.fromJson(Map<String,dynamic> json): name = json['name'],email = json['email'];
  Map<String ,dynamic> toJson() => <String,dynamic>{"name":name,"email":email};

}
