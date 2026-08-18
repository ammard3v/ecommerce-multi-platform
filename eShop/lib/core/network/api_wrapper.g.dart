part of 'api_wrapper.dart';
ApiWrapper<T> _$ApiWrapperFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiWrapper<T>(
      status: json['status'] as String,
      data: fromJsonT(json['data']),
      message: json['message'] as String?,
      meta: json['meta'] == null
          ? null
          : ProductMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );
Map<String, dynamic> _$ApiWrapperToJson<T>(
  ApiWrapper<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'data': toJsonT(instance.data),
      'message': instance.message,
      'meta': instance.meta,
    };
