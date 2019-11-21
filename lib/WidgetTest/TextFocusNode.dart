import 'package:flutter/material.dart';

class TextFocusModel extends StatefulWidget {

  TextFocusModel({Key key}) : super(key:key);

  @override
  _TextFocusState createState() => new _TextFocusState();

}

class _TextFocusState extends State<TextFocusModel> {

  FocusNode node1 = new FocusNode();
  FocusNode node2 = new FocusNode();
  FocusScopeNode scopeNode ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FocusText"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              autofocus: true,
              focusNode: node1,//关联node1
              decoration: InputDecoration(
                hintText: "焦点1",
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            TextField(
              focusNode: node2,//关联node2
              decoration: InputDecoration(
                hintText: "焦点2",
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("切换焦点2"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){
                    //第一种方式
                    FocusScope.of(context).requestFocus(node2);
                    //第二种写法,就是把第一步拆成两步走
                    if (null == scopeNode) {
                      scopeNode = FocusScope.of(context);
                    }
                    scopeNode.requestFocus(node2);
                  },
                ),
                FlatButton(
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Text("关闭键盘"),
                  onPressed: (){
                    //  所有编辑框都失去焦点，键盘就会关闭
                    node2.unfocus();
                    node1.unfocus();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}