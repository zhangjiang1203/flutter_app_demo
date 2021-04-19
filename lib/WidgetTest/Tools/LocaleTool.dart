/*
* local_tool created by zj 
* on 2020/4/24 2:44 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef void LocaleChangeCallBack(Locale locale);

class LocaleTool  {
  final List<String> supportLangs = ['zh','en'];
  Iterable<Locale> supportLocales() => supportLangs.map<Locale>((lang)=> new Locale(lang,''));

  //改变语言时的回调
  LocaleChangeCallBack onLocaleChangeed;

  Locale locale;
  String languageCode;

  static final LocaleTool _localTool = new LocaleTool._internal();

  factory LocaleTool() {
    return _localTool;
  }

  LocaleTool._internal();

  /// 获取当前的语言
  String getLanguageCode() {
    //获取当前的
    if(languageCode == null || languageCode.isEmpty){
      return 'zh';
    }
    return languageCode;
  }

  //获取用户设置的语言
  Future<String> getCurrentUserLanguage() async {
    print('我的语言');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("user_current_language");
  }

  void saveUserLanguage(String language) async{
    //保存,当前选中是同一种语言什么都不操作
    if(language == languageCode){
      return;
    }
    languageCode = language;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('user_current_language', language);
    onLocaleChangeed(Locale(language,''));
  }
}

//便利访问对象
LocaleTool localTool = new LocaleTool();