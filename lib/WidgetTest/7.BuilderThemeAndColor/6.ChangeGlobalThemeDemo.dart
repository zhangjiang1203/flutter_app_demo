import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AppInfoProvider with ChangeNotifier {
  Color _themeColor = Colors.teal;

  MaterialColor get themeColor{
    return MaterialColor(_themeColor.value,{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2196F3),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    });
  }

  setTheme(Color themeColor) {
    _themeColor = themeColor;
    notifyListeners();
  }
}

//使用定义的迷你Provider
class ZJThemeModel extends ChangeNotifier {

  ZJThemeModel({Key? key}) ;

  Color _themeColor = Colors.teal;

  MaterialColor get themeColor{
    // String value = _themeColor.value.toRadixString(16).padLeft(8, '0');

    return MaterialColor(_themeColor.value,{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
    });
  }

  //修改对应的theme
  void changeTheme(Color theme) {
    _themeColor = theme;
    notifyListeners();
  }
}



//修改theme的具体实现
class ChangeGlobalThemeDemo extends StatefulWidget {
  ChangeGlobalThemeDemo({Key? key}) : super(key:key);

  @override
  _ChangeGlobalThemeState createState()=> _ChangeGlobalThemeState();

}

class _ChangeGlobalThemeState extends State<ChangeGlobalThemeDemo> {

  //定义主题颜色
  late Map<String, Color> _themeColors;

  @override
  void initState() {
    // TODO: implement initState
    _themeColors = {
      'gray': Colors.grey,
      'blue': Colors.blue,
      'cyan': Colors.cyan,
      'deepPurple': Colors.purple,
      'indigo': Colors.indigo,
      'deepOrange': Colors.orange,
      'green': Colors.green,
      'indigo': Colors.indigo,
      'orange': Colors.orange,
      'purple': Colors.purple,
      'pink': Colors.pink,
      'red': Colors.red,
      'teal': Colors.teal,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("修改主题")),
      body: ListView.builder(
            itemCount: _themeColors.values.length,
            itemExtent: 45,
            itemBuilder: (context,index){
              var keyStr = _themeColors.keys.toList()[index];
              return  Container(
                height: 45,
                alignment: Alignment.center,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    //没哟用positioned包裹的子widget会expaned父widget
                    Container(
                      color: _themeColors[keyStr],
                    ),
                    Positioned(
                      left: 15,
                      top:15,
                      child: Text(keyStr,style: TextStyle(color: Colors.white),),
                    ),
                    TextButton(
                        onPressed: (){
                          //修改展示的字体
                          //TODO:保存修改的主题
                          Provider.of<AppInfoProvider>(context).setTheme(_themeColors[keyStr]!);
                        },
                      child: Text("测试展示的数据"),
                    ),
                  ],
                ),
              );
            }),
      );
  }
}