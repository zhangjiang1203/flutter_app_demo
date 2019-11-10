
//widget的状态管理;
import 'package:flutter/material.dart';


class WidgetSelfBoxA extends StatefulWidget {

  WidgetSelfBoxA({Key key}): super(key:key);

  @override
  _WidgetSelfState createState() => new _WidgetSelfState();

}


//widget自己管理自己的状态
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



//父Widget管理子widget的状态展示
class ParentStateWidget extends StatefulWidget {
  @override
  _ParentState createState() => new _ParentState();

}

class _ParentState extends State<ParentStateWidget> {

  var _active = false;

  void _handleExchange(bool newvalue) {
    setState(() {
      _active = newvalue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: TapBoxB(onChange: _handleExchange,active: _active,),
    );
  }

}



class TapBoxB extends StatelessWidget {

  TapBoxB({
    Key key,
    this.active: false,
    @required this.onChange,
  }): super(key:key);

  final bool active;
  final ValueChanged<bool> onChange;
  void handleTap(){
    onChange(!active);
  }


  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text("父管理state"),
        backgroundColor: Colors.blue,
      ),
      body: new GestureDetector(
        onTap: handleTap,
        child: new Container(
          child: new Center(
            child: new Text(
              active ? "Active" : "Inactive",
              style: new TextStyle(
                fontSize: 30.0,
                color: Colors.blue,
              ),
            ),
          ),
          width: 200.0,
          height: 200.0,
          margin: EdgeInsets.all(10),
          decoration: new BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}