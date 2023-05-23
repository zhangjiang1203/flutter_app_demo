/*
* 1.SimpleCountDemo created by zj 
* on 2021/10/25 15:30
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 设置关联的Controller
class CountController extends GetxController{
  var count = 0.obs;
  increment() => count++;
}

class SimpleCountDemo extends StatelessWidget {
  const SimpleCountDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //实例化对对应的controller,使其对当下的所有子路由可用
    final controller = Get.put(CountController());

    return Scaffold(
      appBar: AppBar(
        title: Obx(()=> Text("${controller.count}")),
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("我来了"),
          onPressed: ()=> Get.to(() => Other()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.increment,
      ),
    );
  }
}

/// 访问之前的计数器
class Other extends StatelessWidget{
  final CountController c = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("访问计数器"),),
      body: Center(
        child: Text("${c.count}"),
      ),
    );
  }
}
