/*
* AnimatedCrossFadeModel created by zhangjiang 
* on 2020-03-20 00:01
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class AnimatedCrossFadeModel extends StatefulWidget {
  AnimatedCrossFadeModel({Key? key}) : super(key: key);

  @override
  _AnimatedCrossFadeModelState createState() => _AnimatedCrossFadeModelState();
}

class _AnimatedCrossFadeModelState extends State<AnimatedCrossFadeModel> {

  var myListStr = <String>[];

  getData() async{
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      myListStr = List.generate(50, (int index)=>"item is ${index+1}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimatedCrossFadeModel"),
        ),
        body: AnimatedCrossFade(
          duration: const Duration(microseconds: 300),
          crossFadeState: myListStr.isEmpty ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Center(
            child: CircularProgressIndicator(),
          ),
          secondChild:Container(
            child: ListView(
              children: myListStr.map((String s) => ListTile(
                key: Key(s),
                title: Text(s),
              ))
                  .toList(),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
        ),
    );

  }
}