import 'package:bloc/bloc.dart';
import '../../../features/auth/data/source/source.dart';
enum ThemeState { light, dark, system }
class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences sharedPreferences;
  ThemeCubit({required this.sharedPreferences}) : super(ThemeState.system) {
    loadThemePreference();
  }
  void setThemeMode(ThemeState themeState) {
    emit(themeState);
    _saveThemePreference(themeState);
  }
  void _saveThemePreference(ThemeState themeState) {
    sharedPreferences.setString("themeMode", themeState.name);
  }
  void loadThemePreference() {
    String? storedTheme = sharedPreferences.getString("themeMode");
    if (storedTheme == null) {
      emit(ThemeState.system);
    }
    switch (storedTheme) {
      case 'dark':
        emit(ThemeState.dark);
      case 'light':
        emit(ThemeState.light);
      default:
        emit(ThemeState.system);
    }
  }
}