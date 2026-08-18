import 'package:flutter/foundation.dart';
class Constants {
  const Constants._();
  static const String app_name = "eShop";
  static const int initial_page = 1;
  static const int items_per_page = 10;
  static const String sort_default = "-createdAt";
  static const double deliveryFee = 170.00;
  static const int delay_connection = 0;
  static const connect_timeout = 15;
  static String base_url = "http://localhost:3000/api/v1/";
}