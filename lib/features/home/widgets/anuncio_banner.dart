import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/anuncio_model.dart';
class AnuncioBanner extends StatelessWidget {
  final Anuncio anuncio;

  const AnuncioBanner({super.key, required this.anuncio});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () async {
          final url = Uri.parse(anuncio.link);
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        },
        child: Container(
          color: const Color(0xFFFFE600), // fundo amarelo
          padding: const EdgeInsets.all(8), // espaçamento ao redor da imagem
          child: Image.network(
            anuncio.imagemUrl,
            fit: BoxFit.none, // respeita tamanho real da imagem
            alignment: Alignment.center,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.broken_image, size: 40);
            },
          ),
        ),
      ),
    );
  }
}
