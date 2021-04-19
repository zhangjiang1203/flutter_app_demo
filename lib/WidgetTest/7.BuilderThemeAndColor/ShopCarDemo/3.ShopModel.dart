
//商品信息

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/7.BuilderThemeAndColor/ShopCarDemo/ProviderDemo.dart';

class Item {
  Item(this.price,this.count);

  double price;
  int count;
}

// 保存购物车商品的model类

class CarModel extends ChangeNotifier {
  //保存商品信息的数组
  final List<Item> _items = [];

  //禁止修改购物车里面的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  //获取购物车中的总金额
  double get totalPrice => _items.fold(0, (value,item)=> value + item.count * item.price);

  //添加商品到购物车
  void addItem(Item item){
    _items.add(item);

    //添加通知
    notifyListeners();
  }
}


//定义示例界面
class MyShopCarDemo extends StatefulWidget {
//  MyShopCarDemo({Key key}) : super(key:key);

  @override
  _MyShopCarState createState() =>  _MyShopCarState();

}

//实现1
//class _MyShopCarState extends State<MyShopCarDemo> {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('购物车'),
//      ),
//      body: Center(
//        child: ChangeNotifierProvider<CarModel>(
//          data: CarModel(),
//          child: Builder(builder: (context){
//            return Column(
//              children: <Widget>[
//                //跨组件实现状态共享，修改数据对应的组件也同步数据
//                Builder(builder: (context){
//                  var mount = ChangeNotifierProvider.of<CarModel>(context);
//                  return Text("总价:${mount.totalPrice}");
//                },),
//                Builder(builder: (context){
//                  return FlatButton(
//                    child: Text("添加商品"),
//                    onPressed: (){
//                      print("按钮开始点击");
//                      var mount = ChangeNotifierProvider.of<CarModel>(context);
//                      Item item = Item(3.6, 19);
//                      mount.addItem(item);
//                    },
//                  );
//                }),
//              ],
//            );
//          }),
//        )
//      ),
//    );
//  }
//}

//上面代码的优化
//1.显示的调用ChangeNotifierProvider
//2.每次添加商品都会重新构建FlatButton按钮

//优化实现
//1.定义一个便利获取Provider的类
class Customer<T> extends StatelessWidget {
  Customer({Key key,@required this.builder,this.child,this.listen = true}):
        assert(builder != null),
        super(key:key);
  final Widget child;

  final Widget Function(BuildContext context,T value) builder;

  final bool listen;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("定义的Customer的值====${this.listen}");
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context,listener: this.listen)
    );
  }

}

class _MyShopCarState extends State<MyShopCarDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Center(
          child: ChangeNotifierProvider<CarModel>(
            data: CarModel(),
            child: Builder(builder: (context){
              return Column(
                children: <Widget>[
                  //跨组件实现状态共享，修改数据对应的组件也同步数据
                  Customer<CarModel>(builder: (context,value)=>Text("总价:${value.totalPrice}")),
                  Builder(builder: (context){
                    print("重新构建按钮");
                    return FlatButton(
                      child: Text("添加商品"),
                      onPressed: (){
                        print("按钮开始点击");
                        //设置为false，不建立依赖关系
                        var mount = ChangeNotifierProvider.of<CarModel>(context,listener: false);
                        Item item = Item(3.6, 19);
                        mount.addItem(item);
                      },
                    );
                  }),
                ],
              );
            }),
          )
      ),
    );
  }
}