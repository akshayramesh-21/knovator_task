


import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';

part 'post_model.g.dart';



@freezed
class PostModel with _$PostModel {
  factory PostModel({
    @JsonKey(name: "userId") required int? userId,
    @JsonKey(name: "title") required String? title,
    @JsonKey(name: "id") required int? id,
    @JsonKey(name: "body") required String? body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}