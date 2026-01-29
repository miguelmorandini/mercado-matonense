class Anuncio {
  final int id;
  final String titulo;
  final String imagemUrl;
  final String link;

  Anuncio({
    required this.id,
    required this.titulo,
    required this.imagemUrl,
    required this.link,
  });

  factory Anuncio.fromJson(Map<String, dynamic> json) {
    return Anuncio(
      id: json['id'],
      titulo: json['titulo'],
      imagemUrl: json['imagemUrl'],
      link: json['link'],
    );
  }
}
