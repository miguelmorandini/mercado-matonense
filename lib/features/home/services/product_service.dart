import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProdutoService {
  // Substitua pelo IP da sua máquina
  static const String baseUrl = 'http://192.168.1.20:7084/api/produtos';

  static Future<List<Produto>> getProdutos() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((e) => Produto.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar produtos');
    }
  }
}
