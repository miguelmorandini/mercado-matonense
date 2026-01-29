// Modelo de dados que representa um produto.
// Utilizado para padronizar informações vindas da API ou mock.

class Produto {
  final int id;
  final String title;       // <-- aqui usaremos 'title' para 'nome' do banco
  final double price;
  // final String description; // não usado na tabela atual
  // final String category;    // não usado na tabela atual
   final String image;       // não usado na tabela atual

  Produto({
    required this.id,
    required this.title,
    required this.price,
    // this.description,
    // this.category,
    required this.image,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      title: json['nome'],       // <-- pegando o campo 'nome' do banco
      price: (json['preco'] as num).toDouble(),
      // description: json['description'], // não existe no banco
      // category: json['category'],       // não existe no banco
       image: json['image'] ?? 'https://p2.trrsf.com/image/fget/cf/1200/1200/middle/images.terra.com/2025/05/27/fotof1site-(1)-skxv8g1tollx.jpg',             // não existe no banco
    );
  }
}
