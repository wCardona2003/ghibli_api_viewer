import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/film.dart';

class GhibliApiService {
  final String apiUrl = 'https://ghibliapi.vercel.app/films';

  Future<List<Film>> fetchFilms() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> filmsJson = json.decode(response.body);
      return filmsJson.map((json) => Film.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar las películas');
    }
  }
}