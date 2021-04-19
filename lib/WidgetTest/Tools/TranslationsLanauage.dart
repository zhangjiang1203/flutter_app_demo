/*
* TranslationsLanauage created by zj 
* on 2020/4/24 2:55 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'LocaleTool.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

/// Class for Translate
///
/// For example:
///
/// import 'package:workout/translations.dart';
///
/// ```dart
/// For TextField content
/// TranslationsLanauage.of(context).text("home_page_title");
/// ```
///
/// ```dart
/// For speak string
/// Note: Tts will speak english if currentLanguage[# Tts's parameter] can't support
///
/// TranslationsLanauage.of(context).speakText("home_page_title");
/// ```
///
/// "home_page_title" is the key for text value
///


class TranslationsLanguage {

  TranslationsLanguage(Locale locale){
    this.locale = locale;
    _localizedValues = null;
  }

  Locale locale;
  static Map<dynamic,dynamic> _localizedValues;

  //便利构造方法
  static TranslationsLanguage of(BuildContext context) {
    return Localizations.of<TranslationsLanguage>(context,TranslationsLanguage);
  }

  String text(String key){
    try{
      String value = _localizedValues[key];
      if(value == null || value.isEmpty){
        return key;
      }else{
        return value;
      }
    }catch (e){
      return key;
    }
  }

  static Future<TranslationsLanguage> load(Locale locale) async {
    TranslationsLanguage translationsLanguage = new TranslationsLanguage(locale);
    print("当前语言==="+locale.languageCode);
    String jsonContent = await rootBundle.loadString("languages/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translationsLanguage;
  }

  get currentLanguage => locale.languageCode;
}

//遵循这两个代理
class TranslationsDelegate extends LocalizationsDelegate<TranslationsLanguage> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    localTool.languageCode = locale.languageCode;
    return localTool.supportLangs.contains(locale.languageCode);
  }

  @override
  Future<TranslationsLanguage> load(Locale locale) {
    // TODO: implement load
    return TranslationsLanguage.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<TranslationsLanguage> old) {
    // TODO: implement shouldReload
    return true;
  }
}


/// Delegate类的实现，每次选择一种新的语言时，强制初始化一个新的Translations类
class SpecificLocalizationDelete extends LocalizationsDelegate<TranslationsLanguage> {
  const SpecificLocalizationDelete(this.overriddenLocal);
  ///当前的语言
  final Locale overriddenLocal;
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return overriddenLocal != null;
  }

  @override
  Future<TranslationsLanguage> load(Locale locale) {
    // TODO: implement load
    return TranslationsLanguage.load(overriddenLocal);
  }

  @override
  bool shouldReload(LocalizationsDelegate<TranslationsLanguage> old) {
    // TODO: implement shouldReload
    return true;
  }
}
