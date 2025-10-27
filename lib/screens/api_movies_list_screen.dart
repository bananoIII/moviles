import 'package:flutter/material.dart';
import 'package:progra_movil/components/movie_widget.dart';
import 'package:progra_movil/models/api_movies.dart';
import 'package:progra_movil/services/api_movies.dart';

class ApiMoviesList extends StatefulWidget {
  ApiMoviesList({super.key});
  @override
  State<ApiMoviesList> createState() => _ApiMoviesListState();
}

class _ApiMoviesListState extends State<ApiMoviesList> {
  @override
  Widget build(BuildContext context) {
    ApiMovies_Services apiMovies = ApiMovies_Services();
    return Scaffold(
      appBar: AppBar(title: Text('API Movies')),
      body: FutureBuilder(
        future: apiMovies.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return Center(child: Text('ERROR BABY!!!'));
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                //return Text('jolo');
                return MovieWidget(movie: snapshot.data![index]);
              },
            );
          } else {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}
