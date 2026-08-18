import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/injection/service_locater.dart';
import 'logger.dart';
class CustomBlocObserver extends BlocObserver {
  final Logger _logger = sl<Logger>();
  @override
  void onCreate(BlocBase bloc) {
    _logger.log(
      'Bloc created: ${bloc.runtimeType}',
      category: 'bloc',
    );
    super.onCreate(bloc);
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    _logger.log(
      'State change in ${bloc.runtimeType}: '
      '${change.currentState.runtimeType} → ${change.nextState.runtimeType}',
      category: 'bloc',
    );
    super.onChange(bloc, change);
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logger.log(
      'Transition in ${bloc.runtimeType}: '
      '${transition.event.runtimeType} → ${transition.nextState.runtimeType}',
      category: 'bloc_transition',
    );
    super.onTransition(bloc, transition);
  }
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.log(
      'Error in ${bloc.runtimeType}: $error',
      category: 'error',
    );
    super.onError(bloc, error, stackTrace);
  }
  @override
  void onClose(BlocBase bloc) {
    _logger.log(
      'Bloc closed: ${bloc.runtimeType}',
      category: 'bloc',
    );
    super.onClose(bloc);
  }
}