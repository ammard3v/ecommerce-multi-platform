import 'dart:developer';
import 'package:dio/dio.dart';
import '../manager/session_manager.dart';
import '../manager/token_manager.dart';
class AuthInterceptor extends Interceptor {
  final TokenManager tokenManager;
  final SessionManager sessionManager;
  final Dio refreshDio;
  AuthInterceptor(
      {required this.tokenManager,
      required this.sessionManager,
      required this.refreshDio});
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final skip = options.headers['skipAuthInterceptor'] ?? false;
    if (!skip) {
      final token = await tokenManager.localDataSource.getAccessToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final status = err.response?.statusCode;
    if (status == 401 && !_isAuthPath(err.requestOptions.path)) {
      final refreshed = await tokenManager.refreshToken();
      if (!refreshed) {
        await sessionManager.logout();
        handler.reject(err);
        return;
      }
      final newToken = await tokenManager.localDataSource.getAccessToken();
      err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
      try {
        final response = await refreshDio.fetch(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        handler.reject(e as DioException);
      }
      return;
    }
    if (status == 403) {
      await sessionManager.logout();
      handler.reject(err);
      return;
    }
    handler.next(err);
  }
  bool _isAuthPath(String path) {
    const skip = ['auth/logout', 'auth/signIn', 'auth/token'];
    return skip.any((e) => path.contains(e));
  }
}