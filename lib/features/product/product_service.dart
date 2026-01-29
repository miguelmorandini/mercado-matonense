import 'dart:convert';
import 'package:http/http.dart' as http;

import 'product_model.dart';
import '../../config/api_config.dart';

class ProdutoService {
  static Future<List<Produto>> getProdutos() async {
    final url = '${ApiConfig.baseUrl}/api/produtos';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((e) => Produto.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar produtos');
    }
  }
}
