import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'pagamento_service.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class CheckoutPage extends StatelessWidget {
  final String title;
  final double price;

  const CheckoutPage({
    super.key,
    required this.title,
    required this.price,
  });

  Future<void> _abrirPagamento() async {
    try {
      final url = await PagamentoService.criarPreferencia(
        title: title,
        price: price,
      );

      if (kIsWeb) {
        html.window.open(url, '_blank');
      }
    } catch (e, stack) {
      debugPrint('❌ Erro ao abrir pagamento');
      debugPrint(e.toString());
      debugPrint(stack.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagamento')),
      body: Center(
        child: ElevatedButton(
          onPressed: _abrirPagamento,
          child: const Text('Pagar com Mercado Pago'),
        ),
      ),
    );
  }
}
