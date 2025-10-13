import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final obj = snapshot.data![index];
              return Container(
                height: 111,
                color: Colors.amber,
                child: Column(
                  children: [
                    Text(obj.name!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/movies/add',
                              arguments: obj,
                            ).then((onValue) {
                              setState(() {});
                            });
                          },
                          icon: Icon(Icons.update),
                          style: ButtonStyle(),
                        ),
                        //Expanded(child: Container(),),
                        IconButton(
                          onPressed: () async {
                            return showDialog(
                              context: context,
                              builder: (context) => _bildDialog(obj.id_movie!),
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _bildDialog(int id_movie) {
    return AlertDialog(
      title: Text('Confirmación'),
      content: Text('Desea borrar el registro: $id_movie'),
      actions: [
        TextButton(
          onPressed: () {
            movies_db!.delete('tbl_movies', id_movie).then((onValue) {
              var message = '';
              var color;
              if (onValue > 0) {
                message = "registro borrado exitosamente";
                color = Colors.green;
                setState(() {});
              } else {
                message = "registro NO borrado exitosamente";
                color = Colors.red;
              }
              Navigator.pop(context);
              return Fluttertoast.showToast(
                msg: message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: color,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            });
          },
          child: Text('Aceptar', style: TextStyle(color: Colors.green)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancelar', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
