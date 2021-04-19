/*
* HeroTransitionAnimationModel created by zhangjiang 
* on 2020-03-11 14:11
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/6.ScrollableDemo/4.SliverGridViewDemo.dart';

class HeroTransitionAnimationModel extends StatefulWidget {
  HeroTransitionAnimationModel({Key key}) : super(key: key);

  @override
  _HeroTransitionAnimationModelState createState() =>
      _HeroTransitionAnimationModelState();
}

class _HeroTransitionAnimationModelState
    extends State<HeroTransitionAnimationModel> {

//  Hero 重要的是设置对应的tag，在push前后要意义对应，push后的界面可以任意的设置界面展示内容

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HeroTransitionAnimationModel"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              InkWell(
                child: Hero(
                  tag: "transition_app_header",
                  child: ClipOval(
                    child: Image.asset("assets/images/star_name.png",width: 100,height: 100, fit: BoxFit.cover,),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,Animation animation,Animation secondaryAnimation){
                    return new FadeTransition(
                      opacity: animation,
                      child: SliverGridViewDemo(),
                    );
                  })
                  );
                },
              ),
              InkWell(
                child: Hero(
                  tag: "transition_app_header_statelesswidget",
                  child: ClipOval(
                    child: Image.asset("assets/images/goodnight.jpeg",width: 100,height: 100,),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,Animation animation,Animation secondaryAnimation){
                    return new FadeTransition(
                      opacity: animation,
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text("原图"),
                        ),
                        body: HeroTransitionToPage(),
                      ),
                    );
                  })
                  );
                },
              ),
              InkWell(
                child: Text(
                  "我就是我，不一样的烟火",
                  maxLines: 1,
                  style: TextStyle(color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Ink(
                child: InkWell(
                    onTap: () { },
                    child: Container(
                      height: 50.0,
                      color: Colors.white,
                      child: Text( "是速度",
                        maxLines: 1,
                        style: TextStyle(color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ),

              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//构建一个没有Scaffold的statelessWidget，组装对应的body，实现hero展示动画
class HeroTransitionToPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:  Column(
        children: <Widget>[
          Hero(
            tag: "transition_app_header_statelesswidget",
            child: Image.asset("assets/images/goodnight.jpeg"),
          ),
          Text('你好，中国加油'),
          Text('武汉加油'),
          Text('疫情赶紧好起来'),
          Text('群众摘掉口罩'),
        ],
      )
    );
  }
}