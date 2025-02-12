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
      height: size.height * 0.5, // 50% de la pantalla
      child: Swiper(
        layout: SwiperLayout.DEFAULT,
        itemCount: films.length,
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
                  Image.network(
                    film.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Text(
                      film.title,
                      style: const TextStyle(
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
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        viewportFraction: 0.7, // Ajusta el tamaño de las tarjetas
        scale: 0.9, // Reduce un poco el tamaño de las tarjetas inactivas
        pagination: const SwiperPagination(
          margin: EdgeInsets.only(bottom: 0), // Ajusta la distancia entre la paginación y las imágenes
        ),
        control: SwiperControl(),
        loop: true,
      ),
    );
  }
}
