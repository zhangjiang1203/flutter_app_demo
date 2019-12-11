import 'package:flutter/material.dart';

class ContainerBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ContainerBox"),
        actions: <Widget>[
          //这样直接设置SizeBox会产生变形的效果，父控件对子控件产生了影响
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
              value: 0.8,
            ),
          ),
          UnconstrainedBox(
            //去除父级控件的限制，真实的宽高为20 20 ，父控件依然占有对应的位置
            child:  SizedBox(
            width: 30,
            height: 30,
            child:  CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
              value: 0.8,
            ),
          ),
          ),
        ],
      ),
      body: Container(
//        width: double.infinity,
//        height: double.infinity,
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              //ConstrainedBox设置对应的最大和最小宽度，下面的控件不论设置的大或者小都是依照这个标准进行布局
              //BoxContraints有便利构造方法BoxConstraints.tight(size)生成指定大小 BoxConstraints.expand()生成一个尽可能大的
              constraints: BoxConstraints(maxHeight: 100,minWidth: double.infinity),
              child: Container(
                height: 50,
                color: Colors.green,
                child: DecoratedBox(decoration: BoxDecoration(color: Colors.white),),
              ),
            ),
            SizedBox(
              width: 80,
              height: 80,
              // DecoratedBox 指定大小的box，实质上就是BoxConstraints设置min max都是一样的
              child: DecoratedBox(decoration: BoxDecoration(color: Colors.red),),
            ),

            //多重设置，父子多重设置那个起作用  1
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 60,minWidth: 60),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 20,minWidth: 90),
                child: DecoratedBox(decoration: BoxDecoration(color: Colors.blueGrey),),
              ),
            ),
            //设置对应的                  2
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 20,minWidth: 90),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 60,maxHeight: 60),
                child: DecoratedBox(decoration: BoxDecoration(color: Colors.blue),),
              ),
            ),
            //1和2对应的出来的结果是相同的，对于多重限制，minHeigt和minWidth来说，会使用父控件和子控件中相对最大的来设置
            //同样的对于maxWidth和maxHeight来说同时设置最大的话 两个控件都不会显示，设置的最大宽度并不一定会达到

            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90,minHeight: 30),
              child: UnconstrainedBox(
                //去除父级控件对下面对象的约束限制，按照子控件的尺寸显示，但这并不是真正的去除限制，只是不影响最终子元素，还是占据对应的空间
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 100,minWidth: 30),
                  child: DecoratedBox(decoration: BoxDecoration(color: Colors.amber),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}