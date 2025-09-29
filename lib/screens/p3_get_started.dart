import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:progra_movil/models/carrousel.dart';

final List<String> imgList = [
  'assets/p3_carrousel_img1.jpg',
  'assets/p3_carrousel_img2.jpg',
  'assets/p3_carrousel_img3.jpg',
];

final List<ClassCarrousel> carrouselList = [
  ClassCarrousel(
    image_selected: 'assets/p3_carrousel_img1.jpg',
    title: 'From city streets to sandy beaches',
    description:
        'Take a break and escape to paradise, we’ll get you there safely and easily',
  ),
  ClassCarrousel(
    image_selected: 'assets/p3_carrousel_img2.jpg',
    title: 'From anywhere to anywhere',
    description:
        'At this time (COVID-19), we are always ready to keep you safe',
  ),
  ClassCarrousel(
    image_selected: 'assets/p3_carrousel_img3.jpg',
    title: 'Your passport to the world',
    description:
        'No borders can stop your journey, travel prepared and with peace of mind',
  ),
];

class getStarted extends StatefulWidget {
  const getStarted({super.key});

  @override
  State<getStarted> createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  int _current = 1;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                double offsetY = 0;
                if (entry.key == 0 || entry.key == 2) {
                  offsetY = 9;
                }
                return Transform.translate(
                  offset: Offset(0, offsetY),
                  child: GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? Colors.lightBlue
                            : Colors.grey,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            CarouselSlider(
              items: carrouselList
                  .map((item) => buildCarrouselSlide(item, context))
                  .toList(),
              carouselController: _controller,
              options: CarouselOptions(
                height: 570.0,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enableInfiniteScroll: true,
                initialPage: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home/practica3/home');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                textStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 20),
                ),
                minimumSize: WidgetStateProperty.all(Size(270, 60)),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
              child: const Text('Get started'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildCarrouselSlide(ClassCarrousel data, BuildContext context) {
  List<String> textColor = data.title.split(' ');

  return Column(
    children: [
      Flexible(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.60,
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120),
            image: DecorationImage(
              image: AssetImage(data.image_selected),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      SizedBox(height: 15),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: textColor[0] + ' ',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: textColor[1] + ' ',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: textColor.length > 2 ? textColor.sublist(2).join(' ') : '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 10),
      Container(
        margin: EdgeInsets.all(15),
        child: Text(
          data.description,
          style: const TextStyle(color: Colors.grey, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
