// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      userId: (json['userId'] as num?)?.toInt(),
      title: json['title'] as String?,
      id: (json['id'] as num?)?.toInt(),
      body: json['body'] as String?,
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'id': instance.id,
      'body': instance.body,
    };
