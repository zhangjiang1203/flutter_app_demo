/*
* 7.ScrollTableModel created by zj 
* on 2020/7/15 10:39 AM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class ScrollTableModel extends StatefulWidget {
  ScrollTableModel({Key key}) : super(key: key);
  @override
  _ScrollTableModel createState() => _ScrollTableModel();
}

class _ScrollTableModel extends State<ScrollTableModel> {

  List<String>  showData = ["张三","李四","王五","赵二","郭大","冯八","翟九","霍十","张三","李四","王五","赵二","郭大","冯八","翟九","霍十","张三","李四","王五","赵二","郭大","冯八","翟九","霍十"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('scrollTable'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text('姓名')),
              DataColumn(label: Text('年龄')),
              DataColumn(label: Text('性别')),
              DataColumn(label: Text('城市')),
              DataColumn(label: Text('邮编')),
              DataColumn(label: Text('籍贯')),
              DataColumn(label: Text('婚姻')),
              DataColumn(label: Text('电话')),
              DataColumn(label: Text('公司')),
            ],
            rows: showData.map((e) => DataRow(
              cells: [
                DataCell(Text(e)),
                DataCell(Text('张一')),
                DataCell(Text('张二')),
                DataCell(Text('张三')),
                DataCell(Text('张四')),
                DataCell(Text('张五')),
                DataCell(Text('张六')),
                DataCell(Text('张七')),
                DataCell(Text('张八')),
              ]
            )).toList()

          ),
        ),
      ),
    );
  }
}