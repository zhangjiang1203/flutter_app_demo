
//widget的状态管理;
import 'package:flutter/material.dart';


class WidgetSelfBoxA extends StatefulWidget {

  WidgetSelfBoxA({Key? key}): super(key:key);

  @override
  _WidgetSelfState createState() => new _WidgetSelfState();

}


//widget自己管理自己的状态
class _WidgetSelfState extends State<WidgetSelfBoxA> {
  //box是否激活
  bool _active = false;
  //单选框状态
  bool _switchState = false;
  //复选框状态
  bool _checkboxState = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选框和Switch管理"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //手势控制
            GestureDetector(
              onTap: _handleTap,
              child: new Container(
                child: new Center(
                  child: Text(
                    _active ? 'Active' : 'Inactive',
                    style: new TextStyle(fontSize: 25.0,color: Colors.white),
                  ),
                ),
                margin: EdgeInsets.all(10),
                width: 120,
                height: 50,
                decoration: new BoxDecoration(
                  color: _active ? Colors.lightGreen[700] : Colors.grey[600],
                ),
              ),
            ),
            //switch和单选框
            Switch(
              value: _switchState,
              activeColor: Colors.blue,
//              activeTrackColor: Colors.red,
              onChanged: (value){
                setState(() {
                  _switchState = value;
                });
              },
            ),
            Checkbox(
              value: _checkboxState,
              activeColor: Colors.red,
              onChanged: (value){
                setState(() {
                  _checkboxState = value!;
                });
              },
            ),


          ],
        ),
      ),
    );
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
    Key? key,
    this.active: false,
    required this.onChange,
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


//混合管理widget的状态
class MixControlState extends StatefulWidget {
  @override
  _MixWidgetState createState() => new _MixWidgetState();
}

class _MixWidgetState extends State<MixControlState> {

  var active = false;

  void handleTap(bool newValue){
    setState(() {
      active = newValue;
    });
  }

  Widget build(BuildContext context) {
    return new Container(
      child: TapBoxC(onChanged: handleTap,active: active,),
    );
  }

}


class TapBoxC extends StatefulWidget {
  TapBoxC({
    Key? key,
    this.active:false,
    required
    this.onChanged
  }) : super(key:key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() => new _TapBoxCState();

}

class _TapBoxCState extends State<TapBoxC> {

  bool _highLight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highLight = true;
    });
  }


  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highLight = false;
    });
  }

  void _handleTapCancel(){
    setState(() {
      _highLight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mixwidge"),
        backgroundColor: Colors.blue,
      ),
      body: new GestureDetector(
        onTap: _handleTap,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: new Container(
          child: new Center(
            child: new Text(
              widget.active ? "active" : "inactive",
              style: new TextStyle(fontSize: 32.0,color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          margin: EdgeInsets.all(10),
          decoration: new BoxDecoration(
            color: widget.active ? Colors.lightBlue[700] : Colors.grey[600],
            border: _highLight ? new Border.all(
              color:Colors.teal[700]!,
              width: 10.0,
            ) : null,
          ),
        ),
      ),
    );
  }

}

