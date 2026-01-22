// Widget responsável por exibir um produto em formato de card.
// Utilizado na Home para listar produtos em grid.

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String? imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // imagem proporcional e centralizada
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[300],
              child: imageUrl != null
                  ? Center(
                      child: Image.network(
                        imageUrl!,
                        fit: BoxFit.contain,
                        height: 150,
                      ),
                    )
                  : const Center(
                      child: Icon(Icons.image, size: 60, color: Colors.white),
                    ),
            ),

            // informações do produto
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18, // preço maior
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Frete grátis',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
