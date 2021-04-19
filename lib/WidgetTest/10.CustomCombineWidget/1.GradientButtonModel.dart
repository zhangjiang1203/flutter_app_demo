/*
* GradientButton created by zhangjiang 
* on 2020/4/1 11:04 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class GradientButtonModel extends StatefulWidget {
  GradientButtonModel({Key key}) : super(key: key);

  @override
  _GradientButtonModelState createState() => _GradientButtonModelState();
}

class _GradientButtonModelState extends State<GradientButtonModel> {

  
  void tapHandler(){
    print("开始调用方法");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GradientButtonModel"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GradientButton(
                colors: [Colors.pink,Colors.blue,Colors.orange],
                height: 40,
                width: 300,
                child: Text("我是测试一"),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                tapCallback: tapHandler,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              GradientButton(
                colors: [Colors.lightGreen, Colors.green[700]],
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                child: Text("我是测试一"),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                tapCallback: tapHandler,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              GradientButton(
                colors: [Colors.red,Colors.blue,Colors.yellow],
                height: 40,
                width: MediaQuery.of(context).size.width - 40,
                child: Text("我是测试一"),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                tapCallback: tapHandler,
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class GradientButton extends StatelessWidget{
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.borderRadius,
    this.tapCallback,
    @required this.child,
});

  final List<Color> colors;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final Widget child;
  final GestureTapCallback tapCallback;


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    //确保数组不空
    List<Color> _colors = colors ?? [theme.primaryColor,theme.primaryColorDark,theme.primaryColor];

    // TODO: implement build
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius:borderRadius,
        gradient: LinearGradient(colors: _colors),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: tapCallback,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: width,height: height),
            child: Center(
              child: Padding(
                padding:const EdgeInsets.all(8),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}