import 'package:flutter/material.dart';
import '../checkout/checkout_brick_page.dart';
import '../checkout/pagamento_service.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String? imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    this.imageUrl,
  });

  Future<void> _pagarAgora(BuildContext context) async {
    try {
      // Chama backend e cria a preferência
      final preferenceId = await PagamentoService.criarPreferencia(
        title: title,
        price: price,
      );

      // Navega para Checkout Brick
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CheckoutBrickPage(preferenceId: preferenceId),
        ),
      );
    } catch (e) {
      debugPrint('❌ Erro ao criar preferência: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao iniciar pagamento')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => _pagarAgora(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 6),
                    Text(
                      'R\$ ${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Frete grátis',
                      style: TextStyle(color: Colors.green),
                    ),
                    ElevatedButton(
                      onPressed: () => _pagarAgora(context),
                      child: const Text('Comprar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
