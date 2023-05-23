/*
* UserJsonModelChange created by zj 
* on 2020/5/6 4:25 PM
* copyright on zhangjiang
*/

import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

//文件名，必须是完整的文件名，不是自己定义的类名
part '9.UserJsonModelChange.g.dart';

///告诉生成器这个类要生成Model类
@JsonSerializable()

class User{
  User(this.name,this.email);

  String name;
  String email;
  int? age;
  String? address;
  double? height;

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);

  Map<String,dynamic> toJson() => _$UserToJson(this);
}

///@JsonKey() 用于自定义命名策略
///显式关联JSON字段名与Model属性的对应关系
///@JsonKey(name: 'registration_date_millis')
///final int registrationDateMillis;