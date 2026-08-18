import 'dart:convert';
import '../../../../core/error/exceptions.dart';
import '../model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class UserLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<String?> getUserId();
  Future<UserModel?> getLastUser();
  Future<void> clearUser();
}
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences _prefs;
  UserLocalDataSourceImpl({required SharedPreferences prefs}) : _prefs = prefs;
  static const String _cacheUserKey = 'cached_user';
  static const String userIdKey = 'user_id';
  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      final jsonStr = jsonEncode(user.toJson());
      await _prefs.setString(_cacheUserKey, jsonStr);
      await _prefs.setString(userIdKey, user.id);
    } catch (e) {
      throw CacheException('Failed to cache user: $e');
    }
  }
  @override
  Future<UserModel?> getLastUser() async {
    try {
      final jsonStr = _prefs.getString(_cacheUserKey);
      if (jsonStr == null) return null;
      final jsonMap = jsonDecode(jsonStr) as Map<String, dynamic>;
      return UserModel.fromJson(jsonMap);
    } catch (e) {
      throw CacheException('Failed to get last user: $e');
    }
  }
  @override
  Future<void> clearUser() async {
    try {
      await _prefs.remove(_cacheUserKey);
      await _prefs.remove(userIdKey);
    } catch (e) {
      throw CacheException('Failed to clear cached user');
    }
  }
  @override
  Future<String?> getUserId() async {
    try {
      return _prefs.getString(userIdKey);
    } catch (e) {
      throw CacheException('Failed to get user ID');
    }
  }
}