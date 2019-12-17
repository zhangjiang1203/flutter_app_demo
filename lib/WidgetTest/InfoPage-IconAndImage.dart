
import 'package:flutter/material.dart';
class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,//接收一个text参数
  }) : super(key:key);

  final String text;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context,"我是返回值"),
                child: Text("我是返回"),
              ),
              //加载本地资源
              Image(
                image: AssetImage("assets/images/goods_share_btn_h5_weixin_fri.png"),
                width: 60,
              ),
              Image.asset("assets/images/goods_share_btn_weiixn.png",width: 60,),
              //加载网络资源图片
              Image(
                image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100.0,
              ),
              Image.network(
                "http://b-ssl.duitang.com/uploads/blog/201312/04/20131204184148_hhXUT.jpeg",
                width: 200.0,),
              Image.network(
                "http://e.hiphotos.baidu.com/image/pic/item/10dfa9ec8a1363279e1ed28c9b8fa0ec09fac79a.jpg",
                width: 200.0,),

              Row(
                mainAxisSize:MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessible,color: Colors.green,),
                  Icon(Icons.error,color: Colors.green,),
                  Icon(Icons.fingerprint,color: Colors.green,),
                ],
              ),

            ].toList(),
          ),
        ),
      ),
    );
  }
}
