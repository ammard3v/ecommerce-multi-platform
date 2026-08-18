import 'package:uuid/uuid.dart';
class IdGen {
  IdGen._();
  static String generateTrackingId() {
    final uuid = Uuid();
    String id = uuid.v4().toUpperCase().substring(0, 8);
    return "TRK$id";
  }
}