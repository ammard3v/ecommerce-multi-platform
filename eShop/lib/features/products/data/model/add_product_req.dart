import 'dart:io';
import '../source/source.dart';
class AddProductReq {
  final String title;
  final String description;
  final double price;
  final double discountPrice;
  final int stock;
  final int unitsSold;
  final bool isFeatured;
  final String category;
  AddProductReq({
    required this.title,
    required this.description,
    required this.price,
    required this.discountPrice,
    required this.stock,
    required this.unitsSold,
    required this.isFeatured,
    required this.category,
  });
}
extension AddProductReqFormData on AddProductReq {
  FormData toFormData(List<File> images) {
    return FormData.fromMap({
      "title": title,
      "description": description,
      "price": price,
      "discountPrice": discountPrice,
      "stock": stock,
      "unitsSold": unitsSold,
      "isFeatured": isFeatured,
      "category": category,
      "images": images
          .map(
            (file) => MultipartFile.fromFileSync(
              file.path,
              filename: file.path.split('/').last,
            ),
          )
          .toList(),
    });
  }
}