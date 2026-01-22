// Tela principal (Home) da aplicação.
// Responsável por exibir a barra superior,
// campo de busca e listagem de produtos.

import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Produto>> _produtos;

  @override
  void initState() {
    super.initState();
    _produtos = ProdutoService.getProdutos();// busca da API
  }

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
      body: FutureBuilder<List<Produto>>(
        future: _produtos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum produto encontrado'));
          } else {
            final produtos = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                return ProductCard(
                  title: produto.title,
                  price: 'R\$ ${produto.price.toStringAsFixed(2)}',
                  //imageUrl: produto.image, // se ProductCard suportar imagem
                );
              },
            );
          }
        },
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
