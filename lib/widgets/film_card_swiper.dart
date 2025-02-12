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
      height: size.height * 0.5,  // Ajusta la altura según la pantalla
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
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(
                  film.imageUrl.isNotEmpty
                      ? film.imageUrl
                      : 'https://via.placeholder.com/300x400',
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
