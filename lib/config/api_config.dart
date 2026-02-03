import 'package:flutter/foundation.dart';

class ApiConfig {
  static const String api = 'http://localhost:5000';
  //static const String api = 'https://mercado-matonense-api.onrender.com';

  static String get baseUrl {
    final url = api;

    debugPrint('🌐 API ativa: $url');
    return url;
  }
}
