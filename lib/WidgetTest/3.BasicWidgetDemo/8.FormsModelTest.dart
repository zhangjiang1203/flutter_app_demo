import 'package:flutter/material.dart';

class FormsModelTest extends StatefulWidget {
  FormsModelTest({Key key}) : super(key:key);

  @override
  _FormsModelState createState() => new _FormsModelState();
}


class _FormsModelState extends State<FormsModelTest> {

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _pwdcontroller = new TextEditingController();
  GlobalKey _vaildKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
//        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 24),
        child: Form(
          key: _vaildKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText:"请输入用户名",
                  prefixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.phone,
                //带有参数的回调
                validator: (v){
                  return v.trim().length > 0 ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdcontroller,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                //密码输入加密处理
                obscureText: true,
                keyboardType: TextInputType.text,
                validator: (v){
                  return v.trim().length > 5 ? null : "密码不能少于5位";
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      //注意context的传入和下面的实现
                      child: Builder(builder: (context){
                        return TextButton(
                          child: Text("开始点击"),
                          onPressed: (){
                            // 此处不能通过
//                          Form.of(context)不能通过这种方式获取对应的FormState，这里的context
                            //“Form.of(context)是根据所指定context向根去查找，
                            // 而FormState是在FormTestRoute的子树中，所以不行。
                            // 正确的做法是通过Builder来构建登录按钮，Builder会将widget节点的context作为回调参数
                            //检查切换按钮，使用了builder来查找对应的context
//                            Form.of(context).validate() 这样子才行的通
                            if( (_vaildKey.currentState as FormState).validate()){
                              print("符合规则");
                            }
                          });
                    }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /*body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "用户名",
                hintText:"请输入用户名",
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.phone,
              //带有参数的回调
              validator: (v){
                return v.trim().length > 0 ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock),
              ),
              //密码输入加密处理
              obscureText: true,
              keyboardType: TextInputType.text,
              validator: (v){
                return v.trim().length > 5 ? null : "密码不能少于5位";
              },
            ),

          ],
        ),
      ),*/
    );
  }
}

