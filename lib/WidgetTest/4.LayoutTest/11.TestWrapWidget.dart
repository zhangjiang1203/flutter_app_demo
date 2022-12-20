/// @author[zhangjiang]
/// @version[创建日期，2022/12/20 10:43]
/// @function[功能简介 ]

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/10.CustomCombineWidget/1.GradientButtonModel.dart';

class ZJWrapTestWidget extends StatefulWidget {
  const ZJWrapTestWidget({Key key}) : super(key: key);

  @override
  State<ZJWrapTestWidget> createState() => _ZJWrapTestWidgetState();
}

class _ZJWrapTestWidgetState extends State<ZJWrapTestWidget> {

  String value1;
  String value2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置Wrap"),
      ),
      body: Container(
        alignment: Alignment.center,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ShowTestAuthorWidget(tapCallback: (String value){
              print("开始点击回调===$value");
              value1 = value;
            }),
            ShowTestAuthorWidget(tapCallback: (String value){
              print("开始点击回调===1111$value");
              value2 = value;
            }),
            Spacer(),

            Container(
              width: 300,
              decoration: BoxDecoration(
                color:Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: TextButton(
                  onPressed: (){},
                  child: Text("我是测试一",style: TextStyle(color: Colors.white),)
              ),
            ),

            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}


typedef ShowTestAuthorCallBack = void Function(String title);

class ShowTestAuthorWidget extends StatelessWidget {
  ShowTestAuthorWidget({
    @required this.titles,
    this.height,
    this.borderRadius,
    this.tapCallback,
  });

  final List<String> titles;
  final double height;
  final BorderRadius borderRadius;
  final ShowTestAuthorCallBack tapCallback;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("你好"),
        Wrap(
          spacing: 5,
          runSpacing: -2,
          children:titles.map((e) => ActionChip(
                  label: Text(e,style: TextStyle(color: Colors.black),),
                  onPressed:(){this.tapCallback(e);},
                  backgroundColor: Colors.blue,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5))
          ).toList(),
        ),
      ],
    );
  }

}
