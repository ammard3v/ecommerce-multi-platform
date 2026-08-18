import 'package:bloc/bloc.dart';
class CommonSearchbarCubit extends Cubit<String> {
  CommonSearchbarCubit() : super('');
  void updateQuery(String query) => emit(query);
}