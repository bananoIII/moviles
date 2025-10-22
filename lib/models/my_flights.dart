import 'package:progra_movil/models/plane.dart';
import 'package:progra_movil/models/seats.dart';

class MyFlights {
  final String title;
  final String origin_key;
  final String destination_key;
  final String date;
  String? arrival_date;
  String? departure_place;
  String? arrival_place;
  String? departure_time;
  String? arrival_time;
  String? flight_number;
  String? terminal;
  String? gate;
  final String? image;

  // relación con el avión
  final Airplane airplane;

  // Lista de asientos (derivada del avión)
  List<Seat> seats;

  MyFlights({
    required this.title,
    required this.origin_key,
    required this.destination_key,
    required this.date,
    this.arrival_date,
    this.departure_place,
    this.arrival_place,
    this.departure_time,
    this.arrival_time,
    this.flight_number,
    this.terminal,
    this.gate,
    this.image,
    required this.airplane,
    required this.seats,
  });
}
