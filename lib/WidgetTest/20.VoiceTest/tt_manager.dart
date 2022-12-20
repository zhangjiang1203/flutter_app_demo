/**
 * @author[zhangjiang]
 * @version[创建日期，2022/10/18 16:24]
 * @function[功能简介 ]
 **/

import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';

class TTManager {

  TTManager._(){
    initTTS();
  }

  static TTManager _manager;

  factory TTManager(){
    if (_manager == null){
      _manager = TTManager._();
    }
    return _manager;
  }


  FlutterTts flutterTts;

  /// 设置语音播报展示内容
  initTTS() {
    flutterTts = FlutterTts();
    flutterTts.setLanguage("zh-CN");
    flutterTts.setVolume(0.9);
    flutterTts.setSpeechRate(0.5);
    flutterTts.setPitch(1.0);

    flutterTts.setStartHandler(() {
      print("开始播放");
    });

    flutterTts.setCompletionHandler(() {
      print("播放完成");
    });

    flutterTts.setCancelHandler(() {
      print("取消播放");
    });

    if (Platform.isWindows || Platform.isIOS){
      flutterTts.setPauseHandler(() {
        print("开始暂停了");
      });

      flutterTts.setContinueHandler(() {
        print("继续播放");
      });
    }

    flutterTts.setErrorHandler((message) {
      print("发生了错误==${message}");
    });
  }

  /// 开始播放
  Future speak(String message) async{
    if (message.isNotEmpty){
      await flutterTts.speak(message);
    }
  }

  /// 暂停
  Future _pause() async {
    await flutterTts.pause();
  }

  /// 结束
  Future stop() async {
    await flutterTts.stop();
  }
}