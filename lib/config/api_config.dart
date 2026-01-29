import 'package:flutter/foundation.dart';

class ApiConfig {
  static String get baseUrl {
    // Web
    if (kIsWeb) {
      return const String.fromEnvironment(
        'API_URL',
        defaultValue: 'https://mercado-matonense-api.onrender.com',
      );
    }

    // Mobile / Desktop
    return const String.fromEnvironment(
      'API_URL',
      defaultValue: 'https://mercado-matonense-api.onrender.com',
    );
  }
}
