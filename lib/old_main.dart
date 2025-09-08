import 'package:flutter/material.dart';
import 'package:progra_movil/utils/colors_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("prueba"),
          backgroundColor: Colors.cyanAccent,
        ),
        backgroundColor: ColorsApp.bgColor,
        body: Container(
          child: Center(
            child: Text(
              "Cotandor.\n Número: $cont",
              style: TextStyle(
                fontSize: 60,
                fontFamily: 'Stein',
                color: ColorsApp.txColor,
              ),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            cont++;
            setState(() {});
          },
          child: Icon(Icons.ads_click),
        ),
      ),
    );
  }
}

/*Forma 1.- Metodo tradicional*/
myEvent() {}

/*
Forma 2.- Metodo anonimo
()()

Forma 3.- Una unica accion

() => Accion
*/

/*
/////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:progra_movil/utils/colors_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("prueba"),
          backgroundColor: Colors.cyanAccent,
        ),
        backgroundColor: ColorsApp.bgColor,
        body: Container(
          child: Center(
            child: Text(
              "Cotandor.\n Número: $cont",
              style: TextStyle(
                fontSize: 60,
                fontFamily: 'Stein',
                color: ColorsApp.txColor,
              ),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            cont++;
            print(cont);
          },
          child: Icon(Icons.ads_click),
        ),
      ),
    );
  }
}

/*Forma 1.- Metodo tradicional*/
myEvent() {
  print('asd');
}

/*
Forma 2.- Metodo anonimo
()()

Forma 3.- Una unica accion

() => Accion

*/*/
