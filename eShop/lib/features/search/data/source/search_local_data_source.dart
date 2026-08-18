import '../../../../core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class SearchLocalDataSource {
  Future<void> saveSearchTexts({
    required String searchText,
  });
  Future<void> removeSearchHistoryAll();
  Future<void> clearSearchText();
  Future<List<String>> getSaveSearchTexts();
  Future<List<String>> clearSpecificText({
    required String searchText,
  });
}
class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final SharedPreferences _prefs;
  SearchLocalDataSourceImpl({required SharedPreferences prefs})
      : _prefs = prefs;
  static const String _searchText = '_searchText';
  @override
  Future<void> removeSearchHistoryAll() async {
    await _prefs.remove(_searchText);
  }
  @override
  Future<void> saveSearchTexts({required String searchText}) async {
    try {
      final existingList = _prefs.getStringList(_searchText) ?? [];
      if (!existingList.contains(searchText)) {
        existingList.insert(0, searchText);
      }
      await _prefs.setStringList(_searchText, existingList);
    } catch (e) {
      throw CacheException('Failed to save search text: $e');
    }
  }
  @override
  Future<void> clearSearchText() async {
    await _prefs.remove(_searchText);
  }
  @override
  Future<List<String>> getSaveSearchTexts() async {
    try {
      final existingList = _prefs.getStringList(_searchText) ?? [];
      return existingList;
    } catch (e) {
      throw CacheException('Failed to save search text: $e');
    }
  }
  @override
  Future<List<String>> clearSpecificText({required String searchText}) async {
    try {
      final existingList = _prefs.getStringList(_searchText) ?? [];
      existingList.removeWhere((element) => element == searchText);
      await _prefs.setStringList(_searchText, existingList);
      return existingList;
    } catch (e) {
      throw CacheException('Failed to delete search text: $e');
    }
  }
}