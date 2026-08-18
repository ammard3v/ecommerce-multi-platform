part of 'create_category_req.dart';
_CreateCategoryReq _$CreateCategoryReqFromJson(Map<String, dynamic> json) =>
    _CreateCategoryReq(
      title: json['title'] as String,
      image: json['image'] as String,
    );
Map<String, dynamic> _$CreateCategoryReqToJson(_CreateCategoryReq instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
    };
