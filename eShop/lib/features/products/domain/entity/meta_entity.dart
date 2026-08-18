import 'dart:convert';
import 'package:equatable/equatable.dart';
class ProductMetaEntity extends Equatable {
  final int page;
  final int limit;
  final int totalCount;
  final int totalPages;
  const ProductMetaEntity({
    required this.page,
    required this.limit,
    required this.totalCount,
    required this.totalPages,
  });
  @override
  List<Object?> get props => [page, limit, totalCount, totalPages];
}