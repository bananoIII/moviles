import 'package:dotted_line/dotted_line.dart';

import 'package:flutter/material.dart';
import 'package:progra_movil/utils/theme_settings.dart';
import 'dart:math';

class P3Home extends StatefulWidget {
  const P3Home({super.key});

  @override
  State<P3Home> createState() => _P3HomeState();
}

class _P3HomeState extends State<P3Home> {
  String fromAirport = "Luxor (LUX)";
  String toAirport = "Cairo (CAP)";

  TextEditingController conDeparture = TextEditingController();
  TextEditingController conReturn = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateTime selectedDeparture = DateTime.now();
  DateTime selectedReturn = DateTime.now();
  void swapAirports() {
    setState(() {
      final temp = fromAirport;
      fromAirport = toAirport;
      toAirport = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeSettings.p3lightTheme(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage('assets/p3_carrousel_img2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              spacing: 10,
              children: [
                Container(
                  margin: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi 👋, McLovin',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Flight to anywhere',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/p3_user.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 275,
                  width: 250,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: airportField(
                          label: "From",
                          plane: Icons.flight_takeoff,
                          airport: fromAirport,
                        ),
                      ),

                      Positioned(
                        top: 60,
                        left: 0,
                        right: 0,
                        child: airportField(
                          label: "To",
                          plane: Icons.flight_land,
                          airport: toAirport,
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 4,
                        child: ElevatedButton(
                          onPressed: swapAirports,
                          child: Icon(Icons.swap_vert, color: Colors.grey),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: Colors.grey),
                            ),
                            minimumSize: Size(35, 35),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 0,
                        right: 120,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Departure",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              TextFormField(
                                controller: conReturn,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'Select',
                                  border: InputBorder.none,
                                ),
                                readOnly: true,
                                onTap: () => _selectDate(context, false),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 120,
                        right: 0,

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Return",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              TextFormField(
                                controller: conDeparture,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'Select',
                                  border: InputBorder.none,
                                ),
                                readOnly: true,

                                onTap: () => _selectDate(context, true),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 195,
                        right: 0,
                        left: 0,
                        child: FilledButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Colors.blue,
                            ),
                            foregroundColor: WidgetStateProperty.all(
                              Colors.white,
                            ),
                            textStyle: WidgetStateProperty.all(
                              const TextStyle(fontSize: 20),
                            ),
                            minimumSize: WidgetStateProperty.all(Size(240, 60)),
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          child: const Text('Search'),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 250,
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming flights',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        right: 20,
                        left: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'ASN',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('Aswan'),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 42,
                                    height: 42,

                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CustomPaint(
                                          size: const Size(42, 42),
                                          painter: ArcPainter200deg(),
                                        ),
                                        Container(
                                          width: 36,
                                          height: 36,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: const Icon(
                                            Icons.flight_takeoff_outlined,
                                            size: 24,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text('1h:30M'),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'AUQ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('Abu Qir'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 95,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: DottedLine(
                            lineLength: 250,
                            dashGapLength: 2,
                            lineThickness: 5,
                            dashRadius: 15,
                            dashColor: ThemeSettings.p3lightTheme()
                                .colorScheme
                                .surface,
                            dashGapColor: Colors.transparent,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: ThemeSettings.p3lightTheme()
                                    .colorScheme
                                    .surface,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.flight,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '09:12 AM',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: ThemeSettings.p3lightTheme()
                                    .colorScheme
                                    .surface,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '30/09/2025',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context, bool isDeparture) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isDeparture) {
          selectedDeparture = picked;
          conDeparture.text = "${picked.day}/${picked.month}/${picked.year}";
        } else {
          selectedReturn = picked;
          conReturn.text = "${picked.day}/${picked.month}/${picked.year}";
        }
      });
    }
  }
}

Widget airportField({
  required String label,
  required IconData plane,
  required String airport,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey),
    ),
    child: Row(
      children: [
        Icon(plane, color: Colors.grey),
        SizedBox(width: 12),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 16),
            children: [
              TextSpan(
                text: "$label:: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: airport),
            ],
          ),
        ),
      ],
    ),
  );
}

class ArcPainter200deg extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawArc(
      rect.deflate(2),
      -190 * (pi / 180),
      200 * pi / 180,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
