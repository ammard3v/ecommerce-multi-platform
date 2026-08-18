import 'dart:io';
import '../../data/model/add_product_req.dart';
import 'repository.dart';
abstract class ProductRepository {
  ResultFuture<ProductEntity> fetchAllProducts(
    FetchProductsReq fetchProductsReq,
  );
  ResultFuture<ProductEntity> featuredProducts(
    FetchProductsReq fetchProductsReq,
  );
  ResultFuture<ProductEntity> budgetProducts(
    FetchProductsReq fetchProductsReq,
  );
  ResultFuture<ProductEntity> fetchProductByCategory(String id);
  ResultFuture<SingleProductEntity> fetchSingleProductById(String id);
  ResultFuture<SingleProductEntity> addProduct(
    AddProductReq addProductReq,
    List<File> images,
  );
  ResultVoid deleteProduct(String id);
}