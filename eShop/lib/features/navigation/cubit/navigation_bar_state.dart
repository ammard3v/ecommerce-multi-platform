part of 'navigation_bar_cubit.dart';
@freezed
abstract class NavigationBarState with _$NavigationBarState {
  const factory NavigationBarState.initial({required int selectedIndex}) =
      _Initial;
}