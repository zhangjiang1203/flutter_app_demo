import 'package:flutter/material.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJColorsTool.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class GridViewDemo extends StatefulWidget {
  GridViewDemo({Key key}) : super(key:key);

  @override
  _GridViewState createState() => _GridViewState();


}

class _GridViewState extends State<GridViewDemo> {

  int _currentIndex = 1;
  static List titleArr = ["MaxCrossGrid","FixedCross","CountGrid","ExtentGrid","GridBuilder","mulGrid","多彩"];

  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(3, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(4, 1),
  ];
  List<Widget> iconLists = [];
  void _onChangeGridView(){
    setState(() {
      if (_currentIndex >= 7) {
        _currentIndex = 1;
        return;
      }
      _currentIndex++;
    });
  }

  Widget createGridView(int index) {
    switch(index){
      case 1:
        return GridView(
        //该子类实现了一个横轴子元素为固定最大长度的layout算法
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //横轴上的最大长度
            maxCrossAxisExtent: 80,
            //主轴间距
            mainAxisSpacing: 0,
            //纵轴间距
            crossAxisSpacing: 0,
            //宽高比
            childAspectRatio: 2,
          ),
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        );
        break;
      case 2:
        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴上子元素的数量
            crossAxisCount: 3,
            //主轴间距
            mainAxisSpacing: 0,
            //纵轴间距
            crossAxisSpacing: 0,
            //宽高比
            childAspectRatio: 2,
          ),
          children: <Widget>[
            Icon(Icons.nature),
            Icon(Icons.map),
            Icon(Icons.verified_user),
            Icon(Icons.query_builder),
            Icon(Icons.unarchive),
            Icon(Icons.g_translate),
          ],
        );
        break;
      case 3:
        //SliverGridDelegateWithFixedCrossAxisCount的遍历构造方法，默认实现这个delegate
        return GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 1,
          children: <Widget>[
            Icon(Icons.home),
            Icon(Icons.arrow_left),
            Icon(Icons.backup),
            Icon(Icons.drag_handle),
            Icon(Icons.cake),
            Icon(Icons.not_interested),
          ],
        );
        break;
      case 4:
        return GridView.extent(
          maxCrossAxisExtent: 120,
          children: <Widget>[
            Icon(Icons.nature_people),
            Icon(Icons.wallpaper),
            Icon(Icons.pan_tool),
            Icon(Icons.data_usage),
            Icon(Icons.face),
            Icon(Icons.keyboard),
          ],

        );
        break;
      case 5:
        //当listview中项目比较多的时候使用gridBuild这种有Sliver的性能更好
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 1.0,
            ),
            //必须设置itemCount,否则执行的时候会超出range
            itemCount: iconLists.length,
            itemBuilder: (context,index){
              //滚动到当前位置，并且总数少于100
              if(index == iconLists.length -1 && iconLists.length < 100){
                addGridData();
              }
              return Container(
                color: ZJColor.randomColor(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    iconLists[index],
                    Text("$index",style: ZJTextStyleTool.white_36),
                  ],
                ),
              );
            });
        break;
      case 6:
        return StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.green,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) =>
          /// [mainAxisCellCount].
          ///
          /// The main axis extent of this tile will be the length of
          /// [mainAxisCellCount] cells (inner spacings included).
          /// 主轴和纵轴上子元素的个数
          new StaggeredTile.count(2, index.isEven ? 1 : 2),

        );
      case 7:
        return StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.green,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('$index'),
                ),
            )),
            staggeredTileBuilder: (int index) =>_staggeredTiles[index],
            );
      default:
        return GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //横轴上的最大长度
            maxCrossAxisExtent: 80,
            //主轴间距
            mainAxisSpacing: 0,
            //纵轴间距
            crossAxisSpacing: 0,
            //宽高比
            childAspectRatio: 2,
          ),
          children: <Widget>[
            Icon(Icons.adjust),
            Icon(Icons.date_range),
            Icon(Icons.pages),
            Icon(Icons.shop),
            Icon(Icons.beenhere),
            Icon(Icons.dock),
          ],
        );
    }
  }
  
  void addGridData(){
    Future.delayed(Duration(seconds: 2)).then((e){
      iconLists.addAll([
        Icon(Icons.adjust,color: Colors.white),
        Icon(Icons.date_range,color: Colors.white),
        Icon(Icons.pages,color: Colors.white),
        Icon(Icons.shop,color: Colors.white),
        Icon(Icons.beenhere,color: Colors.white),
        Icon(Icons.dock,color: Colors.white),
      ]);
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addGridData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(titleArr[_currentIndex-1]),
        actions: <Widget>[
          TextButton(
            child: Text("修改GridView",style: ZJTextStyleTool.white_28,),
            onPressed: _onChangeGridView,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //设置确定的大小
          Expanded(
            child: createGridView(_currentIndex),
          ),
        ],
      ),
    );
  }
}