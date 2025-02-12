import 'package:flutter/material.dart';
import '../services/ghibli_api_service.dart';
import '../widgets/film_card_swiper.dart';
import '../widgets/film_slider.dart';
import '../model/film.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GhibliApiService apiService = GhibliApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Studio Ghibli Films')),
      backgroundColor: Colors.white24, // Cambia el color de fondo aquí
      body: FutureBuilder(
        future: apiService.fetchFilms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar las películas'));
          } else {
            final films = snapshot.data as List<Film>;
            return Column(
              children: [
                FilmCardSwiper(films: films),
                Expanded(child: FilmSlider(films: films)),
              ],
            );
          }
        },
      ),
    );
  }
}