class Seat {
  final String id;
  final String row;
  final int number;
  bool isAvailable;
  String? passengerName;

  Seat({
    required this.id,
    required this.row,
    required this.number,
    this.isAvailable = true,
    this.passengerName,
  });
}
