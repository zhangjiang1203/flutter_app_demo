import 'package:flutter/material.dart';

class TextFocusModel extends StatefulWidget {

  TextFocusModel({Key? key}) : super(key:key);

  @override
  _TextFocusState createState() => new _TextFocusState();

}

class _TextFocusState extends State<TextFocusModel> {
  //监控焦点设置
  FocusNode node1 = new FocusNode();
  FocusNode node2 = new FocusNode();
  FocusNode node3 = new FocusNode();
  late FocusScopeNode scopeNode ;
  //是否在编辑
  bool isEditing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //动态修改下划线展示颜色
    node3.addListener((){
      setState(() {
        isEditing = node3.hasFocus;
      });
    });
  }


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
              focusNode: node1,//关联node2
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
                TextButton(
                  child: Text("切换焦点2",style: TextStyle(color: Colors.blue),),
                  // style: ButtonStyle(backgroundColor:Colors.blue,textStyle: ),
                  // textColor: Colors.white,
                  onPressed: (){
                    //第一种方式
                    FocusScope.of(context).requestFocus(node2);
//                    //第二种写法,就是把第一步拆成两步走
//                    if (null == scopeNode) {
//                      scopeNode = FocusScope.of(context);
//                    }
//                    scopeNode.requestFocus(node2);
                  },
                ),
                // (
                //   color: Colors.redAccent,
                //   textColor: Colors.white,
                //   child: Text("关闭键盘"),
                //   onPressed: (){
                //     //  所有编辑框都失去焦点，键盘就会关闭
                //     node2.unfocus();
                //     node1.unfocus();
                //   },
                // ),
              ],
            ),
            //使用theme设置textfield的
            Theme(
              data: Theme.of(context).copyWith(
                  hintColor: Colors.grey,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.grey[700],
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  )
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "设置样式",
                  hintText: "输入文字",
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            //隐藏textfield的下划线
            Container(
              child: TextField(
                //设置焦点获取和使用设置
                focusNode: node3,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "自定义",
                  hintText: "下划线设置",
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none,
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  //设置一个border 宽度1像素
                  bottom: BorderSide(color: isEditing ? Colors.blue : Colors.grey[200]!,width: 1)
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}