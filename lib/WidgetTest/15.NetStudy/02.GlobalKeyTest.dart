/*
* 02.GlobalKeyTest created by zj 
* on 2020/12/10 10:07 AM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class TestGlobalKeyModel extends StatefulWidget {
  @override
  _TestGlobalKeyModelState createState() => _TestGlobalKeyModelState();
}

class _TestGlobalKeyModelState extends State<TestGlobalKeyModel> {

  GlobalKey _firstKey = GlobalKey();
  GlobalKey _secondKey = GlobalKey();
  GlobalKey _thirdKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _tapOnContainer(GlobalKey key){
    RenderBox _renderBox = key.currentContext.findRenderObject();
    Offset position = _renderBox.localToGlobal(Offset.zero);
    //获取当前的widget的大小
    print("当前的大小 ====${_renderBox.size},position=$position");// _renderBox.size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("globalKey获取当前widget的位置信息"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: ()=> _tapOnContainer(_firstKey),
                child: Container(
                  key: _firstKey,
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                ),
              ),
              GestureDetector(
                onTap: ()=> _tapOnContainer(_secondKey),
                child: Container(
                  key: _secondKey,
                  width: 80,
                  height: 80,
                  color: Colors.green,
                ),
              ),
              GestureDetector(
                onTap: ()=> _tapOnContainer(_thirdKey),
                child: Container(
                  key: _thirdKey,
                  width: 80,
                  height: 80,
                  color: Colors.pink,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
