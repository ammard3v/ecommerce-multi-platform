import '../../../features/auth/data/source/auth_local_data_source.dart';
class SessionManager {
  final AuthLocalDataSource localDataSource;
  final Function onLogout;
  SessionManager({
    required this.localDataSource,
    required this.onLogout,
  });
  Future<void> logout() async {
    try {
      await localDataSource.clear();
    } finally {
      onLogout();
    }
  }
}