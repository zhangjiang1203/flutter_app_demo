import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJColorsTool.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class PointerEventModelTest extends StatefulWidget {

  PointerEventModelTest({Key? key}): super(key:key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PointerEventState();
  }
}

class _PointerEventState extends State<PointerEventModelTest> {

  //保存全局的状态
  late PointerEvent _event1;
  late PointerEvent _event2;
  late PointerEvent _event3;
  List<Map<String,Object>> eventList = [];


  //初始化对应的状态值
  @override
  void initState() {
    // TODO: implement initState
    eventList.add({"color":Colors.green,"event":_event1,'behavior':HitTestBehavior.deferToChild});
    eventList.add({"color":Colors.blue,"event":_event2,'behavior':HitTestBehavior.opaque});
    eventList.add({"color":Colors.pink,"event":_event3,'behavior':HitTestBehavior.translucent});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("PointerEvent"),
      ),
      body: Column(
        children: eventList.map((e){
          //创建builder只是在对应的tree中不相互影响对应的UI绘制
         return Builder(
            builder: (BuildContext context){
              return Listener(
                onPointerDown: (event){
                  //只做局部更新
                  (context as Element).markNeedsBuild();
                  e["event"] = event;
                },
                onPointerMove: (event){
                  (context as Element).markNeedsBuild();
                  e["event"] = event;
                },
                onPointerUp: (event){
                  (context as Element).markNeedsBuild();
                  e["event"] = event;
                },
                //设置对应的behavior
                //deferToChild 子组件会一个接一个的进行命中测试
                //opaque 将当前组件当做不透明的处理，效果是当前widget的区域都是可点击的区域
                behavior: e['behavior'] as HitTestBehavior,
                child: Container(
                  color: e["color"] as Color,
                  alignment: Alignment.center,
                  height: 200,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(e?.toString() ?? "" ,style: ZJTextStyleTool.white_36,),
                ),
              );
            },
          );

        }).toList(),
      ),
    );
  }
}