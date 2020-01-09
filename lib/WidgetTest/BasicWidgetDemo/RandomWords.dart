import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as prefix0;

class RandomWordsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    //生成随机字符串
    final wordPair = new prefix0.WordPair.random();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        wordPair.toString(),
      ),
    );
  }


}