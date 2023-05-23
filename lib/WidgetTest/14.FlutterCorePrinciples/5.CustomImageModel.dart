/*
* CustomImageModel created by zj 
* on 2020/5/6 3:42 PM
* copyright on zhangjiang
*/

import 'package:flutter/material.dart';

class CustomImageModel extends StatefulWidget {
  CustomImageModel({Key? key}) : super(key: key);

  @override
  _CustomImageModel createState() => _CustomImageModel();
}

class _CustomImageModel extends State<CustomImageModel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CustomImageModel1232"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MyImageWidget(imageProvider: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1588765256609&di=106ebb3a991111ed515fb2ae04806bd3&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F14%2F75%2F01300000164186121366756803686.jpg'
              )),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


/// 自定义Image组件
class MyImageWidget extends StatefulWidget {

  MyImageWidget({
    Key? key,
    required this.imageProvider
  }) :assert(imageProvider != null),
        super(key:key);

  final ImageProvider imageProvider;

  @override
  _MyImageWidgetState createState() => _MyImageWidgetState();

}

class _MyImageWidgetState extends State<MyImageWidget> {

  //定义image数据流和数据信息
  late ImageStream _imageStream;
  late ImageInfo _imageInfo;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //依赖改变的时候刷新图片
    _getImage();
  }

  @override
  void didUpdateWidget(MyImageWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    //组件不一致，刷新当前image
    if(widget.imageProvider != oldWidget.imageProvider) {
      _getImage();
    }
  }


  void _getImage(){
    final ImageStream oldImageStream = _imageStream;
    //调用ImageProvider.resolve方法获取ImageStream
    _imageStream = widget.imageProvider.resolve(createLocalImageConfiguration(context));
    //判断新旧ImageStream是否相同
    if(_imageStream.key != oldImageStream?.key) {
      final ImageStreamListener listener = ImageStreamListener(_updateImage);
      oldImageStream?.removeListener(listener);
      _imageStream.addListener(listener);
    }
  }


  void _updateImage(ImageInfo imageInfo,bool synchronousCall){
    setState(() {
      _imageInfo = imageInfo;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _imageStream.removeListener(ImageStreamListener(_updateImage));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawImage(
      image: _imageInfo?.image,
      scale: _imageInfo?.scale ?? 1.0,
    );
  }
}