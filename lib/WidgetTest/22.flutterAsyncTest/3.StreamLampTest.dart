import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class StreamLampNameTest extends StatefulWidget {
  const StreamLampNameTest({Key? key}) : super(key: key);

  @override
  State<StreamLampNameTest> createState() => _StreamLampNameTestState();
}

class _StreamLampNameTestState extends State<StreamLampNameTest> {
  /// 设置streamController
  final StreamController<SignalState> streamController = StreamController();
  SignalState _signalState = SignalState(count: _kDenialMaxCount, type: SignalType.denial);
  late StreamSubscription<SignalState> _subscription;
  
  @override
  void initState() {
    super.initState();
    _subscription = streamController.stream.listen(emit);
    streamController.add(_signalState);
  }
  
  void emit(SignalState state) async{
    _signalState = state;
    setState(() { });
    
    await Future.delayed(const Duration(seconds: 1));
    streamController.add(state.next());
    
  }
  
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamController.close();
  }

  void _toggle() {
    if(_subscription.isPaused){
      _subscription.resume();
    }else{
      _subscription.pause();
    }
    /// 全部刷新
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("红绿灯展示"),),
      body: Column(
        children: [
          StreamLampTest(state: _signalState),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: _toggle,
            child: Icon(_subscription.isPaused ? Icons.play_circle_outlined : Icons.pause_circle),
          )
        ],
      ),
    );
  }
}




class StreamLampTest extends StatelessWidget {

  final SignalState state;

  const StreamLampTest({Key? key, required this.state}) : super(key: key);

  Color get activeColor{
    switch (state.type){
      case SignalType.allow:
        return Colors.green;
      case SignalType.wait:
        return Colors.yellow;
      case SignalType.denial:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Container(
         padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
         decoration: BoxDecoration(
           color: Colors.black,borderRadius: BorderRadius.circular(30),
         ),
         child: Wrap(
           alignment: WrapAlignment.center,
           crossAxisAlignment: WrapCrossAlignment.center,
           spacing: 15,
           children: [
             Lamp(color: state.type == SignalType.denial ? activeColor : null),
             Lamp(color: state.type == SignalType.denial ? activeColor : null),
             Lamp(color: state.type == SignalType.denial ? activeColor : null),
           ],
         ),
       ),
        Text(state.count.toString(),style: TextStyle(color: activeColor,fontSize: 45,fontWeight: FontWeight.bold))
      ],
    );
  }
}


/// 构建xiao元素
class Lamp extends StatelessWidget {

  final Color? color;

  const Lamp({Key? key,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color ?? Colors.grey.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
    );
  }
}

/// 定义最大时间
const int _kAllowMaxCount = 10;
const int _kWaitMaxCount = 3;
const int _kDenialMaxCount = 10;

/// 定义数据
class SignalState {
  final int count;
  final SignalType type;

  SignalState({required this.count,required this.type});

  SignalState next() {
    if(count > 1){
      return SignalState(count: count - 1, type: type);
    }else{
      switch(type) {
        case SignalType.allow:
          return SignalState(count: _kDenialMaxCount,type: SignalType.denial);
        case SignalType.wait:
          return SignalState(count: _kAllowMaxCount,type: SignalType.allow);
        case SignalType.denial:
          return SignalState(count: _kWaitMaxCount,type: SignalType.wait);
      }
    }
  }

}

enum SignalType {
  allow,//绿灯
  wait,//黄灯
  denial,//红灯
}
