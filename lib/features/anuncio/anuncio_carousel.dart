import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'anuncio_model.dart';

class AnuncioCarousel extends StatefulWidget {
  final List<Anuncio> anuncios;

  const AnuncioCarousel({super.key, required this.anuncios});

  @override
  State<AnuncioCarousel> createState() => _AnuncioCarouselState();
}

class _AnuncioCarouselState extends State<AnuncioCarousel> {
  late final PageController _controller;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (_controller.hasClients && widget.anuncios.isNotEmpty) {
        _goToPage((_currentPage + 1) % widget.anuncios.length);
      }
    });
  }

  void _goToPage(int page) {
    setState(() => _currentPage = page);
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.anuncios.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 300,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFFE600), // 🟡 fundo amarelo
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// 🔹 PAGE VIEW
            PageView.builder(
              controller: _controller,
              itemCount: widget.anuncios.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final anuncio = widget.anuncios[index];

                return InkWell(
                  onTap: () async {
                    final url = Uri.parse(anuncio.link);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                  child: Center(
                    child: Image.network(
                      anuncio.imagemUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),

            /// ⬅ SETA ESQUERDA
            Positioned(
              left: 4,
              child: IconButton(
                icon: const Icon(Icons.chevron_left, size: 36),
                onPressed: () {
                  final prev =
                      (_currentPage - 1 + widget.anuncios.length) %
                      widget.anuncios.length;
                  _goToPage(prev);
                },
              ),
            ),

            /// ➡ SETA DIREITA
            Positioned(
              right: 4,
              child: IconButton(
                icon: const Icon(Icons.chevron_right, size: 36),
                onPressed: () {
                  final next = (_currentPage + 1) % widget.anuncios.length;
                  _goToPage(next);
                },
              ),
            ),

            /// 🔘 INDICADORES
            Positioned(
              bottom: 6,
              child: Row(
                children: List.generate(
                  widget.anuncios.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 10 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.black
                          : Colors.black26,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
