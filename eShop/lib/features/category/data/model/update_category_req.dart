import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_category_req.freezed.dart';
part 'update_category_req.g.dart';
@freezed
abstract class UpdateCategoryReq with _$UpdateCategoryReq {
  const factory UpdateCategoryReq({
    String? title,
    String? image,
  }) = _UpdateCategoryReq;
  factory UpdateCategoryReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryReqFromJson(json);
}