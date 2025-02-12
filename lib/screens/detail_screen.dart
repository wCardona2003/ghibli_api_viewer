import 'package:flutter/material.dart';
import '../model/film.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recuperamos el objeto 'Film' pasado como argumento
    final Film film = ModalRoute.of(context)!.settings.arguments as Film;

    return Scaffold(
      appBar: AppBar(title: Text(film.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                film.imageUrl.isNotEmpty
                    ? film.imageUrl
                    : 'https://via.placeholder.com/300x400',
                height: 300,
              ),
            ),
            SizedBox(height: 20),
            Text('Director: ${film.director}', style: TextStyle(fontSize: 18)),
            Text('Productor: ${film.producer}', style: TextStyle(fontSize: 18)),
            Text('Fecha de estreno: ${film.releaseDate}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text(film.description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}