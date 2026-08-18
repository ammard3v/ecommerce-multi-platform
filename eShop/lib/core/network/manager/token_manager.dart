import '../../../features/auth/data/source/auth_local_data_source.dart';
import 'package:dio/dio.dart';
class TokenManager {
  final AuthLocalDataSource localDataSource;
  final Dio refreshDio;
  TokenManager({
    required this.localDataSource,
    required this.refreshDio,
  });
  Future<bool> refreshToken() async {
    try {
      final refreshToken = await localDataSource.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) return false;
      final response = await refreshDio.post(
        'auth/token',
        data: {'refresh_token': refreshToken},
      );
      final newToken = response.data['access_token'];
      if (newToken == null) return false;
      await localDataSource.updateAccessToken(newToken);
      return true;
    } catch (_) {
      return false;
    }
  }
}