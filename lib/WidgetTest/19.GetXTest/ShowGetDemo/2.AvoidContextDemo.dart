/*
* 2.AvoidContextDemo created by zj 
* on 2021/10/25 19:58
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

class AvoidContextDemo extends StatelessWidget {
  const AvoidContextDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AvoidContext"),),
      body: Column(
        children: [
          ElevatedButton(
            child: Text("SnackBars"),
            onPressed: () => Get.snackbar(
                "你好",
                "这就是爱，你们知道吗?",
              icon: Icon(Icons.add_a_photo),
              isDismissible: true,
              duration: Duration(seconds: 3),
              barBlur: 20,
              shouldIconPulse: true,
            ),
          ),
          ElevatedButton(
            child: Text("SnackBars"),
            onPressed: showDialog,
          ),
          ElevatedButton(
            child: Text("SnackBars"),
            onPressed: testShowBottomSheet,
          ),
        ],
      ),
    );
  }

  void testShowBottomSheet(){
    Get.bottomSheet(
        Container(
          color: Colors.white,
          child: Wrap(
            children: [
              ListTile(leading: Icon(Icons.music_note),title: Text("Music"),onTap: ()=> print("music tap"),),
              ListTile(leading: Icon(Icons.videocam),title: Text("Video"),onTap: ()=> print("video tap"),),
              Container(
                height: Get.bottomBarHeight/2.0,
              )
            ],
          ),
        ),
      ignoreSafeArea: false,
    );
  }

  void showDialog(){
    /// 嵌套一层dialog 设置child的宽高约束
    Widget child = UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      child: SizedBox(
        width: 300,
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          child: Container(
            color: Colors.white,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("提示"),
                Text("我就是我，不一样的烟火"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: ()=> Get.back(),
                        child: Text("取消"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: ()=> Get.back(),
                        child: Text("确定"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Get.dialog(
        child,
        barrierDismissible: true
    );
  }
}
