import '../utils/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
Future<String> getDeviceId() async {
  final prefs = await SharedPreferences.getInstance();
  String? deviceId = prefs.getString('device_id');
  if (deviceId != null) return deviceId;
  deviceId = const Uuid().v4().replaceAll("-", "").substring(0, 16);
  await prefs.setString('device_id', deviceId);
  return '${Constants.app_name}_$deviceId';
}