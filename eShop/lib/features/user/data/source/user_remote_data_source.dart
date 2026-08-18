import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../model/user_detail_update_req.dart';
import '../../../../core/network/api_wrapper.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../category/domain/usecase/usecase.dart';
import '../../../../utils/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/network.dart';
import '../model/user_model.dart';
part 'user_remote_data_source.g.dart';
@RestApi()
abstract class UserRemoteDataSource {
  @factoryMethod
  factory UserRemoteDataSource(Dio dio) = _UserRemoteDataSource;
  @GET("/users/me/")
  Future<ApiWrapper<UserModel>> getCurrentUser();
  @PATCH("/users/me/")
  Future<ApiWrapper<UserModel>> updateCurrentUser(
    @Body() UserDetailUpdateReq userDetailUpdateReq,
  );
}