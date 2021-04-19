/*
* DioRequestListDemo created by zj 
* on 2020/4/20 4:03 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
class DioRequestRangeDemo extends StatefulWidget {
  DioRequestRangeDemo({Key key}) : super(key: key);

  @override
  _DioRequestRangeDemo createState() => _DioRequestRangeDemo();
}

class _DioRequestRangeDemo extends State<DioRequestRangeDemo> {
  Dio _dio = new Dio();
  //http分块下载,
  /*服务器支持分块传输，则相应状态为206，并且相应头中包含Conten-Range字段
  1.判断http协议是否支持分块传输响应header字段,支持 分块下载，不支持直接下载
  2.分块下载的内容保存到各自的临时文件中，等到所有分块下载完成后合并临时文件
  3.删除临时文件
  * */


  Future downLoadWithChunks(
      url,
      savePath,
  {
    ProgressCallback onReceiveProgress,
  }) async{
    const firstChunkSize = 102;
    const maxChunk = 3;

    int total = 0;
    var dio = Dio();
    var progress = <int>[];

    createCallback(no){
      return (int received,_){
//        progress[no] = received,
//        if(onReceiveProgress != null && total != 0){
          onReceiveProgress(progress.reduce((a,b)=> a+ b),total);
//        }
      };
    }
  }

  /*start 起始位置
  * end 结束位置
  * no 第几块
  * */
  Future<Response> downloadChunk(url,start,end,no) async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DioRequestListDemo"),
        ),
        body: Container(
        ),
    );
  }
}