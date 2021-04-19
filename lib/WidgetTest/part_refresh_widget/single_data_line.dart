/*
* single_data_line created by zj 
* on 2020/9/28 10:17 AM
* copyright on zhangjiang
*/

import 'dart:async';
import 'package:flutter/material.dart';
import 'data_observer_widget.dart';
/*
* 在需要使用的时候，在state中添加 with MultDataLine ,这样就可以直接获取到getObserver的对象值，
* 根据对应的key进行数据流的传递和实现，
*  getObserver("key").addObserver((context, data) => Container(
            height: 80,
            color: Colors.green,
            child: Text("展示的数据===$data"),
          )),
* 修改对应的数据
*  getObserver("key").setData(showTitleList[Random().nextInt(4)]);
*
* 保证key值相同
* */

class SingleDataLine<T> {
  StreamController<T> _streamController;
  //设置当前的数据
  T currentValue;

  SingleDataLine([T initData]){
    currentValue = initData;
    _streamController = StreamController<T>();
    if (initData != null) {
      _streamController.add(initData);
    }
  }
  get outer => _streamController.stream;
  get inner => _streamController.sink;
  //设置数据
  void setData(T value){
    //同值过滤
    // if(value == currentValue) return;
    //防止关闭
    if(_streamController.isClosed) return;
    currentValue = value;
    inner.add(value);
  }
  ///构造对应的widget
  Widget addObserver({T initValue,DataBuildContext builder}){
    return DataObserverWidget<T>(initData: initValue,dataLine:this,builder:builder);
  }
  ///释放stream
  void dispose(){
    _streamController.close();
  }
}

///对多个stream做流程控制展示对应的数据
mixin MultDataLine{
  final Map<String,SingleDataLine> dataBus = Map();

  SingleDataLine<T> getObserver<T>(String key){
    if (!dataBus.containsKey(key)) {
      SingleDataLine<T> dataLine = new SingleDataLine<T>();
      dataBus[key] = dataLine;
    }
    return dataBus[key];
  }

  void dataLineDispose(){
    print("datalibe 释放了");
    dataBus.values.forEach((element) => element.dispose());
    dataBus.clear();
  }
}
