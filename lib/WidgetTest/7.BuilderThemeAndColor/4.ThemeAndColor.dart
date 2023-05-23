import 'package:flutter/material.dart';

class ThemeAndColorDemo extends StatefulWidget {

  ThemeAndColorDemo({Key? key}) : super(key:key);

  @override
  _ThemeAndColorState createState() => _ThemeAndColorState();

}

class _ThemeAndColorState extends State<ThemeAndColorDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title:Text('Theme&Color'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20),),
            NavbarView(backgroundColor: Colors.blue,title: "你好",),
            Padding(padding: EdgeInsets.only(top: 20),),
            NavbarView(backgroundColor: Colors.white,title: "我就是我",),

          ],
        ),
      ),
    );
  }
}



//自定义navbar

class NavbarView extends StatelessWidget {

  final String title;
  final Color? backgroundColor;

  const NavbarView({Key? key,required this.title,this.backgroundColor}): super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: 52,
      ),
      decoration: BoxDecoration(
        color: this.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0,3),
            blurRadius: 4,
          )
        ],
      ),
      child: Text(
        this.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //根据背景色亮度确定字体颜色
          color: backgroundColor!.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}