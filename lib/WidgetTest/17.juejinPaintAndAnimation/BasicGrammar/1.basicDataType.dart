import 'dart:async';

import 'package:flutter/material.dart';

class ZJBasicGrammarTest extends StatefulWidget {
  const ZJBasicGrammarTest({Key key}) : super(key: key);

  @override
  State<ZJBasicGrammarTest> createState() => _ZJBasicGrammarTestState();
}

class _ZJBasicGrammarTestState extends State<ZJBasicGrammarTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("你好"),
      ),
      body: Container(

      ),
    );
  }

  void showName({int length = 3}){

    int a = 2022;
    //转化为对应的进制数据
    print(a.toRadixString(2));
    print(a.toRadixString(16));

    //字符串解析的时候 也可以指定解析的进制
    print(int.parse("1234",radix: 16));
    print(int.parse("zhangjiang",radix: 32));

    //字符串
    String b = "123";
    String c = "32423";
    String d = '23432';
    //字符串拼接 使用 + 号
    print(b + c + d);

    //多个字符拼接可以使用${}的方式,当只有一个变量名时 可以直接使用 $变量名 的方式
    print("你好 $b 大家好 $c 才是真的好 $d");

    //字符串可以通过下标来直接访问，下标从0开始  length返回字符串的长度
    //substring 方法用来截取字符串，入参包括 起始索引和结束索引
    // trim 用于去除首尾 空格符 trimLeft 和 trimRight 只去除一端的空格符
    // toUpperCase  toLowerCase  字符串转换设置大小写
    // startsWith   endsWith    contains  用于判断字符串包含、以xxx开头、以xxx结尾
    // replaceAll 对字符串进行替换 split 对字符串进行分割操作

  }
}

class Vec2  implements Calculate {
  double x;
  double y;

  String _name;

  Vec2({this.x = 0, @required this.y, String name}): _name = name;

  /// 简单模式获取 对应类信息
  String getInfo() => "Vec2($x,$y)";

  /// get  set 关键字就是一个语法糖 对成员变量简单处理的一个操作。
  String get info => "Vec2";

  @override
  void add() {
    // TODO: implement add
  }

  @override
  void multical() {
    // TODO: implement multical
  }




  /// final 修饰的成员变量不能进行再次修改
  /// static 修饰成员变量 只能通过类来进行访问，不依附于对象
}


/// 实现接口
abstract class Calculate {
  /// 加
  void add();

  /// 减
  void multical();
}

class Shape {
  Vec2 center;

  Shape(this.center);

  void move(){
    center.x += 10;
    center.y += 10;
  }

  void rotate(){
    print("开始旋转");
  }
}

class Rectangle extends Shape {

  double width;
  double height;

  Rectangle(Vec2 center,{this.width = 10,this.height = 10}) : super(center);


  void draw(){
    String info = "绘制矩形，中心点(${center.x},${center.y})";
    print(info);
  }

}




class A {
  final String name;

  A(this.name);

  void run() {
    print("run a");
  }
}


class B {
  final String name;
  B(this.name);

  void run() {
    print("run b");
  }

  void log(){
    print("log B");
  }
}

// extends 关键字后 作为类对待 表示继承
// implements 关键字后 作为接口对待  表示接口 其中的成员变量必须实现get方法，成员方法必须重写 避免继承的二义性
// with 混入


class C implements A , B  {
  @override
  void log() {
    // TODO: implement log
    print("我是C");
  }

  @override
  // TODO: implement name
  String get name => "哈哈哈哈";

  @override
  void run() {
    print("C");
  }

}




mixin Position{
  Vec2 vec2 = Vec2(x:0,y:0);

}


mixin Moveable on Position {
  double speed = 10;

  void move(){
    vec2.x += speed;
    vec2.y += speed;
    print("数据展示详情${vec2.x},${vec2.y}");
  }
}

/// 定义回调方法
typedef DCallBack = void Function(String value);

class D with Position, Moveable {

  final void Function(String value) hook;

  String name;

  D(this.name,{this.hook});


}

class E {

  D data;

  E(this.data);

  void showData(String name){
    data.hook(name);
  }

}

class TestE {

  void test(){
    D testD = D("hahah",hook: (String name){
      print("我来了哈哈哈哈 $name");
    });
    E show = E(testD);
    show.showData("hahah");
  }

}


/// 异步数据的处理
class GetLocalFile {

  StreamSubscription<List<int>> subscription;
  int fileLength = 0;
  int counter = 0;

  Duration data ;

  void doTask2() async {
    // File file = File(path.join(Director.current.path,"assets","Jane Eyre.txt"));
    // fileLength = await file.length();
    // print("开始读取文件");
    //
    // Stream<List<int>> stream = file.openRead();
    // subscription = stram.listen(_onData,onDone:_onDone);
  }

  void _onData(List<int> bytes){
    counter += bytes.length;
    double progress = counter / fileLength * 100;
    DateTime time = DateTime.now();
    String timeStr = "[${time.hour}:${time.minute}:${time.second}:${time.millisecond}]";
    print(timeStr + '=' * (progress ~/ 2) + '[${progress.toStringAsFixed(2)}%]');
    if (progress >= 50){
      subscription.cancel();
    }
  }

  void _onDone(){
    print("文件读取完毕");
  }
}



class ZTValueChangeTest extends StatefulWidget {
  ZTValueChangeTest({Key key}) : super(key: key);

  @override
  State<ZTValueChangeTest> createState() => _ZTValueChangeTestState();
}

class _ZTValueChangeTestState extends State<ZTValueChangeTest> {

  ValueNotifier<Duration> duration = ValueNotifier(Duration.zero);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: duration, builder: (context,value,__){
      return Container();
    });
  }
}











