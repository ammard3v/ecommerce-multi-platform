import 'package:dio/dio.dart';
import '../model/create_review.dart';
import '../model/user_review_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/api_wrapper.dart';
import 'package:retrofit/retrofit.dart';
import '../model/review_model.dart';
part 'review_remote_data_source.g.dart';
@RestApi()
abstract class ReviewRemoteDataSource {
  @factoryMethod
  factory ReviewRemoteDataSource(Dio dio) = _ReviewRemoteDataSource;
  @GET("/products/{id}/reviews")
  Future<ApiWrapper<ReviewModel>> fetchReviewForProduct(@Path() String id);
  @GET("/reviews/me")
  Future<ApiWrapper<List<UserReviewModel>>> fetchUserReviews();
  @POST("/products/{id}/reviews")
  Future<ApiWrapper<UserReviewModel>> writeReview(
      @Path() String id, @Body() CreateReview createReview);
}