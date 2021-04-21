//
//  03.flutterEngineGroup
//  flutter_app_demo
//
//  Created by zhangjiang on 4/21/21 .
//  Copyright © flutter_app_demo. All rights reserved.

import 'package:flutter/material.dart';

// FlutterEngineGroup 方案使用了多个engine 混合模式，官方宣称除了一个engine 对象之外，
// 后续每个engine对象在Android 和 iOS 上仅占用180kb(以前的方案，每多一个engine 可能会多出19M android和13M iOS)
// Flutter官方给的例子看，FlutterEngineGroup的API 很简单，【多个engine实例的内部都是独立维护自己的内部导航堆栈】
// 所以可以做到每个engine对应一个独立的模块