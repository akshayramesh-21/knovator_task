// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPostsImpl _$$GetPostsImplFromJson(Map<String, dynamic> json) =>
    _$GetPostsImpl($type: json['runtimeType'] as String?);

Map<String, dynamic> _$$GetPostsImplToJson(_$GetPostsImpl instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_$MarkAsReadImpl _$$MarkAsReadImplFromJson(Map<String, dynamic> json) =>
    _$MarkAsReadImpl(
      (json['postId'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MarkAsReadImplToJson(_$MarkAsReadImpl instance) =>
    <String, dynamic>{'postId': instance.postId, 'runtimeType': instance.$type};

_$UpdateTimerDurationImpl _$$UpdateTimerDurationImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateTimerDurationImpl(
  postId: (json['postId'] as num).toInt(),
  duration: (json['duration'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$UpdateTimerDurationImplToJson(
  _$UpdateTimerDurationImpl instance,
) => <String, dynamic>{
  'postId': instance.postId,
  'duration': instance.duration,
  'runtimeType': instance.$type,
};

_$InitializeFromLocalStorageImpl _$$InitializeFromLocalStorageImplFromJson(
  Map<String, dynamic> json,
) => _$InitializeFromLocalStorageImpl($type: json['runtimeType'] as String?);

Map<String, dynamic> _$$InitializeFromLocalStorageImplToJson(
  _$InitializeFromLocalStorageImpl instance,
) => <String, dynamic>{'runtimeType': instance.$type};

_$SaveToLocalStorageImpl _$$SaveToLocalStorageImplFromJson(
  Map<String, dynamic> json,
) => _$SaveToLocalStorageImpl($type: json['runtimeType'] as String?);

Map<String, dynamic> _$$SaveToLocalStorageImplToJson(
  _$SaveToLocalStorageImpl instance,
) => <String, dynamic>{'runtimeType': instance.$type};
