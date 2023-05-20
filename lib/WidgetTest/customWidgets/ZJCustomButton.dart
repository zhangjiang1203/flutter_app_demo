import 'package:flutter/material.dart';

class ZJCustomButton extends StatefulWidget {
  const ZJCustomButton({Key key}) : super(key: key);


  //定义支持的属性


  @override
  State<ZJCustomButton> createState() => _ZJCustomButtonState();
}

class _ZJCustomButtonState extends State<ZJCustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){}, child: Text("data"));
  }
}
