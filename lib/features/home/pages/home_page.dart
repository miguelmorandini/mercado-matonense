// Tela principal (Home) da aplicação.
// Responsável por exibir a barra superior,
// campo de busca e listagem de produtos.

import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Lista de produtos de exemplo
  final List<Map<String, String>> products = const [
    {"title": "Produto 1", "price": "R\$ 49,90"},
    {"title": "Produto 2", "price": "R\$ 79,90"},
    {"title": "Produto 3", "price": "R\$ 99,90"},
    {"title": "Produto 4", "price": "R\$ 59,90"},
    {"title": "Produto 5", "price": "R\$ 199,90"},
    {"title": "Produto 6", "price": "R\$ 29,90"},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define largura máxima de cada card
    final maxCardWidth = screenWidth > 1200
        ? 250.0
        : screenWidth > 800
        ? 200.0
        : screenWidth * 0.45;

    // Ajusta quantidade de colunas automaticamente
    final crossAxisCount = (screenWidth / maxCardWidth).floor();

    return Scaffold(
      appBar: _buildAppBar(),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => ProductCard(
          title: products[index]["title"]!,
          price: products[index]["price"]!,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFFFE600),
      elevation: 0,
      title: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: const TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: 'Buscar produtos',
            border: InputBorder.none,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }
}
