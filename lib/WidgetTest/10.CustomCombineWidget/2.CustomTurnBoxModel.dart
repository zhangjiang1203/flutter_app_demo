/*
* CustomTurnBox created by zhangjiang 
* on 2020/4/2 11:07 PM
* copyright on zhangjiang
*/

import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTurnBoxModel extends StatefulWidget {
  CustomTurnBoxModel({Key? key}) : super(key: key);

  @override
  _CustomTurnBoxState createState() => _CustomTurnBoxState();
}

class _CustomTurnBoxState extends State<CustomTurnBoxModel> {
  double _turns = 0.0;
  late Timer countTime ;
  void autoTurn(){
    countTime = Timer.periodic(const Duration(milliseconds: 700), (timer){
      setState(() {
        _turns += 0.1;
      });
      print(_turns);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    countTime?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autoTurn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CustomTurnBox"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TurnBox(
                speed: 200,
                turns: _turns,
                child: Icon(Icons.refresh,size: 50,),
              ),
              TurnBox(
                speed: 800,
                turns: _turns,
                child: Icon(Icons.refresh,size: 100,),
              ),
              TextButton(
                child: Text('加速0.5'),
                onPressed: (){
                  setState(() {
                    _turns += 0.2;
                  });
                },
              ),
              TextButton(
                child: Text("减速0.5"),
                onPressed: (){
                  setState(() {
                    _turns -= 0.2;
                  });
                },
              )
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



class TurnBox extends StatefulWidget{

  TurnBox({
    Key? key,
    this.speed = 200,
    this.turns = 0.0,
    required this.child,
  }):super(key:key);

  final int speed;
  //旋转的圈数，一圈360度，
  final double turns;
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TurnsBoxState();
  }
}

class TurnsBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,lowerBound: -double.infinity,upperBound: double.infinity);
    controller.value = widget.turns;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }


  @override
  void didUpdateWidget(TurnBox oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.turns != widget.turns){
      controller.animateTo(
          widget.turns,
          duration:Duration(milliseconds:widget.speed ?? 200),
          curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RotationTransition(
      turns: controller,
      child: widget.child,
    );
  }
}