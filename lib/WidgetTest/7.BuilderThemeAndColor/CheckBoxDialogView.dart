import 'package:flutter/material.dart';


//创建一个带有自定义状态的checkbox，对于多个需要自己控制的组件来说，这个太不理想，每一个设置一个独立的widget不合适
class CheckBoxDialogView extends StatefulWidget {
  CheckBoxDialogView({Key key,this.value,this.onChanged}) : super(key:key);

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _CheckBoxDialogState createState()=> new _CheckBoxDialogState();

}

class _CheckBoxDialogState extends State<CheckBoxDialogView> {

  bool _withTree;

  @override
  void initState() {
    //TODO:设置初始值
    _withTree = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Checkbox(
      value: _withTree,
      onChanged: (bool change){
        //将发生的事件的值抛出去
        widget.onChanged(change);
        setState(() {
          _withTree = change;
        });
      },
    );
  }

}



//创建builder,统一在一个builder中的状态管理
class StatefulBuilder extends StatefulWidget {

  StatefulBuilder({Key key,this.builder}) : assert(builder != null),super(key:key);

  final StatefulWidgetBuilder builder;

  @override
  _StatefulBuilderState createState() => new _StatefulBuilderState();

}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) {
    //builder 会自动调用setState方法
    return widget.builder(context,setState);
  }
}