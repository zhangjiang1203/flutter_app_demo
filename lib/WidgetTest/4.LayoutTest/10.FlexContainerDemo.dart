/*
* 10.FlexContainerDemo created by zj 
* on 2020/6/22 9:58 AM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class FlexContainerDemo extends StatefulWidget{

  FlexContainerDemo({Key? key}):super(key:key);

  @override
  _FlexContainerState createState() => _FlexContainerState();
}

class _FlexContainerState extends State<FlexContainerDemo>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('FlexButton'),
      ),
      body: Column(
        children: <Widget>[
          //自动撑开
          Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text('啊哈哈哈'),
                //设置对齐方式之后就会全部撑开
                alignment: Alignment.center,
              ),
              //不设置宽，根据上下widget自动撑开
              Flexible(
                child: Container(
                  color: Colors.green,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text('哈哈哈'),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text('我就是我，不一样的烟火'),
              )
            ],
          ),
          SizedBox(height: 20,),
          //设置比例约束,下面的widget必须设置对应的对齐方式
          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.greenAccent,
                  child: Text('我是1/6'),
                ),
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.pink,
                  child: Text('我是3/6'),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blueAccent,
                  child: Text('我是1/6'),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          //spacer设置权重组件,中间设置对应的对齐方式
          Row(
            children: <Widget>[
              Container(width: 100,height: 50,color: Colors.green,),
              Spacer(flex: 2,),
              Container(width: 100,height: 50,color: Colors.blue,),
              Spacer(flex: 2,),
              Container(width: 100,height: 50,color: Colors.red,),
            ],
          ),
          SizedBox(height: 20,),
          //设置固定的宽高比,宽为高的2倍
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 2/1,
              child: Container(color: Colors.red,child: Text('我是内部的，'),),
            ),
          )
        ],
      ),
    );
  }
}