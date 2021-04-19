import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/7.BuilderThemeAndColor/CheckBoxDialogView.dart';
import 'package:flutter_app_demo/WidgetTest/7.BuilderThemeAndColor/CheckBoxDialogView.dart' as prefix0;
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';

class DialogTestModel extends StatefulWidget {
  @override
  _DialogTestModel createState()=> _DialogTestModel();

}


class _DialogTestModel extends State<DialogTestModel> {
  //默认不选中
  bool withTree = false;
  //弹出bottomView使用
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  /// alertDialog示例
  Future<int> ShowMyDialogOne() {
    //showDialog()是Material组件库提供的一个用于弹出Material风格对话框的方法
    //该方法返回一个Future，它正是用于接收对话框的返回值：
    return  showDialog(
      //点击遮罩是否关闭dialog
      barrierDismissible: false,
      context: context,
      builder: (context){
        return  AlertDialog(
          title: Text("对话框1"),
          content: Text("测试展示数据，你看看那边是不是就是这样的"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              //对话框关闭
              onPressed: ()=>Navigator.of(context).pop(1),
            ),
            FlatButton(
              child: Text("删除"),
              //删除
              onPressed: ()=>Navigator.of(context).pop(2),
            ),
          ],
        );
      },
    );
  }


  ///simpleDialog示例
  Future<int> showSimpleDialogView() async {
    return showDialog(
      context: context,
      builder: (context){
        return SimpleDialog(
          title: Text('选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: ()=> Navigator.pop(context,1),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("中文"),
              ),
            ),
            SimpleDialogOption(
              onPressed: ()=> Navigator.pop(context,2),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("英文"),
              ),
            ),
            SimpleDialogOption(
              onPressed: ()=> Navigator.pop(context,3),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("韩文"),
              ),
            ),

          ],
        );
      },

    );
  }

  /// dialog示例
  Future<int> ShowDialogView() {
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
                      onTap: ()=> Navigator.of(context).pop(index),
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

  //自定义的dialog
  Future<int> showUnconstrainedBoxView() {
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
                      onTap: ()=> Navigator.of(context).pop(index),
                    );
                  }),
            ),

          ],
        );
        //Dialog可以包含延迟加载的组件模型
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 280),
            child: Material(
              child: child,
              type: MaterialType.card,
            ),
          ),
        );
      },
    );

  }

  //自定义的widget和动画
  Future<T> showCustomDialogView<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
    }) {
    final ThemeData theme = Theme.of(context);
    return showGeneralDialog(
        context: context,
        //点击遮罩层是否关闭dialog
        barrierDismissible: barrierDismissible,
        //语义化标签
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        //dialog背景颜色
        barrierColor: Colors.black38,
        //动画时间
        transitionDuration:const Duration(milliseconds: 150),
        //dialog显示动画
        transitionBuilder: _buildMaterialDialogAnimation,
        pageBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,){

          final Widget pageWidget = Builder(builder:builder);

          return SafeArea(
            child: Builder(builder: (BuildContext context){
              return theme != null ? Theme(data: theme,child: pageWidget,) : pageWidget;
            }) ,
          );
        },
    );

  }

  //设置动画
  Widget _buildMaterialDialogAnimation(
      BuildContext context,
      Animation animation,
      Animation secondaryAnimation,
      Widget child
      ){
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeIn,
      ),
      child: child,
    );

  }

  Future<T> showCheckBoxDialogView<T>({
      @required BuildContext context,
      bool barrierDismissible = true,
      WidgetBuilder builder,}
      ){
    withTree = false;
    final ThemeData theme = Theme.of(context);


//    return showDialog<bool>(context: context,builder: (BuildContext context){
//      return AlertDialog(
//        title: Text("提示删除"),
//        content: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            Text("确定要删除当前文件吗"),
//            Row(
////              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Text("同时删除子文件夹吗?"),
//                Checkbox(
//                  value: withTree,
//                  onChanged: (bool change){
//                    setState(() {
//                      withTree = change;
//                    });
//                  },
//                ),
//              ],
//            ),
//          ],
//        ),
//        actions: <Widget>[
//          FlatButton(
//            child: Text("取消"),
//            onPressed: ()=> Navigator.of(context).pop(),
//          ),
//          FlatButton(
//            child: Text('删除'),
//            onPressed: ()=> Navigator.of(context).pop(withTree),
//          ),
//
//        ],
//      );
//    });

    return showGeneralDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierColor: Colors.black38,
        transitionDuration: Duration(milliseconds: 150),
        transitionBuilder: _buildMaterialDialogAnimation,
        //语义化标签
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        pageBuilder: (BuildContext context,Animation<double> animation, Animation<double> secondaryAnimation){
          Widget childWidget = Builder(builder: builder,);
          return SafeArea(
            child: Builder(builder:(context){
              return  theme == null ? childWidget : Theme(data: theme,child: childWidget);
            }),

          );
        });
  }
  
  
  //底部弹出dialog
  Future<T> showBottomDialogView<T>() {
    return showModalBottomSheet<T>(context: context, builder: (BuildContext context){
      return Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 40,
            child: Container(
              color: Colors.purple,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text("请选择",style: ZJTextStyleTool.white_28,),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      iconSize: 24,
                      icon: Icon(Icons.close,color: Colors.white,),
                      onPressed: ()=> Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemExtent: 45,
              itemCount: 35,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text("当前的序号$index"),
                  onTap: () => Navigator.of(context).pop(index),);
              }),
          ),
        ],
      );
    });
  }

  void showFullScreenDialog() {

    _scaffoldkey.currentState.showBottomSheet((context){
        return Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Container(
                color: Colors.purple,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Text("请选择",style: ZJTextStyleTool.white_28,),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        iconSize: 24,
                        icon: Icon(Icons.close,color: Colors.white,),
                        onPressed: ()=> Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemExtent: 45,
                  itemCount: 35,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text("当前的序号$index"),
                      onTap: () => Navigator.of(context).pop(index),);
                  }),
            ),
          ],
        );
       })
      .closed
      .whenComplete((){
        if(mounted){
          _scaffoldkey.currentState.showSnackBar(new SnackBar(content: Text("我是选中数据")));
        }
      });
  }

  //大小不能自定义的loading
  void showLoadingDialogView() {
    showDialog(
        context: context,
        //点击空白处 loading对话框不消失
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Text('急速加载中,请稍后……'),
              ],
            ),
          );
        });
  }
  void showCustomSizeLoadingDialogView(){
    showDialog(
        context:context,
        barrierDismissible: false,
        builder: (context){
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 300,
              height: 100,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 10),),
                    Text('急速加载中,请稍后……'),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }


  //日历选择器
  Future<DateTime> showDatePickerDialogView<T>() {

    var time = DateTime.now();
    return showDatePicker(
        context: context,
        initialDate: time ,
        locale: Locale('zh'),
        firstDate: time,
        //可选时间为30天，设置初始时间和结束时间
        lastDate: time.add(Duration(days: 30)));
  }

  Future<DateTime> showiOSDatePickerDialogView() {
    //iOS风格日期选择器
    var date = DateTime.now();
    return showCupertinoModalPopup(
        context: context,
        builder: (context){
          return SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              initialDateTime: date,
              minimumDate: date,
              maximumDate: date.add(Duration(days: 30)),
              maximumYear: date.year + 1,
              onDateTimeChanged: (value){
                print("datepicker===$value");
              },
            ),
          );
        });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //设置bottomview的关键
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("对话框"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        child: Wrap(
          spacing: 5,
          runSpacing: -5,
          runAlignment: WrapAlignment.start,
          children: <Widget>[
            RaisedButton(
              child: Text("AlertDialog"),
              onPressed:  () async {
                int delete = await ShowMyDialogOne();
                if (delete == 1) {
                  print("点击的取消");
                }else if (delete == 2) {
                  print("点击的删除");
                }
              },
            ),
            RaisedButton(
              child: Text("SimpleDialog"),
              onPressed: () async{
                int index = await showSimpleDialogView();
                if(index != null){
                  switch (index){
                    case 1:
                      print("简体中文");
                      break;
                    case 2:
                      print("英文");
                      break;
                    case 3:
                      print("韩文");
                      break;
                    default:
                      print("默认为中文");
                  }
                }
              },
            ),
            RaisedButton(
              child: Text("有边界对话框"),
              onPressed: () async {
                int index = await ShowDialogView();
                print("当前点击的顺序$index");

              },
            ),
            RaisedButton(
              child: Text("无边界对话框"),
              onPressed: () async{
                int index = await showUnconstrainedBoxView();
                print("当前点击的顺序$index");
              },
            ),
            RaisedButton(
              child: Text("自定义弹出对话框"),
              onPressed: () async{
                int index = await showCustomDialogView<int>(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("你好"),
                        content:Text("你是不是想山车这个"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.of(context).pop(0),
                          ),
                          FlatButton(
                            child: Text("删除"),
                            onPressed: () {
                              // 执行删除操作
                              Navigator.of(context).pop(1);
                            },
                          ),
                        ],
                      );
                    });
                print("当前点击的顺序$index");
              },
            ),
            RaisedButton(
              child: Text('不能选中的复选框对话框'),
              onPressed: () async{
                //修改点击的位置信息，复选框不能选中
                bool index = await showCheckBoxDialogView<bool>(context: context,builder: (context){
                  return AlertDialog(
                    title: Text("提示删除"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("确定要删除当前文件吗"),
                        Row(
                          children: <Widget>[
                            Text("同时删除子文件夹吗?"),
                            Checkbox(
                              value: withTree,
                              onChanged: (bool change){
                                setState(() {
                                  withTree = change;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("取消"),
                        onPressed: ()=> Navigator.of(context).pop(),
                      ),
                      FlatButton(
                        child: Text('删除'),
                        onPressed: ()=> Navigator.of(context).pop(withTree),
                      ),

                    ],
                  );
                });
                if (index == null){
                  print("取消删除");
                }else{
                  print("同时删除子目录 $index");
                }
              },
            ),
            RaisedButton(
              child: Text("可以选中的复选框"),
              onPressed: () async{
                //修改点击的位置信息，复选框可以选中
                bool index = await showCheckBoxDialogView<bool>(context: context,builder: (context){
                  return AlertDialog(
                    title: Text("提示删除"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("确定要删除当前文件吗"),
                        Row(
                          children: <Widget>[
                            Text("同时删除子文件夹吗?"),
                            CheckBoxDialogView(
                              value: withTree,
                              onChanged: (bool change){
                                setState(() {
                                  withTree = !withTree;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("取消"),
                        onPressed: ()=> Navigator.of(context).pop(),
                      ),
                      FlatButton(
                        child: Text('删除'),
                        onPressed: ()=> Navigator.of(context).pop(withTree),
                      ),

                    ],
                  );
                });
                if (index == null){
                  print("取消删除");
                }else{
                  print("同时删除子目录 $index");
                }

              },
            ),
            RaisedButton(
              child: Text("使用stateBuilder设置的可选框"),
              onPressed: () async{
                //修改点击的位置信息，复选框可以选中
                bool index = await showCheckBoxDialogView<bool>(context: context,builder: (context){
                  return AlertDialog(
                    title: Text("提示删除"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("确定要删除当前文件吗"),
                        Row(
                          children: <Widget>[
                            Text("同时删除子文件夹吗?"),
                            //获取到当前的context,并且代理了当前context的bulider方法
                            // 状态发生变化调用setState方法，重新绘制
                            // 子组件通知父组件重新builder实现UI更新
                            prefix0.StatefulBuilder(builder: (context,_setState){
                              return  CheckBoxDialogView(
                                value: withTree,
                                onChanged: (bool change){
                                  setState(() {
                                    withTree = !withTree;
                                  });
                                },
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("取消"),
                        onPressed: ()=> Navigator.of(context).pop(),
                      ),
                      FlatButton(
                        child: Text('删除'),
                        onPressed: ()=> Navigator.of(context).pop(withTree),
                      ),

                    ],
                  );
                });
                if (index == null){
                  print("取消删除");
                }else{
                  print("同时删除子目录 $index");
                }

              },
            ),
            RaisedButton(
              child: Text('element设置可选框可选'),
              onPressed: () async{
                //修改点击的位置信息，复选框不能选中
                bool index = await showCheckBoxDialogView<bool>(context: context,builder: (context){
                  return AlertDialog(
                    title: Text("提示删除"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("确定要删除当前文件吗"),
                        Row(
                          children: <Widget>[
                            Text("同时删除子文件夹吗?"),
                            Checkbox(
                              value: withTree,
                              onChanged: (bool change){
                                //转为Element,需要重新build，此时的context为对话框的根element
                                //直接将根element对应的widget标记为dirty
                                (context as Element).markNeedsBuild();
                                setState(() {
                                  withTree = !withTree;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("取消"),
                        onPressed: ()=> Navigator.of(context).pop(),
                      ),
                      FlatButton(
                        child: Text('删除'),
                        onPressed: ()=> Navigator.of(context).pop(withTree),
                      ),

                    ],
                  );
                });
                if (index == null){
                  print("取消删除");
                }else{
                  print("同时删除子目录 $index");
                }
              },
            ),
            RaisedButton(
              child: Text('builder设置范围可选框'),
              onPressed: () async{
                //修改点击的位置信息，复选框不能选中
                bool index = await showCheckBoxDialogView<bool>(context: context,builder: (context){
                  return AlertDialog(
                    title: Text("提示删除"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("确定要删除当前文件吗"),
                        Row(
                          children: <Widget>[
                            Text("同时删除子文件夹吗?"),
                            // 通过Builder来获得构建Checkbox的`context`，
                            // 这是一种常用的缩小`context`范围的方式
                            Builder(
                                builder: (context){
                                  return Checkbox(
                                    value: withTree,
                                    onChanged: (bool change){
                                      //转为Element,需要重新build，此时的context为对话框的根element
                                      //直接将根element对应的widget标记为dirty
                                      (context as Element).markNeedsBuild();
                                      setState(() {
                                        withTree = !withTree;
                                      });
                                    },
                                  );
                                }
                            ),

                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("取消"),
                        onPressed: ()=> Navigator.of(context).pop(),
                      ),
                      FlatButton(
                        child: Text('删除'),
                        onPressed: ()=> Navigator.of(context).pop(withTree),
                      ),

                    ],
                  );
                });
                if (index == null){
                  print("取消删除");
                }else{
                  print("同时删除子目录 $index");
                }
              },
            ),
            RaisedButton(
              child: Text('底部dialog'),
              onPressed: () async{
                //修改点击的位置信息，复选框不能选中
                int index = await showBottomDialogView<int>();
                print("当前选中$index");

              },
            ),
            RaisedButton(
              child: Text('全屏的dialog'),
              onPressed: () {
                //修改点击的位置信息，复选框不能选中
                showFullScreenDialog();
              },
            ),
            RaisedButton(
              child: Text("展示loading(大小不能自定)"),
              onPressed: (){
                showLoadingDialogView();
                Future.delayed(Duration(seconds: 2),(){
                  //对话框消失
                  Navigator.of(context).pop();
                });
              },
            ),
            RaisedButton(
              child: Text("展示loading(大小可自定)"),
              onPressed: (){
                showCustomSizeLoadingDialogView();
                Future.delayed(Duration(seconds: 2),(){
                  //对话框消失
                  Navigator.of(context).pop();
                });
              },
            ),
            RaisedButton(
              child: Text("日历选择器)"),
              onPressed: () async{
                DateTime time = await showDatePickerDialogView();
                print("选中的时间$time");
              },
            ),
            RaisedButton(
              child: Text("iOS日历选择器)"),
              onPressed: () async{
                DateTime time = await showiOSDatePickerDialogView();
                print("选中的时间$time");
              },
            ),
          ],
        ),
      ),
    );
  }
}