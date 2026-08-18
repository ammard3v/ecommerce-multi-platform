import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'navigation_bar_state.dart';
part 'navigation_bar_cubit.freezed.dart';
class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(NavigationBarState.initial(selectedIndex: 0));
  void selectedNavigation(int index) {
    if (state.selectedIndex != index) {
      emit(state.copyWith(selectedIndex: index));
    }
  }
}