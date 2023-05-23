### List&&GridViewNote

### 前沿说明
可滚动视图基本都直接或者间接包含一个scrollable的组件，有了这个子组件，
才能在超出屏幕范围的区域滚动。

### <font color=#ff0000>Scrollable</font>

```dart
  const Scrollable({
    Key? key,
    //设置滚动方向
    this.axisDirection = AxisDirection.down,
    //监听滚动事件和滚动位置
    this.controller,
    // 此属性接受一个ScrollPhysics类型的对象，它决定可滚动组件如何响应用户操作，
    // 比如用户滑动完抬起手指后，继续执行动画；或者滑动到边界时，如何显示。
    // 两个ScrollPhysics的子类
    // ClampingScrollPhysics：Android下微光效果。
    // BouncingScrollPhysics：iOS下弹性效果。
    this.physics,
    required this.viewportBuilder,
    this.excludeFromSemantics = false,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
  }) : assert(axisDirection != null),
       assert(dragStartBehavior != null),
       assert(viewportBuilder != null),
       assert(excludeFromSemantics != null),
       super (key: key);
```

### <font color=#ff0000>Scrollbar</font>
滚动指示器，会自动根据iOS或者安卓平台展示不同的UI，Scrollbar和CupertinoScrollbar都是通过ScrollController来监听滚动事件来确定滚动条位置的。
关于ScrollController的详细内容我们将在本章最后一节中专门介绍。
CupertinoScrollbar是iOS风格的滚动条，如果你使用的是Scrollbar，那么在iOS平台它会自动切换为CupertinoScrollbar

#### Sliver的延迟构建

通常可滚动组件的子组件可能会非常多、占用的总高度也会非常大；如果要一次性将子组件全部构建出将会非常昂贵！
为此，Flutter中提出一个Sliver（中文为“薄片”的意思）概念，如果一个可滚动组件支持Sliver模型，
那么该滚动可以将子组件分成好多个“薄片”（Sliver），只有当Sliver出现在视口中时才会去构建它，
这种模型也称为“基于Sliver的延迟构建模型”。

### 单个的ScrollView--SingleChildScrollView
这个主要指展示超出屏幕范围不大的视图，因为是一次绘制所有的子widget，绘制过多的widget会影响性能

```dart
SingleChildScrollView({
  this.scrollDirection = Axis.vertical, //滚动方向，默认是垂直方向
  this.reverse = false, 
  this.padding, 
  bool primary, 
  this.physics, 
  this.controller,
  this.child,
})
```

绘制A-Z的字符排序
```dart
class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar( // 显示进度条
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column( 
            //动态创建一个List<Widget>  
            children: str.split("") 
                //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(c, textScaleFactor: 2.0,)) 
                .toList(),
          ),
        ),
      ),
    );
  }
}
```


#### 1.构造listView
ListView是最常用的可滚动组件之一，它可以沿一个方向线性排布所有子组件，并且它也支持基于Sliver的延迟构建模型
```
ListView({
  ...  
  //可滚动widget公共参数
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController controller,
  bool primary,
  ScrollPhysics physics,
  EdgeInsetsGeometry padding,

  //ListView各个构造函数的共同参数  
  // 该参数如果不为null，则会强制children的“长度”为itemExtent的值；这里的“长度”是指滚动方向上子组件的长度
  double itemExtent,
  //该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false
  bool shrinkWrap = false,
  /*
  该属性表示是否将列表项（子组件）包裹在AutomaticKeepAlive 组件中；
  典型地，在一个懒加载列表中，如果将列表项包裹在AutomaticKeepAlive中，
  在该列表项滑出视口时它也不会被GC（垃圾回收），它会使用KeepAliveNotification来保存其状态。
  如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
  */
  bool addAutomaticKeepAlives = true,
  /*
  该属性表示是否将列表项包裹在RepaintBoundary中可以避免列表项重绘，
  但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，
  不添加RepaintBoundary反而会更高效。和addAutomaticKeepAlive一样，
  如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
  */
  bool addRepaintBoundaries = true,
  double cacheExtent,

  //子widget列表
  List<Widget> children = const <Widget>[],
})
```

<font color="red">再次强调，可滚动组件通过一个List来作为其children属性时，只适用于子组件较少的情况，这是一个通用规律，并非ListView自己的特性，像GridView也是如此。</font>
```
ListView(
  shrinkWrap: true, 
  padding: const EdgeInsets.all(20.0),
  children: <Widget>[
    const Text('I\'m dedicating every day to you'),
    const Text('Domestic life was never quite my style'),
    const Text('When you smile, you knock me out, I fall apart'),
    const Text('And I thought I was so smart'),
  ],
);
```
<font color="green">ListView.builder适合列表项比较多（或者无限）的情况，因为只有当子组件真正显示的时候才会被创建，也就说通过该构造函数创建的ListView是支持基于Sliver的懒加载模型的。</font>
```
ListView.builder(
    itemCount: 100,
    itemExtent: 50.0, //强制高度为50.0
    itemBuilder: (BuildContext context, int index) {
      return ListTile(title: Text("$index"));
    }
);
```

ListView.separated可以在生成的列表项之间添加一个分割组件，它比ListView.builder多了一个separatorBuilder参数，该参数是一个分割组件生成器。


<font color="red">重点</font>
listView在组件中必须确定大小，要自动适配父widget，通常使用Flex+Expanded，Column和row继承自flex，都可相互组合
```
Widget build(BuildContext context) {
  return Column(children: <Widget>[
    ListTile(title:Text("商品列表")),
    Expanded(
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      }),
    ),
  ]);
}
```