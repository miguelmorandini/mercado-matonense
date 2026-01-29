import 'dart:convert';
import 'package:flutter_test_app/config/api_config.dart';
import 'package:http/http.dart' as http;
import 'anuncio_model.dart';

class AnuncioService {
  //static const String baseUrl = 'https://mercado-matonense-api.onrender.com/api/anuncios';
  final baseUrl = '${ApiConfig.baseUrl}/api/anuncios';

  Future<List<Anuncio>> buscarAnunciosHome() async {
    final response = await http.get(Uri.parse('$baseUrl/home'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Anuncio.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar anúncios');
    }
  }
}
