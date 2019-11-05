
//widget的状态管理;
import 'package:flutter/material.dart';


class WidgetSelfBoxA extends StatefulWidget {

  WidgetSelfBoxA({Key key}): super(key:key);

  @override
  _WidgetSelfState createState() => new _WidgetSelfState();

}

class _WidgetSelfState extends State<WidgetSelfBoxA> {

  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widgetstate管理"),
        backgroundColor: Colors.blue,
      ),
      body: GestureDetector(
        onTap: _handleTap,
        child: new Container(
          child: new Center(
            child: Text(
              _active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0,color: Colors.white),
            ),
          ),
          margin: EdgeInsets.all(10),
          width: 200,
          height: 200,
          decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ),
      ),
    );
//    return new GestureDetector(
//      onTap: _handleTap,
//      child: new Container(
//
//        child: new Center(
//          child: Text(
//            _active ? 'Active' : 'Inactive',
//            style: new TextStyle(fontSize: 32.0,color: Colors.white),
//          ),
//        ),
//        width: 100.0,
//        height: 100.0,
//        decoration: new BoxDecoration(
//          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
//        ),
//      ),
//    );
  }
}