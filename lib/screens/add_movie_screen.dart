import 'package:flutter/material.dart';
import 'package:progra_movil/database/movies.dart';
import 'package:progra_movil/models/movies.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  MoviesDatabase? moviesDB;

  TextEditingController conTitle = TextEditingController();
  TextEditingController conTime = TextEditingController();
  TextEditingController conRelease = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  Widget build(BuildContext context) {
    Movies? movie;
    if (ModalRoute.of(context)?.settings.arguments != null) {
      movie = ModalRoute.of(context)?.settings.arguments as Movies;

      conTitle.text = movie.name!;
      conTime.text = movie.duration!;
      conRelease.text = movie.name!;
    }

    final txtTitle = TextFormField(
      controller: conTitle,
      decoration: InputDecoration(hintText: 'Titulo de la pelicula'),
    );
    final txtTime = TextFormField(
      controller: conTime,
      decoration: InputDecoration(hintText: 'Duracion de la pelicula'),
    );

    final txtRelease = TextFormField(
      controller: conRelease,
      decoration: InputDecoration(hintText: 'Fecha de lanzamiento'),
      onTap: () => _selectedDate(context),
    );

    final btnSend = ElevatedButton(
      onPressed: () {
        if (movie == null) {
          moviesDB!
              .insert('tbl_movies', {
                "name": conTitle.text,
                "duration": conTime.text,
                "date_release": conRelease.text,
                "image": '2',
              })
              .then((value) => Navigator.pop(context));
        } else {
          moviesDB!
              .update('tbl_movies', {
                "id_movie": movie.id_movie,
                "name": conTitle.text,
                "duration": conTime.text,
                "date_release": conRelease.text,
                "image": '2',
              })
              .then((value) => Navigator.pop(context));
        }
      },
      child: Text('Guardar'),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Añadir pelicula')),
      body: ListView(
        shrinkWrap: true,
        children: [txtTitle, txtTime, txtRelease, btnSend],
      ),
    );
  }

  _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate2 = picked;
        conRelease.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
}
