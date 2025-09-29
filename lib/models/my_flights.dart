class MyFlights {
  final String title;
  final String origin;
  final String destination;
  final String date;
  final String image;
  final String origin_key;
  final String destination_key;
  String? departure_place;
  String? arrival_place;
  String? departure_time;
  String? arrival_time;
  String? flight_number;
  String? departure_airport;
  String? airport;
  String? terminal;
  String? gate;
  String? airport_image;

  MyFlights({
    required this.title,
    required this.origin,
    required this.destination,
    required this.date,
    required this.image,
    required this.origin_key,
    required this.destination_key,
    this.departure_place,
    this.arrival_place,
    this.departure_time,
    this.arrival_time,
    this.flight_number,
    this.departure_airport,
    this.airport,
    this.terminal,
    this.gate,
    this.airport_image,
  });
}
