/*
* 1.getTestController created by zj 
* on 2021/10/25 14:56
* copyright on zhangjiang
*/
// **************************************************************************
/*
                           _ooOoo_
                          o8888888o
                          88" . "88
                          (| -_- |)
                          O  =  /O
                       ____/`---'____
                     .'  |     |//  `.
                    /  |||  :  |||//  
                   /  _||||| -:- |||||-  
                   |   |   -  /// |   |
                   | _|  ''---/''  |   |
                     .-__  `-`  ___/-. /
                 ___`. .'  /--.--  `. . __
              ."" '<  `.____<|>_/___.'  >'"".
             | | :  `- `.;` _ /`;.`/ - ` : | |
                `-.   _ __ /__ _/   .-` /  /
        ======`-.____`-.________/___.-`____.-'======
                           `=---='
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                 佛祖保佑       永无BUG
* 佛曰:
* 写字楼里写字间，写字间里程序员；
* 程序人员写程序，又拿程序换酒钱。
* 酒醒只在网上坐，酒醉还来网下眠；
* 酒醉酒醒日复日，网上网下年复年。
* 但愿老死电脑间，不愿鞠躬老板前；
* 奔驰宝马贵者趣，公交自行程序员。
* 别人笑我忒疯癫，我笑自己命太贱；
* 不见满街漂亮妹，哪个归得程序员？
// **************************************************************************
*/

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'ShowGetDemo/1.SimpleCountDemo.dart';


class GetTestController extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    final showData = [
      {"title":"simpleDemo","controller": SimpleCountDemo()},
    ];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("你好"),),
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index){
          final data = showData[index];
          return ListTile(title: Text(data["title"]),onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return data["controller"];
          })));
        },
        itemCount: showData.length,
        itemExtent: 50,
      ),
    );
  }

}