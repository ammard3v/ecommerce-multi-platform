part of 'update_category_req.dart';
_UpdateCategoryReq _$UpdateCategoryReqFromJson(Map<String, dynamic> json) =>
    _UpdateCategoryReq(
      title: json['title'] as String?,
      image: json['image'] as String?,
    );
Map<String, dynamic> _$UpdateCategoryReqToJson(_UpdateCategoryReq instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
    };
