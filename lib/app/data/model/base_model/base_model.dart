import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_model.freezed.dart';
part 'base_model.g.dart';

@freezed
class BaseModel with _$BaseModel {
  const factory BaseModel({
    required int code,
    required String message,
    required dynamic data,
  }) = _BaseModel;

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);
}
