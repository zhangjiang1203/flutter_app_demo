import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class StackAndPositonDemo extends StatefulWidget {

  @override
  _StackAndPositionState createState() => new _StackAndPositionState();
}

class _StackAndPositionState extends State<StackAndPositonDemo> {
  bool _isExpand = false;

  void _handleButtonClick() {
    setState(() {
      _isExpand = !_isExpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("StackAndPosition"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ConstrainedBox(
        constraints:  BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          // fit：此参数用于确定没有定位的子组件如何去适应Stack的大小。StackFit.loose表示使用子组件的大小，
          // StackFit.expand 未定位的widget沾满Stack的整个空间。
          // Container没有明确的定位，在loose模式下，只有Text的文本大小，expand模式下充满Stack
          fit: _isExpand ? StackFit.loose : StackFit.expand,
          children: <Widget>[

            //Positioned实现的数据中，设置位置信息left、top 、right、 bottom分别代表离Stack左、上、右、底四边的距离，设置了宽高之后上面的四个属性不能同时设置，否则报错
            Positioned(
              left: 20,
              top: 20,
              child: Text('我是positioned'),
            ),
            // 修改container的顺序可以覆盖上面的Positioned
            Container(
              color: Colors.yellow,
              child: Text('我是容器',style: ZJTextStyleTool.red_28,),
            ),

            Positioned(
              top: 20,
              child: Text('我是top布局'),
            ),

            Positioned(
              top: 100,
              child: FlatButton(
                child: Text("点击切换模式",style: ZJTextStyleTool.red_28,),
                onPressed: _handleButtonClick,
              ),
            )
          ],
        ),
      ),
    );
  }
}