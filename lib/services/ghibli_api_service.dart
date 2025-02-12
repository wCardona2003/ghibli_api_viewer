import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/film.dart';
import 'tmdb_api_service.dart';

class GhibliApiService {
  final String apiUrl = 'https://ghibliapi.vercel.app/films';
  final TMDbApiService tmdbService = TMDbApiService();

  Future<List<Film>> fetchFilms() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> filmsJson = json.decode(response.body);
      List<Film> films = [];

      for (var jsonFilm in filmsJson) {
        String title = jsonFilm['title'];
        String? imageUrl = await tmdbService.fetchMoviePoster(title);

        films.add(Film.fromJson(jsonFilm, imageUrl));
      }

      return films;
    } else {
      throw Exception('Error al cargar las películas');
    }
  }
}
