// GENERATED CODE - DO NOT MODIFY BY HAND

part of '9.UserJsonModelChange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['name'] as String,
    json['email'] as String,
  )
    ..age = json['age'] as int
    ..address = json['address'] as String
    ..height = (json['height'] as num)?.toDouble();
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'address': instance.address,
      'height': instance.height,
    };
