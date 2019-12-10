### 1.layout学习笔记

> 1.Row和Column 线性布局
> * 对应的设置内容
 ```
 Column和Row的实现都是一样的，只是初始值的时候有些变化
Row({
    Key key,
    //表示子组件在Row所占用的水平空间内对齐方式，如果mainAxisSize值为MainAxisSize.min，
    //则此属性无意义，因为子组件的宽度等于Row的宽度。
    //只有当mainAxisSize的值为MainAxisSize.max时，此属性才有意义
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    
    //表示Row在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，此时无论子widgets实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
    //而MainAxisSize.min表示尽可能少的占用水平空间，当子组件没有占满水平剩余空间，
    //则Row的实际宽度等于所有子组件占用的的水平空间
    MainAxisSize mainAxisSize = MainAxisSize.max,
    
    //表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    
    //表示水平方向子组件的布局顺序(是从左往右还是从右往左)
    TextDirection textDirection,
    
    VerticalDirection verticalDirection = VerticalDirection.down,
    
    TextBaseline textBaseline,
    
    List<Widget> children = const <Widget>[],
  })
  
  
 ```
 * 特殊情况说明
 * <font color=#ff0000 size=4>如果Row里面嵌套Row，或者Column里面再嵌套Column，
   那么只有对最外面的Row或Column会占用尽可能大的空间，
   里面Row或Column所占用的空间为实际大小</font>
>
>
> 2.Flex和Expanded 弹性布局
```
Flex组件可以沿着水平或垂直方向排列子组件，如果你知道主轴方向，
使用Row或Column会方便一些，因为Row和Column都继承自Flex，参数基本相同，
所以能使用Flex的地方基本上都可以使用Row或Column。Flex本身功能是很强大的，
它也可以和Expanded组件配合实现弹性布局。

Flex({
  ...
  @required this.direction, //弹性布局的方向, Row默认为水平方向，Column默认为垂直方向
  List<Widget> children = const <Widget>[],
})
设置方向是必须的

Expanded
可以按比例“扩伸” Row、Column和Flex子组件所占用的空间。
const Expanded({
  //flex参数为弹性系数，如果为0或null，则child是没有弹性的，
  //即不会被扩伸占用的空间。如果大于0，
  //所有的Expanded按照其flex的比例来分割主轴的全部空闲空间。
  int flex = 1, 
  @required Widget child,
})
Flex和Expanded配合使用可以实现弹性布局，Expanded中设置flex对应的比例，expanded在flex中所占用的比例
```
>
> 3.Wrap和Flow  流式布局

```
Wrap({
  ...
  this.direction = Axis.horizontal,
  this.alignment = WrapAlignment.start,
  this.spacing = 0.0,
  this.runAlignment = WrapAlignment.start,
  this.runSpacing = 0.0,
  this.crossAxisAlignment = WrapCrossAlignment.start,
  this.textDirection,
  this.verticalDirection = VerticalDirection.down,
  List<Widget> children = const <Widget>[],
})
```
对比Row和Column，我们只需要关注
* this.spacing = 0.0,//主轴方向间距
* this.runAlignment = WrapAlignment.start, //纵轴方向的对齐方式
* this.runSpacing = 0.0,//纵轴方向的间距

Flow 主要要实现其代理方法中的“void paintChildren(FlowPaintingContext context)"
不能自适应子组件大小，必须通过指定父容器大小或实现Delegate的getSize返回固定大小
```
bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
  
getSize(BoxConstraints constraints){
    //指定Flow的大小  
    return Size(double.infinity,200.0);
}
//确定每个widget的位置
void paintChildren(FlowPaintingContext context) {
}

```

> 4.Stack和Positioned

Stack允许子组件堆叠，而Positioned用于根据Stack的四个角来确定子组件的位置。
```
Stack({
  //此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子组件
  this.alignment = AlignmentDirectional.topStart,
  this.textDirection,
  //fit：此参数用于确定没有定位的子组件如何去适应Stack的大小。StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小。
  this.fit = StackFit.loose,
  //此属性决定如何显示超出Stack显示空间的子组件；值为Overflow.clip时，超出部分会被剪裁（隐藏），值为Overflow.visible 时则不会。
  this.overflow = Overflow.clip,
  List<Widget> children = const <Widget>[],
})

const Positioned({
  Key key,
  this.left, 
  this.top,
  this.right,
  this.bottom,
  this.width,
  this.height,
  @required Widget child,
})
positioned的定位设置，同一方向的设置不能冲突

stack中使用fit=Stack.expand属性，没有定位的widget会遮盖上面的子widget
```