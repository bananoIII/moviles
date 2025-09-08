import 'package:flutter/material.dart';
import 'package:progra_movil/utils/value_listener.dart';
import 'package:progra_movil/utils/practica_1_components.dart';

class Practica1ShowScreen extends StatefulWidget {
  const Practica1ShowScreen({super.key});

  @override
  State<Practica1ShowScreen> createState() => _Practica1ShowScreenState();
}

class _Practica1ShowScreenState extends State<Practica1ShowScreen> {
  static const members = [
    [
      'may_ala01a.png',
      15,
      90,
      80,
      'Shiina Mayuri',
      '02',
      'La primera miembro en unirse al laboratorio, le gusta en pollo frito y hacer cosplays.',
    ],
    [
      'dar_ala01a.png',
      95,
      12,
      12,
      'Hashida Itaru',
      '03',
      'Super hacker y un otaku tryhard, se unió al laboratorio porque quedaba cerca una cafeteria.',
    ],
    [
      'crs_bla01a.png',
      100,
      25,
      40,
      'Makise Kurisu',
      '04',
      'OMG! It´s Albert Einstein, y una @channelera de corazón.',
    ],
    [
      'moe_ala01a.png',
      25,
      5,
      50,
      'Kiryu Moeka',
      '05',
      'Mujer de poca expresión, y aun menos palabras.',
    ],
    [
      'ruk_ala01a.png',
      30,
      30,
      100,
      'Urushibara Luka',
      '06',
      'Sacerdotisa del templo Yanabayashi. Es un hombre.',
    ],
    [
      'fei_ala01a.png',
      60,
      90,
      90,
      'Faris NyanNyan',
      '07',
      'Maid principal de la cafeteria más popular de Akiba.',
    ],
    [
      'suz_ala01a.png',
      40,
      40,
      40,
      'Amane Suzuha',
      '08',
      'Trabajadora a medio tiempo en un taller de televisiones, suele pasear en bicicleta.',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Labmembs'),
        actions: [
          ValueListenableBuilder(
            valueListenable: ValueListener.isLightTheme,
            builder: (context, value, child) {
              return value
                  ? IconButton(
                      icon: Icon(Icons.nightlight),
                      onPressed: () {
                        ValueListener.isLightTheme.value = false;
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.sunny),
                      onPressed: () {
                        ValueListener.isLightTheme.value = true;
                      },
                    );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(members.length, (index) {
              final m = members[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Practica1Components.getStrucure(context, m),
              );
            }),
          ),
        ),
      ),
    );
  }
}
