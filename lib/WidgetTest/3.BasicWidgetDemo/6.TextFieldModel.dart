import 'package:flutter/material.dart';


class TextFieldModelTest extends StatefulWidget {
  //调用初始化
  TextFieldModelTest({Key? key}): super(key:key);

  _TextFieldState createState() => new _TextFieldState();
}

class _TextFieldState extends State<TextFieldModelTest> {

  final _controller = TextEditingController() ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = "我就是我";
    _controller.selection = TextSelection(
      baseOffset: 1,
      extentOffset: _controller.text.length,
    );
    _controller.addListener((){
      print(_controller.text);
    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("TextFieldTest") ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //设置textField
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText:"请输入用户名",
                    prefixIcon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.phone,
                  //限制输入展示
//                  maxLength: 8,
//                  maxLengthEnforced: true,
                  //带有参数的回调
                  onChanged: (value){
                    print("当前的变化值$value");
                  },
                  //不会带有任何参数
                  onEditingComplete: (){
                    print("编辑结束");
                  },
                  //长按输入框支持的功能
                  // toolbarOptions: ToolbarOptions(
                  //   copy: true,
                  //   cut: true,
                  //   paste: true,
                  //   selectAll: true
                  // ),
                  // buildCounter:(BuildContext context, {int currentLength,int maxLength,bool isFocused,}){
                  //   return Text("$currentLength/$maxLength");
                  // },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  //密码输入加密处理
                  obscureText: true,
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 0,top: 10,right: 0,bottom: 10),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "你好",
                    hintText: "请输入文字",
                    prefixIcon: Icon(Icons.person),
                  ),
//                  onChanged: (value){
//                    print(_controller.text);
//
//                  },

                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: 0,top: 0,right: 0,bottom: 0),
            ),


          ],
        ),
      ),
    );
}
}