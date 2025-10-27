import 'package:dio/dio.dart';
import 'package:progra_movil/models/api_movies.dart';

class ApiMovies_Services {
  final dio = Dio();
  final URL =
      "https://api.themoviedb.org/3/movie/popular?api_key=0a905548d7e462e406c9a409d2e9ba7c&language=es-MX&page=1";
  final URLbase = "https://api.themoviedb.org/3/movie/popular?api_key=";
  final kkk = "0a905548d7e462e406c9a409d2e9ba7c";
  final language = "es-MX";
  final page = 1;

  Future<List<ApiMovies>> getMovies() async {
    String finalUrl = "$URLbase$kkk&language=$language&page=${page.toString()}";
    final response = await dio.get(finalUrl);
    final movies = response.data['results'] as List;

    return movies.map((movie) => ApiMovies.fromMap(movie)).toList();
  }
}
