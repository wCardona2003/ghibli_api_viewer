import 'package:flutter/material.dart';
import '../model/film.dart';

class FilmSlider extends StatelessWidget {
  final List<Film> films;

  FilmSlider({required this.films});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: films.length,
        itemBuilder: (context, index) {
          final film = films[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: film);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.amber,
              ),
              child: Center(
                child: Text(
                  film.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}