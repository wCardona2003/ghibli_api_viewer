import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../model/film.dart';

class FilmCardSwiper extends StatelessWidget {
  final List<Film> films;

  FilmCardSwiper({required this.films});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,  // El swiper ocupará el 50% de la pantalla
      child: Swiper(
        itemCount: films.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          final film = films[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: film);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // Imagen del póster de la película
                  Image.network(
                    film.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.error));
                    },
                  ),
                  // Sombra oscura para mejorar la legibilidad del título
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // Título de la película en la parte inferior
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Text(
                      film.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        pagination: SwiperPagination(),
        control: SwiperControl(),  // Flechas de navegación
      ),
    );
  }
}
