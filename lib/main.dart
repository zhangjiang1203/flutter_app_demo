//导入包

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/WidgetTest/15.NetStudy/01.ShowFirstPage.dart';
import 'package:flutter_app_demo/WidgetTest/15.NetStudy/02.GlobalKeyTest.dart';
import 'package:flutter_app_demo/WidgetTest/16.PathAndAnimation/03.test_transform_model.dart';
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/01.paint_basic_demo.dart';
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/02.property_learn_test.dart';
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/03.canvas_action_model.dart';
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/04.paint_point_model.dart';
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/05.paint_rect_model.dart';
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/06.paint_image_text_model.dart';
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/07.path_paint_model.dart';
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/08.paint_color_widget.dart';
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/10.animation_paint_test1.dart';
import 'package:flutter_app_demo/WidgetTest/17.juejinPaintAndAnimation/12.curve_animation_widget.dart';
import 'package:flutter_app_demo/WidgetTest/6.ScrollableDemo/7.ScrollTableModel.dart';
import 'package:flutter_app_demo/WidgetTest/7.BuilderThemeAndColor/10.ListViewAndDialog.dart';
import 'WidgetTest/16.PathAndAnimation/02.wave_path_demo.dart';
import 'WidgetTest/17.juejinPaintAndAnimation/09.custom_paint_test.dart';
import 'WidgetTest/17.juejinPaintAndAnimation/11.custom_tween_animation.dart';
import 'WidgetTest/7.BuilderThemeAndColor/8.StreamBuilderModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_demo/WidgetTest/Tools/ZJTextStyleTool.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';

import 'WidgetTest/3.BasicWidgetDemo/8.FormsModelTest.dart';
import 'WidgetTest/3.BasicWidgetDemo/6.TextFieldModel.dart';
import 'WidgetTest/3.BasicWidgetDemo/7.TextFocusNode.dart';
import 'WidgetTest/3.BasicWidgetDemo//3.StatelessWidgeTest.dart';
import 'WidgetTest/3.BasicWidgetDemo/4.CupertinoStyle.dart';
import 'WidgetTest/3.BasicWidgetDemo/5.WidgetStateTest.dart';
import 'WidgetTest/3.BasicWidgetDemo/1.newRouteButton.dart';
import 'WidgetTest/3.BasicWidgetDemo/2.InfoPage-IconAndImage.dart';
import 'WidgetTest/3.BasicWidgetDemo/9.ProcessModelTest.dart';
import 'WidgetTest/3.BasicWidgetDemo/10.AnimateProcessModelTest.dart';

import 'WidgetTest/4.LayoutTest/1.ColumnAndRowTest.dart';
import 'WidgetTest/4.LayoutTest/2.FlexLayoutDemo.dart';
import 'WidgetTest/4.LayoutTest/3.WrapLayoutDemo.dart';
import 'WidgetTest/4.LayoutTest/4.FlowLayoutDemo.dart';
import 'WidgetTest/4.LayoutTest/5.StackAndPositionDemo.dart';
import 'WidgetTest/4.LayoutTest/6.AlignLayoutDemo.dart';
import 'WidgetTest/4.LayoutTest/7.PaddingDemo.dart';
import 'WidgetTest/4.LayoutTest/8.ContainerBoxDemo.dart';
import 'WidgetTest/4.LayoutTest/9.DecoratedBoxDemo.dart';
import 'WidgetTest/4.LayoutTest/10.FlexContainerDemo.dart';

import 'WidgetTest/5.ContainerCollection/1.ScaffoldDemo.dart';
import 'WidgetTest/5.ContainerCollection/2.AppBarDemo.dart';
import 'WidgetTest/5.ContainerCollection/3.DrawerDemo.dart';
import 'WidgetTest/5.ContainerCollection/4.BottomNavBarDemo.dart';
import 'WidgetTest/5.ContainerCollection/5.ClipRectDemo.dart';

import 'WidgetTest/6.ScrollableDemo/1.SignalChildScrollDemo.dart';
import 'WidgetTest/6.ScrollableDemo/2.ListViewDemo.dart';
import 'WidgetTest/6.ScrollableDemo/3.GridViewDemo.dart';
import 'WidgetTest/6.ScrollableDemo/4.SliverGridViewDemo.dart';
import 'WidgetTest/6.ScrollableDemo/5.ScrollControllerDemo.dart';
import 'WidgetTest/6.ScrollableDemo/6.NotificationScrollController.dart';

import 'WidgetTest/7.BuilderThemeAndColor/1.WillPopScopeDemo.dart';
import 'WidgetTest/7.BuilderThemeAndColor/2.InheritedWidgetDemo.dart';
import 'WidgetTest/7.BuilderThemeAndColor/ShopCarDemo/3.ShopModel.dart';
import 'WidgetTest/7.BuilderThemeAndColor/4.ThemeAndColor.dart';
import 'WidgetTest/7.BuilderThemeAndColor/5.ThemeTestDemo.dart';
import 'WidgetTest/7.BuilderThemeAndColor/6.ChangeGlobalThemeDemo.dart';
import 'WidgetTest/7.BuilderThemeAndColor/7.BuilderWidgetModel.dart';
import 'WidgetTest/7.BuilderThemeAndColor/8.StreamBuilderModel.dart';
import 'WidgetTest/7.BuilderThemeAndColor/9.DialogTestDemo.dart';

import 'WidgetTest/8.EventAndNotifier/1.PointEventModel.dart';
import 'WidgetTest/8.EventAndNotifier/2.GestureDetectorModel.dart';
import 'WidgetTest/8.EventAndNotifier/3.DragOrScrollViewModel.dart';
import 'WidgetTest/8.EventAndNotifier/4.GestureRecongnizerModel.dart';
import 'WidgetTest/8.EventAndNotifier/4.GestureCompeteAndConflict.dart';
import 'WidgetTest/8.EventAndNotifier/6.NotificationTest.dart';
import 'WidgetTest/8.EventAndNotifier/7.CustomNotificationModel.dart';
import 'WidgetTest/8.EventAndNotifier/8.StopBubblingNotificationModel.dart';

import 'WidgetTest/9.AnimateWidgetModel/1.ScaleAnimationModel.dart';
import 'WidgetTest/9.AnimateWidgetModel/2.AnimatedWidgetModel.dart';
import 'WidgetTest/9.AnimateWidgetModel/3.AnimatedBuilderModel.dart';
import "WidgetTest/9.AnimateWidgetModel/4.AnimatedStatusModel.dart";
import 'WidgetTest/9.AnimateWidgetModel/5.CustomRouteAnimationModel.dart';
import 'WidgetTest/9.AnimateWidgetModel/6.HeroTransitionAnimationModel.dart';
import 'WidgetTest/9.AnimateWidgetModel/7.StaggerAnimationModel.dart';
import 'WidgetTest/9.AnimateWidgetModel/8.AnimationSwitcherModel.dart';
import 'WidgetTest/9.AnimateWidgetModel/9.AnimatedCrossFadeModel.dart';
import 'WidgetTest/9.AnimateWidgetModel/10.AdvanceAnimatedModel.dart';
import 'WidgetTest/9.AnimateWidgetModel/11.AnimatedDecorationBoxModel.dart';
import 'WidgetTest/9.AnimateWidgetModel/12.CustomImpcilityAnimationModel.dart';
import 'WidgetTest/9.AnimateWidgetModel/13.PresetAnimationModel.dart';

import 'WidgetTest/10.CustomCombineWidget/1.GradientButtonModel.dart';
import 'WidgetTest/10.CustomCombineWidget/2.CustomTurnBoxModel.dart';
import 'WidgetTest/10.CustomCombineWidget/3.CustomTextSpanModel.dart';
import 'WidgetTest/10.CustomCombineWidget/4.CustomPaintTestModel.dart';
import 'WidgetTest/10.CustomCombineWidget/5.CustomCircleProgressModel.dart';

import 'WidgetTest/11.FileNetAndDataTrans/1.FileOperationModel.dart';
import 'WidgetTest/11.FileNetAndDataTrans/2.FileBasicOperationModel.dart';
import 'WidgetTest/11.FileNetAndDataTrans/3.HttpClientModelTest.dart';
import 'WidgetTest/11.FileNetAndDataTrans/5.DioHttpClientModel.dart';
import 'WidgetTest/11.FileNetAndDataTrans/7.WebSocketConnectModel.dart';
import 'WidgetTest/11.FileNetAndDataTrans/8.JosnToModelTest.dart';

import 'WidgetTest/13.flutterInternationalization/1.InternalLanguageTest.dart';
import 'WidgetTest/14.FlutterCorePrinciples/5.CustomImageModel.dart';
import 'WidgetTest/16.PathAndAnimation/01.test_path_model.dart';

//设置多语言支持
import 'WidgetTest/Tools/LocaleTool.dart';
import 'WidgetTest/Tools/TranslationsLanauage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:io';
//应用程序的入口，使用=> 这是单行函数的简写
void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();

}

//MyApp类代表Flutter应用，它继承了 StatelessWidget类，这也就意味着应用本身也是一个widget。
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  //Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()
  //方法来描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
  //系统的主题色
  Color _themeColor ;

  ///app内部修改语言时，强制更新app
  SpecificLocalizationDelete _localeOverrideDelegate;

  /// 刷新本地对应的语言
  void _onLocaleChanged(Locale locale){
    setState(() {
      print("当前系统语言开始改变==${locale.languageCode}");
      _localeOverrideDelegate = new SpecificLocalizationDelete(locale);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化当前的语言
    // localTool.getCurrentUserLanguage().then((e){
    //   print("本地语言==$e");
    //   _onLocaleChanged(Locale(e,''));
    // });

    /// 初始化一个新的Localization Delegate，有了它，当用户选择一种新的工作语言时，可以强制初始化一个新的Translations
    _localeOverrideDelegate = new SpecificLocalizationDelete(null);
    /// 保存这个方法的指针，当用户改变语言时，我们可以调用localTool.onLocaleChanged(new Locale('en',''));，通过SetState()我们可以强制App整个刷新
    localTool.onLocaleChangeed = _onLocaleChanged;
  }

  Map<String,WidgetBuilder> _getAllRoutes(BuildContext context){
    return {
      "/":(context) => MyHomePage(title: "Flutter Demo Home Page"),
      "new_page":(context)=>NewRoute(),
      //TipRoute组件初始化的时候必须加参数，ModalRoute获取传参
      "info_page":(context)=>TipRoute(text: ModalRoute.of(context).settings.arguments),
      "counter_page":(context) => ZJCounterWidget(),
      "cupertino_page":(context) => CupertinoRoute(),
      "widget_self":(context) => WidgetSelfBoxA(),
      "parent_widget":(context) => ParentStateWidget(),
      "mix_widget":(context) => MixControlState(),
      "textField_widget":(context) => TextFieldModelTest(),
      "focus_widget":(context) => TextFocusModel(),
      "forms_widget":(context) => FormsModelTest(),
      "process_widget":(context) => ProcessModelTest(),
      "process_animate_widget":(context) => AnimateProcessModelTest(),
      //4
      "layout_Column":(context) => ColumnAndRowTest(),
      "layout_Flex":(context) => FlexStateDemo(),
      "layout_Wrap":(context) => WrapLayoutDemo(),
      "layout_Flow":(context) => FlowLayoutDemo(),
      "layout_Stack":(context) => StackAndPositonDemo(),
      "layout_Align":(context) => AlignLayoutDemo(),
      "Container_padding":(context) => PaddingModelTest(),
      "Container_Box":(context) => ContainerBoxDemo(),
      "Contailer_DecoratedBox":(context) => DecoratedBoxDemo(),
      "Flex_container":(context)=> FlexContainerDemo(),
      //5
      "Scaffold_demo":(context) => ScaffoldDemo(),
      "AppBar_demo":(context) => AppBarDemo(),
      "Drawer_demo":(context) => DrawerDemo(),
      "BottomNavBar_demo":(context) => BottomNavBarDemo(),
      "ClipRect_demo":(context) => ClipRectDemo(),
      //6
      "SignalChild_demo":(context) => SignalScrollViewDemo(),
      "listview_demo":(context) => ListViewDemo(),
      "gridview_demo":(context) => GridViewDemo(),
      "sliver_grid_view":(context) => SliverGridViewDemo(),
      "scrollcontroller_demo":(context) => ScrollControllerDemo(),
      "notification_scrollView":(context) => NotificationScrollController(),
      "scrollView_table":(context) => ScrollTableModel(),
      //7
      "nav_popScope_demo":(context) => WillPopScopeDemo(),
      "inherited_demo":(context) => InheritedWidgetDemo(),
      "shopcar_demo":(context) => MyShopCarDemo(),
      "custom_navbar_demo":(context) => ThemeAndColorDemo(),
      "custom_theme_demo":(context) => ThemeTestDemo(),
      "change_global_theme":(context) => ChangeGlobalThemeDemo(),
      "builder_future_model":(context) => BuilderWidgetModel(),
      "stream_future_model":(context) => StreamBuilderDemo(),
      "dialog_test_model":(context) => DialogTestModel(),
      "list_dialog_pop":(context) => ListViewAndDialog(),
      //8
      "nav_pointer_event":(context) => PointerEventModelTest(),
      "gesture_event":(context)=> GestureDetectorModel(),
      "dragandScroll":(context)=> DragOrScrollViewModel(),
      "taprecognizer":(context)=> GestureRecognizerModel(),
      "gesture_conflict":(context)=> GestureCompeteAndConflict(),
      "notification_test":(context)=> NotificationTest(),
      "custom_notification_test":(context) => CustomNotificationModel(),
      "stop_bubbling_notification":(context) => StopBubblingNotificationModel(),
      //9
      "scale_image_animate":(context) => ScaleAnimationModel(),
      "animated_widget_model":(context) => AnimatedWidgetModel(),
      "animated_builder_model":(context) => AnimatedBuilderModel(),
      "animated_status_model":(context) => AnimatedStatusModel(),
      "custom_route_animate":(context) => CustomRouteAnimationModel(),
      "hero_route_animate":(context) => HeroTransitionAnimationModel(),
      'stagger_route_model':(context) => StaggerAnimationModel(),
      'switcher_animation_model':(context) => AnimationSwitcherModel(),
      'animated_cross_fade_model':(context)=> AnimatedCrossFadeModel(),
      "advance_switcher_animated_model":(context) => AdvanceAnimatedModel(),
      "custom_animated_decoration_box":(context) => AnimatedDecorationBoxModel(),
      "impcility_animation_decoration":(context) => CustomImpcilityAnimationModel(),
      "preset_animation_model":(context) => PresetAnimationModel(),
      //10
      "custom_gradient_button":(context) => GradientButtonModel(),
      "turn_box_model":(context) => CustomTurnBoxModel(),
      "match_url_textspan":(context) => CustomTextSpanModel(),
      "paint_chess_model":(context) => CustomPaintTestModel(),
      "circular_progress_paint":(context) => CustomCircleProgressModel(),
      //11
      "file_operation_model":(context) => FileOperationModel(),
      "file_basic_operation_model":(context) => FileBasicOperationModel(),
      "http_client_model":(context) => HttpClientModelTest(),
      "dio_test_model":(context) => DioHttpClientModel(),
      "socket_connect_model":(context) => WebSocketConnectModel(),
      "json_to_model":(context) => JosnToModelTest(),

      //13
      "interal_language_code":(context) => InternalLanguageTest(),

      //14
      "image_widget_custom":(context) => CustomImageModel(),
      //15
      "net_status_model":(context) => FirstPageStudy(),
      "global_keys_model":(context) => TestGlobalKeyModel(),
      //16
      "clip_path_widget":(context) => TestPathLocalModel(),
      "wave_path_widget":(context) => WaveTestModel(),
      "transform_widget":(context) => TestTransformModel(),
      //17
      "basic_paint_widget":(context)=> BasicPaintLearnDemo(),
      "basic_property_widget":(context)=>PropertyLearnDemo(),
      "canvas_action_widget":(context)=> CanvasActionModel(),
      "paint_point_widget":(context)=> PaintPointModel(),
      "paint_rect_widget":(context)=> PaintRectModel(),
      "paint_image_text":(context)=> PaintImageAndTextModel(),
      "path_paint_test":(context)=> PathPaintTest(),
      "paint_color_widget":(context)=> PaintColorWidget(),
      "custom_paint_test":(context)=> CustomPaintTest(),
      "animation_paint_test":(context)=> AnimationPaintTest1(),
      "custom_animation_tween":(context)=> CustomTweenAnimationWidget(),
      "curve_animation_widget":(context)=> CurveAnimationTest(),
    };
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AppInfoProvider())],
      child: Consumer<AppInfoProvider>(
        builder: (context,appinfo,_){
          _themeColor = appinfo.themeColor;
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: _themeColor,
            ),
            ///设置多语言---start
            onGenerateTitle: (context){
              return TranslationsLanguage.of(context).text("home_title");
            },
            localizationsDelegates: [
              _localeOverrideDelegate,//更改language之后强制刷新delegate
              const TranslationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: localTool.supportLocales(),
            localeResolutionCallback: (deviceLocale, supportedLocales){
              print("当前系统的语言是$deviceLocale,支持的语言$supportedLocales");
              ///返回当前的系统语言
              return deviceLocale;
            },
            ///多语言支持---end
            initialRoute: "/",//名为‘/’的路由作为应用的home首页
            routes: _getAllRoutes(context),
            onGenerateRoute: (RouteSettings settings){
              return MaterialPageRoute(
                builder: (context){
                  String routeName = settings.name;
                  //根据返回的routename做权限判断
                  if(routeName == ''){
                    return JosnToModelTest();
                  }
                  return null;
                }
              );
            },
          );
        },
      ),
    );

//  return
  }
}

//有状态的组件（Stateful widget） 和无状态的组件（Stateless widget）
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//_MyHomePageState类是MyHomePage类对应的状态类
class _MyHomePageState extends State<MyHomePage> {
  bool _showFloatBtn = false;
  SectionTableController _controller;

  List<Map<String,Object>> pushVCArr;
//  该函数的作用是先自增_counter，然后调用setState 方法
//  setState方法的作用是通知Flutter框架，有状态发生了改变，Flutter框架收到通知后，
//  会执行build方法来根据新的状态重新构建界面，
//  Flutter 对此方法做了优化，使重新执行变的很快，所以你可以重新构建任何需要更新的东西，而无需分别去修改各个widget

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = SectionTableController(sectionTableViewScrollTo: (section, row, isScrollDown) {
      setState(() {
        _showFloatBtn = section > 2;
      });
    });

    _controller.addListener((){
      print(_controller);
    });
    //初始化对应的信息
    pushVCArr = [
      {"section":"3.基础组件","row":[
        {"title":"新路由", "pushVC":"new_page", },
        {"title":"打开提示页", "pushVC":"info_page", },
        {"title":"加法器", "pushVC":"counter_page", },
        {"title":"提示框", "pushVC":"cupertino_page", },
        {"title":"自己管理", "pushVC":"widget_self", },
        {"title":"父管理", "pushVC":"parent_widget", },
        {"title":"混合管理", "pushVC":"mix_widget", },
        {"title":"输入框", "pushVC":"textField_widget", },
        {"title":"键盘焦点", "pushVC":"focus_widget", },
        {"title":"forms表单", "pushVC":"forms_widget", },
        {"title":"进度条", "pushVC":"process_widget", },
        {"title":"进度条动画", "pushVC":"process_animate_widget", }
        ]},
      {"section":"4.布局类组件","row":[
       {"title":"Column布局", "pushVC":"layout_Column", },
       {"title":"Flex布局", "pushVC":"layout_Flex", },
       {"title":"Wrap布局", "pushVC":"layout_Wrap", },
       {"title":"Flow布局", "pushVC":"layout_Flow", },
       {"title":"Stack布局", "pushVC":"layout_Stack", },
       {"title":"Align布局", "pushVC":"layout_Align", },
       {"title":"Padding布局", "pushVC":"Container_padding", },
       {"title":"Container布局", "pushVC":"Container_Box", },
       {"title":"DecoratedBox布局", "pushVC":"Contailer_DecoratedBox"},
        {"title":"Flex布局", "pushVC":"Flex_container"},
       ]},
      {"section":"5.容器类组件","row":[
      {"title":"Scaffold设置", "pushVC":"Scaffold_demo", },
      {"title":"AppBar设置", "pushVC":"AppBar_demo", },
      {"title":"Drawer设置", "pushVC":"Drawer_demo", },
      {"title":"navBar设置", "pushVC":"BottomNavBar_demo", },
      {"title":"clip设置", "pushVC":"ClipRect_demo", },
      ]},
      {"section":"6.可滚动组件","row":[
      {"title":"signalScrollView", "pushVC":"SignalChild_demo", },
      {"title":"listView", "pushVC":"listview_demo", },
      {"title":"GridView", "pushVC":"gridview_demo", },
      {"title":"SliverGridView", "pushVC":"sliver_grid_view", },
      {"title":"ScrollController", "pushVC":"scrollcontroller_demo", },
      {"title":"NotificationScroll", "pushVC":"notification_scrollView", },
      {"title":"ScrollTableModel", "pushVC":"scrollView_table", },
      ]},
      {"section":"7.功能型组件","row":[
        {"title":"导航返回拦截", "pushVC":"nav_popScope_demo", },
        {"title":"数据共享", "pushVC":"inherited_demo", },
        {"title":"跨组件状态共享", "pushVC":"shopcar_demo", },
        {"title":"颜色设置","pushVC":"custom_navbar_demo"},
        {"title":"修改主题","pushVC":"custom_theme_demo"},
        {"title":"修改全局主题","pushVC":"change_global_theme"},
        {"title":"BuilderModel","pushVC":"builder_future_model"},
        {"title":"StreamBuilder","pushVC":"stream_future_model"},
        {"title":"对话框测试","pushVC":"dialog_test_model"},
        {"title":"listView选择","pushVC":"list_dialog_pop"},
      ]},
      {"section":"8.事件处理和通知","row":[
        {"title":"原始指针事件", "pushVC":"nav_pointer_event", },
        {'title':'手势识别','pushVC':'gesture_event'},
        {'title':'手势拖动','pushVC':'dragandScroll'},
        {'title':'富文本处理','pushVC':'taprecognizer'},
        {'title':'手势竞争和冲突','pushVC':'gesture_conflict'},
        {'title':'通知','pushVC':'notification_test'},
        {"title":'自定义通知','pushVC':'custom_notification_test'},
        {"title":'通知冒泡','pushVC':'stop_bubbling_notification'},
      ]},
      {"section":"9.动画model","row":[
        {"title":"图片放缩动画", "pushVC":"scale_image_animate", },
        {'title':'AnimatedImage简化','pushVC':'animated_widget_model'},
        {'title':'AnimatedBuilderdemo','pushVC':'animated_builder_model'},
        {'title':'动画状态判断','pushVC':'animated_status_model'},
        {'title':'路由动画','pushVC':'custom_route_animate'},
        {'title':'hero动画路由','pushVC':'hero_route_animate'},
        {"title":'stagger交织动画','pushVC':'stagger_route_model'},
        {"title":'切换动画组件','pushVC':'switcher_animation_model'},
        {"title":'两组件的切换动画','pushVC':'animated_cross_fade_model'},
        {"title":'切换动画组件的高级用法','pushVC':'advance_switcher_animated_model'},
        {"title":'自定义过渡动画','pushVC':'custom_animated_decoration_box'},
        {"title":'继承过渡组件动画','pushVC':'impcility_animation_decoration'},
        {"title":'系统过渡组件动画','pushVC':'preset_animation_model'},
      ]},

      {"section":"10.自定义组件","row":[
        {"title":"渐变的按钮", "pushVC":"custom_gradient_button", },
        {'title':'组合控件turnbox','pushVC':'turn_box_model'},
        {'title':'text中url高亮','pushVC':'match_url_textspan'},
        {'title':'自定义棋盘','pushVC':'paint_chess_model'},
        {'title':'自定义进度条','pushVC':'circular_progress_paint'},
      ]},
      {"section":"11.文件、网络以及模型操作","row":[
        {"title":"文件的操作","pushVC":"file_operation_model"},
        {'title':'文件基本操作','pushVC':'file_basic_operation_model'},
        {"title":'httpclient网络访问','pushVC':'http_client_model'},
        {"title":'dio库引入','pushVC':'dio_test_model'},
        {"title":'webSocketModel','pushVC':'socket_connect_model'},
        {"title":'jsonToModel解析','pushVC':'json_to_model'},
      ]},

      {"section":"13.国际化设置","row":[
        {"title":"国际化","pushVC":"interal_language_code"},
      ]},

      {"section":"14.自定义image组件","row":[
        {"title":"自定义Image组件","pushVC":"image_widget_custom"},
      ]},
      {"section":"15.网络环境监控","row":[
        {"title":"网络环境变化","pushVC":"net_status_model"},
        {"title":"globalKey","pushVC":"global_keys_model"},
      ]},
      {"section":"16.自定义裁剪和动画","row":[
        {"title":"自定义裁剪","pushVC":"clip_path_widget"},
        {"title":"波浪造型","pushVC":"wave_path_widget"},
        {"title":"transform变换","pushVC":"transform_widget"},
      ]},
      {"section":"17.flutter Paint Canvas练习","row":[
        {"title":"画笔初识","pushVC":"basic_paint_widget"},
        {"title":"属性设置","pushVC":"basic_property_widget"},
        {"title":"canvas操作","pushVC":"canvas_action_widget"},
        {"title":"绘制点","pushVC":"paint_point_widget"},
        {"title":"绘制矩形","pushVC":"paint_rect_widget"},
        {"title":"绘制图片和文字","pushVC":"paint_image_text"},
        {"title":"路径基本使用","pushVC":"path_paint_test"},
        {"title":"颜色使用","pushVC":"paint_color_widget"},
        {"title":"CustomPaint简介","pushVC":"custom_paint_test"},
        {"title":"paint动画--吃豆子","pushVC":"animation_paint_test"},
        {"title":"custom_tween_paint","pushVC":"custom_animation_tween"},
        {"title":"curve_animation_test","pushVC":"curve_animation_widget"},
      ]},
    ];
  }

  //构建首页的UI界面
  @override
  Widget build(BuildContext context) {
    //Scaffold 是Material库中提供的页面脚手架，它包含导航栏和Body以及FloatingActionButton
    //如果需要的话）。 本书后面示例中，路由默认都是通过Scaffold创建。
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationsLanguage.of(context).text("home_title")),
      ),
      floatingActionButton: !_showFloatBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          //直接划到顶部
          _controller.animateTo(0, 0);
        },
      ),
      body: SafeArea(
        child: SectionTableView(
          sectionCount: pushVCArr.length,
          numOfRowInSection: (section) {
            Map sectionData = pushVCArr[section];
            List rowData = sectionData["row"];
            return rowData.length;
          },
          cellAtIndexPath: (section, row) {
            Map sectionData = pushVCArr[section];
            List rowData = sectionData["row"];
            Map rowMapData = rowData[row];
            return Container(
              height: 40,
              alignment: Alignment.center,
//              color: rowMapData["color"],
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  //没哟用positioned包裹的子widget会expaned父widget
                  Positioned(
                    left: 15,
                    top: 10,
                    child: Text(rowMapData["title"],
                      style: TextStyle(color: Color(0xff333333)),),
                  ),
                  FlatButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, rowMapData["pushVC"]),
                  ),
                ],
              ),
            );
          },
          headerInSection: (section) {
            Map sectionData = pushVCArr[section];
            return Container(
              color: Colors.black26,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(sectionData['section'].toString(),
                  style: ZJTextStyleTool.white_40,),
              ),
            );
          },
          divider: Container(
            color: Colors.green,
            height: 0.1,
          ),
          sectionHeaderHeight: (section) => 30,
          cellHeightAtIndexPath: (section, row) => 40,
          dividerHeight: () => 0.1,
          controller: _controller,
        ),

      ),
    );
  }
}


