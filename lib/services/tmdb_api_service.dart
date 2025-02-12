import 'dart:convert';
import 'package:http/http.dart' as http;

class TMDbApiService {
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _bearerToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkY2NkMmMxMDFmNGQzZWEyZjFkODczYWI2YTM5ZGI0OCIsIm5iZiI6MTczOTM1NDE1NS4zODYsInN1YiI6IjY3YWM3MDJiZTA5ZDZjOTE5MGIwOWU1OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2td_vnhPWbm2igbrWYx0OlLmEDmW2eop2yXnJDHKJuY';

  Future<String?> fetchMoviePoster(String movieTitle) async {
    final url = Uri.parse('$_baseUrl/search/movie?query=$movieTitle');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $_bearerToken',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'];

      if (results != null && results.isNotEmpty) {
        final posterPath = results[0]['poster_path'];
        return 'https://image.tmdb.org/t/p/w500$posterPath';  // URL completa del poster
      } else {
        return null;  // No se encontró la película
      }
    } else {
      throw Exception('Error al buscar la película en TMDb');
    }
  }
}
