import 'package:flutter/material.dart';
import 'package:progra_movil/models/my_flights.dart';
import 'package:progra_movil/utils/theme_settings.dart';
import 'package:flutter_svg/flutter_svg.dart';

class P3MyFlights extends StatefulWidget {
  const P3MyFlights({super.key});

  @override
  State<P3MyFlights> createState() => _P3MyFlightsState();
}

class _P3MyFlightsState extends State<P3MyFlights> {
  /*
final List<MyFlights> myFlightsList = [
    MyFlights(
      title: 'Aeropuerto de España',
      origin: 'Canadá',
      destination: 'España',
      date: '17/09/2025',
      image: 'assets/places/Flag_of_Spain.svg',
      origin_key: "CAN",
      destination_key: "SPN",
      departure_place: 'Toronto',
      arrival_place: 'Madrid',
      departure_time: '08:00',
      arrival_time: '20:30',
      flight_number: 'AC101',
      departure_airport: 'Toronto Pearson',
      airport: 'Adolfo Suárez Madrid-Barajas',
      terminal: 'T1',
      gate: 'A12',
      airport_image: "assets/places/aero_espana.png",
    ),
    MyFlights(
      title: 'Aeropuerto de España',
      origin: 'Canadá',
      destination: 'España',
      date: '20/09/2025',
      image: 'assets/places/Flag_of_Spain.svg',
      origin_key: "CAN",
      destination_key: "SPN",
      departure_place: 'Montreal',
      arrival_place: 'Barcelona',
      departure_time: '09:15',
      arrival_time: '21:45',
      flight_number: 'AC202',
      departure_airport: 'Montréal-Trudeau',
      airport: 'Josep Tarradellas Barcelona-El Prat',
      terminal: 'T3',
      gate: 'B7',
      airport_image: "assets/places/aero_espana.png",
    ),
    MyFlights(
      title: 'Aeropuerto de Alemania',
      origin: 'Canadá',
      destination: 'Alemania',
      date: '25/09/2025',
      image: 'assets/places/Flag_of_Germany.svg',
      origin_key: "CAN",
      destination_key: "GMN",
      departure_place: 'Vancouver',
      arrival_place: 'Frankfurt',
      departure_time: '07:45',
      arrival_time: '18:20',
      flight_number: 'LH471',
      departure_airport: 'Vancouver Intl',
      airport: 'Frankfurt am Main',
      terminal: 'T2',
      gate: 'C3',
      airport_image: "assets/places/aero_alemania.png",
    ),
    MyFlights(
      title: 'Aeropuerto de Argentina',
      origin: 'Canadá',
      destination: 'Argentina',
      date: '30/09/2025',
      image: 'assets/places/Flag_of_Argentina.svg',
      origin_key: "CAN",
      destination_key: "ARG",
      departure_place: 'Ottawa',
      arrival_place: 'Buenos Aires',
      departure_time: '06:00',
      arrival_time: '22:00',
      flight_number: 'AR104',
      departure_airport: 'Ottawa Intl',
      airport: 'Ministro Pistarini (Ezeiza)',
      terminal: 'T1',
      gate: 'D5',
      airport_image: "assets/places/aero_argentina.png",
    ),
    MyFlights(
      title: 'Aeropuerto de Chile',
      origin: 'Canadá',
      destination: 'Chile',
      date: '05/10/2025',
      image: 'assets/places/Flag_of_Chile.svg',
      origin_key: "CAN",
      destination_key: "CHL",
      departure_place: 'Calgary',
      arrival_place: 'Santiago',
      departure_time: '10:00',
      arrival_time: '23:30',
      flight_number: 'LA801',
      departure_airport: 'Calgary Intl',
      airport: 'Comodoro Arturo Merino Benítez',
      terminal: 'T2',
      gate: 'E2',
      airport_image: "assets/places/aero_chile.png",
    ),
    MyFlights(
      title: 'Aeropuerto de USA',
      origin: 'Canadá',
      destination: 'USA ',
      date: '10/10/2025',
      image: 'assets/places/Flag_of_the_United_States.svg',
      origin_key: "CAN",
      destination_key: "USA",
      departure_place: 'Toronto',
      arrival_place: 'New York',
      departure_time: '12:30',
      arrival_time: '14:45',
      flight_number: 'DL105',
      departure_airport: 'Toronto Pearson',
      airport: 'JFK Intl',
      terminal: 'T4',
      gate: 'F8',
      airport_image: "assets/places/aero_usa.png",
    ),
    MyFlights(
      title: 'Aeropuerto de México',
      origin: 'Canadá',
      destination: 'México',
      date: '15/10/2025',
      image: 'assets/places/Flag_of_Mexico.svg',
      origin_key: "CAN",
      destination_key: "MXN",
      departure_place: 'Quebec',
      arrival_place: 'Ciudad de México',
      departure_time: '11:15',
      arrival_time: '19:30',
      flight_number: 'AM203',
      departure_airport: 'Québec Jean Lesage',
      airport: 'Aeropuerto Intl Benito Juárez',
      terminal: 'T1',
      gate: 'G9',
      airport_image: "assets/places/aero_mexico.png",
    ),
  ];

  */
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
                            'My flights',
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

                SizedBox(height: 20) /*
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .7,
                  child: ListView(
                    children: [
                      ...myFlightsList.map((flight) {
                        return Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: ThemeSettings.p3lightTheme()
                                .colorScheme
                                .surface,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: SvgPicture.asset(
                                  flight.image,
                                  height: 45,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      flight.title,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          flight.origin,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(Icons.flight),
                                        SizedBox(width: 10),
                                        Text(
                                          flight.destination,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      flight.date,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/home/practica3/flight/details",
                                    arguments: flight,
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),*/,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
