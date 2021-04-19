/*
* data_observer_widget created by zj 
* on 2020/9/28 10:38 AM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import './single_data_line.dart';

typedef DataBuildContext<T> = Widget Function(BuildContext context ,T data);

class DataObserverWidget<T> extends StatefulWidget {

  DataObserverWidget({Key key,this.initData,this.dataLine,this.builder}): super(key:key);

  final T initData;
  final SingleDataLine<T> dataLine;
  final DataBuildContext builder;

  @override
  _DataObserverWidgetState createState() => _DataObserverWidgetState();
}

class _DataObserverWidgetState<T> extends State<DataObserverWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: widget.initData,
      stream: widget.dataLine.outer,
      builder: (context, AsyncSnapshot<T> snapshot){
        if (snapshot.hasData && snapshot.data != null) {
          return widget.builder(context,snapshot.data);
        }
        return Container();
      },
    );
  }

  @override
  void dispose() {
    widget.dataLine.dispose();
    super.dispose();
  }
}
