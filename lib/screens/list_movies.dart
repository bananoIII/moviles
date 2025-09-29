import 'package:flutter/material.dart';
import 'package:progra_movil/database/movies.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({super.key});

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {
  MoviesDatabase? movies_db;
  @override
  void initState() {
    super.initState();
    movies_db = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [Text('Movies '), Icon(Icons.movie)]),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/movies/add',
              ).then((onValue) => setState(() {}));
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: movies_db!.select('tbl_movies'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Hubo un error. \n${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.length == 0) {
            return Center(child: Text('No hay pelis'));
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              final obj = snapshot.data![index];
              return Container(
                height: 111,
                color: Colors.amber,
                child: Text(obj.name!),
              );
            },
          );
        },
      ),
    );
  }
}
