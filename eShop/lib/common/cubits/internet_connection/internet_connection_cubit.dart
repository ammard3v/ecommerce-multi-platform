import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../features/auth/data/source/source.dart';
import '../../server_call/server_call.dart';
part 'internet_connection_state.dart';
class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  final Connectivity _connectivity;
  final DioClient dioClient;
  final ServerCall serverCall;
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  InternetConnectionCubit(
    this._connectivity, {
    required this.dioClient,
    required this.serverCall,
  }) : super(InternetConnectionInitial()) {
    _monitorConnection();
  }
  Future<void> _monitorConnection() async {
    try {
      _subscription = _connectivity.onConnectivityChanged.listen(
        (List<ConnectivityResult> connectivityResults) {
          _updateConnectionState(connectivityResults);
        },
        onError: (error) {
          emit(InternetConnectionDisconnected());
        },
      );
    } catch (_) {
      emit(InternetConnectionDisconnected());
    }
  }
  void _updateConnectionState(
    List<ConnectivityResult> connectivityResults,
  ) async {
    if (connectivityResults.contains(ConnectivityResult.none)) {
      emit(InternetConnectionDisconnected());
    } else {
      final serverIsUp = await _checkServerHealth();
      if (serverIsUp) {
        emit(InternetConnectionConnected());
      } else {
        emit(ServerHealthDown());
      }
    }
  }
  Future<bool> _checkServerHealth() async {
    try {
      final response = await serverCall.checkServerHealth();
      return response.response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
  Future<void> checkStatus() async {
    emit(InternetConnectionInitial());
    await Future.delayed(Duration(seconds: 3));
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(InternetConnectionDisconnected());
    } else {
      final serverIsUp = await _checkServerHealth();
      emit(
        serverIsUp ? InternetConnectionConnected() : ServerHealthDown(),
      );
    }
  }
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}