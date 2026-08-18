import 'package:json_annotation/json_annotation.dart';
import '../../features/products/data/model/meta_model.dart';
part 'api_wrapper.g.dart';
@JsonSerializable(genericArgumentFactories: true)
class ApiWrapper<T> {
  final String status;
  final T data;
  final String? message;
  final ProductMetaModel? meta;
  ApiWrapper({
    required this.status,
    required this.data,
    this.message,
    this.meta,
  });
  factory ApiWrapper.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiWrapperFromJson(json, fromJsonT);
}