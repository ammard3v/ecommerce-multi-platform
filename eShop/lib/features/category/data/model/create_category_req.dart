import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_category_req.freezed.dart';
part 'create_category_req.g.dart';
@freezed
abstract class CreateCategoryReq with _$CreateCategoryReq {
  const factory CreateCategoryReq({
    required String title,
    required String image,
  }) = _CreateCategoryReq;
  factory CreateCategoryReq.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryReqFromJson(json);
}