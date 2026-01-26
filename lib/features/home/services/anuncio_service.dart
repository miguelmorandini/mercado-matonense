import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anuncio_model.dart';

class AnuncioService {
  static const String baseUrl = 'https://mercado-matonense-api.onrender.com/api/anuncios';

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
