// Modelo de dados que representa um produto.
// Utilizado para padronizar informações vindas da API ou mock.

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
