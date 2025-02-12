class Film {
  final String id;
  final String title;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;
  final String imageUrl;  // URL de la imagen (intentaremos conseguirla de otra API)

  Film({
    required this.id,
    required this.title,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.imageUrl,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      director: json['director'],
      producer: json['producer'],
      releaseDate: json['release_date'],
      imageUrl: '',  // Vacío para añadir URL
    );
  }
}