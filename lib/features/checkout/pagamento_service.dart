import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/api_config.dart';

class PagamentoService {
  static Future<String> criarPreferencia({
    required String title,
    required double price,
  }) async {
    final url = '${ApiConfig.baseUrl}/api/pagamento/preferencia';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'unitPrice': price,
        'quantity': 1,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao criar preferência');
    }

    final data = jsonDecode(response.body);
    return data['preferenceId']; // preferenceId ou initPoint
  }
}
