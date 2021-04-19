/*
 * @Author: zhangjiang
 * @Date: 2020-08-24 15:35:57
 * @LastEditTime: 2020-08-24 15:41:50
 * @FilePath: /flutter_app_demo/lib/WidgetTest/15.NetStudy/01.ShowFirstPage.dart
 */


import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class FirstPageStudy extends StatefulWidget {
  
  @override
  
  _FirstPageStudyState createState() => _FirstPageStudyState();
}



class _FirstPageStudyState extends State<FirstPageStudy> {
  StreamSubscription _subscription;
  String _netStatus;
  @override
  void initState() {
    super.initState();
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      switch (event) {

      }
      //网络开始变化
      print("网络开始变化===$event,${event.runtimeType},转化${event.toString()}");
      _netStatus = "网络开始变化===$event";
      setState(() {});
    });
    
     Connectivity().checkConnectivity().then((value) => print("网络开始变化===$value,${value.runtimeType},转化${value.toString()}"));
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("监控网络变化"),
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(_netStatus != null ? _netStatus : ""),
      ),
    );
  }
}