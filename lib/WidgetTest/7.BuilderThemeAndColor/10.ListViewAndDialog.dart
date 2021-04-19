/*
* 10.ListViewAndDialog created by zj 
* on 2020/7/10 12:38 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';

class ListViewAndDialog extends StatefulWidget {
  final String title;



  ListViewAndDialog({Key key,this.title="你好"}) : super(key: key);
  @override
  _ListViewAndDialog createState() => _ListViewAndDialog();
}

class _ListViewAndDialog extends State<ListViewAndDialog> {

  Map<String,Object> _showData;

  SectionTableController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showData = {
      "0":{"title":["手机","邮箱","地址"],
           "subtitle":["","",""]
          },
      "1":{"title":["性别","学校"],
           "subtitle":["",""]
          },
    };
  }

  void _updateMyShowData(int section,int row,String select){
    Map sectionData = _showData[section.toString()];
    List subtitles = [];
    if (sectionData.containsKey("subtitle")){
      subtitles = sectionData["subtitle"];
    }
    subtitles[row] = select;
    sectionData["subtitle"] = subtitles;
    _showData[section.toString()] = sectionData;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("dialogChoose"),
      ),
      body: SectionTableView(
        sectionCount: _showData.length,
        numOfRowInSection: (int section){
          Map sectionData = _showData[section.toString()];
          List titles = [];
          if (sectionData.containsKey("title")){
            titles = sectionData["title"];
          }
          return titles.length;
        },
        cellAtIndexPath: (section,row){
          Map sectionData = _showData[section.toString()];
          List titles = [];
          List subtitles = [];
          if (sectionData.containsKey("title")){
            titles = sectionData["title"];
          }
          if (sectionData.containsKey("subtitle")){
            subtitles = sectionData["subtitle"];
          }
          return ListTile(
            title: Text(titles[row]),
            subtitle: Text(subtitles[row]),
            onTap: () async{
              String chooseStr = await ShowDialogView();
              _updateMyShowData(section,row,chooseStr);
            },
          );
        },
        headerInSection: (section){
          return Container(
            height: 10,
            color: Colors.grey,
          );
        },
        sectionHeaderHeight: (section){
          return 10;
        },
      ),
    );
  }


  /// dialog示例
  Future<String> ShowDialogView() {

    return showDialog(
      context: context,
      builder: (context){
        var child =  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10),),
            SizedBox(
              child: Text("请选择"),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 50,
                  itemExtent: 45,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      title: Text('我就是我$index'),
                      onTap: ()=> Navigator.of(context).pop('我就是我$index'),
                    );
                  }),
            ),
          ],
        );
        //Dialog可以包含延迟加载的组件模型
        return Dialog(child: child,);
      },
    );
  }
}
