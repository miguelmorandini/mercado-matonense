// Widget raiz da aplicação.
// Centraliza configurações globais como MaterialApp,
// tema, rotas e página inicial.

import 'package:flutter/material.dart';
import 'features/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mercado Matonense',
      home: const HomePage(),
    );
  }
}
