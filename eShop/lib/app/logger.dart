import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
class Logger {
  final bool showBlocLogs;
  final bool showNetworkLogs;
  final bool showRouteLogs;
  final bool showGeneralLogs;
  Logger({
    this.showBlocLogs = true,
    this.showNetworkLogs = true,
    this.showRouteLogs = true,
    this.showGeneralLogs = true,
  });
  void log(String message, {String? category}) {
    if (!kDebugMode) return;
    final shouldLog = switch (category) {
      'network' => showNetworkLogs,
      'bloc' => showBlocLogs,
      'route' => showRouteLogs,
      _ => showGeneralLogs,
    };
    if (shouldLog) {
      developer.log(
        message,
        name: category ?? 'general',
      );
    }
  }
}