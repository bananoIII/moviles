import 'package:flutter/material.dart';
import 'package:progra_movil/models/api_movies.dart';

class MovieWidget extends StatelessWidget {
  MovieWidget({super.key, required this.movie});

  ApiMovies movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: [
          FadeInImage(
            placeholder: AssetImage("assets/loading (1).gif"),
            image: NetworkImage(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            ),
          ),
        ],
      ),
    );
  }
}
