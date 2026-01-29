// Tela principal (Home) da aplicação.
// Responsável por exibir a barra superior,
// campo de busca e listagem de produtos.

import 'package:flutter/material.dart';
import 'package:flutter_test_app/features/anuncio/anuncio_carousel.dart';

import '../product/product_model.dart';
import '../anuncio/anuncio_model.dart';

import '../product/product_service.dart';
import '../anuncio/anuncio_service.dart';

import '../product/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Produto>> _produtos;
  late Future<List<Anuncio>> _anuncios;

  @override
  void initState() {
    super.initState();
    _produtos = ProdutoService.getProdutos();
    _anuncios = AnuncioService().buscarAnunciosHome();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final maxCardWidth = screenWidth > 1200
        ? 250.0
        : screenWidth > 800
        ? 200.0
        : screenWidth * 0.45;

    final crossAxisCount = (screenWidth / maxCardWidth).floor().clamp(1, 6);

    return Scaffold(
      appBar: _buildAppBar(),
      body: CustomScrollView(
        slivers: [
          /// 🔹 ANÚNCIOS
          SliverToBoxAdapter(
            child: FutureBuilder<List<Anuncio>>(
              future: _anuncios,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Enquanto carrega, mostrar loading
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  // Mensagem de erro amigável
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Não foi possível carregar os anúncios.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Verifique sua conexão ou tente novamente mais tarde.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SizedBox.shrink(); // Nenhum anúncio disponível
                }

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: AnuncioCarousel(anuncios: snapshot.data!),
                );
              },
            ),
          ),

          /// 🔹 PRODUTOS
          FutureBuilder<List<Produto>>(
            future: _produtos,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError) {
                return SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Erro ao carregar anúncios...',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${snapshot.error}', // opcional, para debug
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: Text('Nenhum produto encontrado')),
                );
              }

              final produtos = snapshot.data!;

              return SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final produto = produtos[index];
                    return ProductCard(
                      title: produto.title,
                      price: produto.price,
                    );
                  }, childCount: produtos.length),
                ),
              );
            },
          ),
        ],
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
