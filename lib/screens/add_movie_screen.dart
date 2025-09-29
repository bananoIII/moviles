import 'package:flutter/material.dart';
import 'package:progra_movil/database/movies.dart';

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
  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  Widget build(BuildContext context) {
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
        moviesDB!
            .insert('tbl_movies', {
              "name": conTitle.text,
              "duration": conTime.text,
              "date_release": conRelease.text,
            })
            .then((value) => Navigator.pop);
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
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
