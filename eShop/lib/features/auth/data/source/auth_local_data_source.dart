import 'source.dart';
abstract class AuthLocalDataSource {
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });
  Future<void> clearTokens();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> updateAccessToken(String accessToken);
  Future<void> saveTokenExpiryTime(DateTime expiryTime);
  Future<DateTime?> getTokenExpiryTime();
  Future<bool> hasValidTokens();
  Future<bool> isTokenExpired();
  Future<void> clear();
}
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _prefs;
  AuthLocalDataSourceImpl({required SharedPreferences prefs}) : _prefs = prefs;
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenExpiryKey = 'token_expiry';
  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await Future.wait([
        _prefs.setString(_accessTokenKey, accessToken),
        _prefs.setString(_refreshTokenKey, refreshToken),
        _saveTokenExpiryFromAccessToken(accessToken),
      ]);
    } catch (e) {
      throw CacheException('Failed to save tokens: $e');
    }
  }
  @override
  Future<String?> getAccessToken() async => _prefs.getString(_accessTokenKey);
  @override
  Future<String?> getRefreshToken() async => _prefs.getString(_refreshTokenKey);
  @override
  Future<void> updateAccessToken(String accessToken) async {
    try {
      await _prefs.setString(_accessTokenKey, accessToken);
      await _saveTokenExpiryFromAccessToken(accessToken);
    } catch (_) {
      throw CacheException('Failed to update access token');
    }
  }
  @override
  Future<void> saveTokenExpiryTime(DateTime expiryTime) async {
    try {
      await _prefs.setString(_tokenExpiryKey, expiryTime.toIso8601String());
    } catch (e) {
      throw CacheException('Failed to save token expiry');
    }
  }
  @override
  Future<DateTime?> getTokenExpiryTime() async {
    try {
      final expiry = _prefs.getString(_tokenExpiryKey);
      return expiry != null ? DateTime.parse(expiry) : null;
    } catch (_) {
      return null;
    }
  }
  Future<void> _saveTokenExpiryFromAccessToken(String token) async {
    try {
      final parts = token.split('.');
      if (parts.length == 3) {
        final normalized = base64Url.normalize(parts[1]);
        final decoded = utf8.decode(base64Url.decode(normalized));
        final payload = jsonDecode(decoded);
        final exp = payload['exp'];
        if (exp != null) {
          await saveTokenExpiryTime(
            DateTime.fromMillisecondsSinceEpoch(exp * 1000),
          );
          return;
        }
      }
      await saveTokenExpiryTime(DateTime.now().add(const Duration(hours: 1)));
    } catch (_) {
      await saveTokenExpiryTime(DateTime.now().add(const Duration(hours: 1)));
    }
  }
  @override
  Future<bool> hasValidTokens() async {
    final access = await getAccessToken();
    final refresh = await getRefreshToken();
    if (access == null || refresh == null) return false;
    if (access.isEmpty || refresh.isEmpty) return false;
    return !(await isTokenExpired());
  }
  @override
  Future<bool> isTokenExpired() async {
    final expiry = await getTokenExpiryTime();
    if (expiry == null) return true;
    final nowPlusBuffer = DateTime.now().add(const Duration(minutes: 5));
    return nowPlusBuffer.isAfter(expiry);
  }
  @override
  Future<void> clear() async {
    await Future.wait([
      _prefs.remove(_accessTokenKey),
      _prefs.remove(_refreshTokenKey),
      _prefs.remove(_tokenExpiryKey),
    ]);
  }
  @override
  Future<void> clearTokens() async => clear();
}