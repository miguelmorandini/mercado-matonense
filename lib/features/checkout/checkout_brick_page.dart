import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test_app/config/api_config.dart';
// WebView para Mobile
import 'package:webview_flutter/webview_flutter.dart';
// Web para abrir nova aba
import 'dart:html' as html;

class CheckoutBrickPage extends StatelessWidget {
  final String preferenceId;

  const CheckoutBrickPage({super.key, required this.preferenceId});

  @override
  Widget build(BuildContext context) {
    final url = "${ApiConfig.baseUrl}/checkout_brick.html?preferenceId=$preferenceId";

    if (kIsWeb) {
      // Web: abre nova aba
      html.window.open(url, "_blank");
      return Scaffold(
        appBar: AppBar(title: const Text("Pagamento")),
        body: const Center(child: Text("Abrindo checkout...")),
      );
    } else {
      // Mobile: usa WebViewWidget com WebViewController
      final controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(url));
      return Scaffold(
        appBar: AppBar(title: const Text("Pagamento")),
        body: WebViewWidget(controller: controller),
      );
    }
  }
}
