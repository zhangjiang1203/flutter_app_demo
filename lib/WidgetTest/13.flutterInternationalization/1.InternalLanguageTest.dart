/*
* InternalLanguageTest created by zj 
* on 2020/4/26 10:02 AM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/LocaleTool.dart';
import '../Tools/TranslationsLanauage.dart';

class InternalLanguageTest extends StatefulWidget {
  InternalLanguageTest({Key key}) : super(key: key);

  @override
  _InternalLanguageTest createState() => _InternalLanguageTest();
}

class _InternalLanguageTest extends State<InternalLanguageTest> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("InternalLanguageTest"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(TranslationsLanguage.of(context).text("first_page")),
              Text(TranslationsLanguage.of(context).text("second_page")),
              Text(TranslationsLanguage.of(context).text("third_page")),
              Text(TranslationsLanguage.of(context).text("forth_page")),
//              RaisedButton(
//                onPressed: (){
//                  setState(() {
//                    //更新本地语言
//                    localTool.onLocaleChangeed(Locale('zh','CN'));
//                  });
//                },
//                child: Text(TranslationsLanguage.of(context).text("change_language")),
//              ),
              Expanded(
                child: ListView(
                  itemExtent: 44,
                  children: <Widget>[
                    ListTile(
                      title: Text("中文"),
                      onTap: (){
                        localTool.saveUserLanguage('zh');
                      },
                    ),
                    ListTile(
                      title: Text("English"),
                      onTap: (){
                        localTool.saveUserLanguage('en');
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}