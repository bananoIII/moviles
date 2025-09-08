import 'dart:math';

import 'package:flutter/material.dart';

class Practica1Components {
  static getStrucure(context, member) {
    var member_image = member[0];
    double smart = member[1] * 1.0;
    double charisma = member[2] * 1.0;
    double looks = member[3] * 1.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        Practica1Components.getCard(context),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(right: 58),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AttributeWidget(
                  progress: smart,
                  child: Icon(Icons.auto_stories),
                ),
                SizedBox(height: 10),
                AttributeWidget(progress: charisma, child: Icon(Icons.star)),
                SizedBox(height: 10),
                AttributeWidget(progress: looks, child: Icon(Icons.favorite)),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/home/practica1/details',
                        arguments: member,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 1,
                      ), // borde
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ), // borde redondeado
                      ),
                      backgroundColor: Colors
                          .transparent, // fondo transparente (si lo necesitas)
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Ver detalles',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Transform.translate(
            offset: Offset(-30, 0),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/" + member_image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static getCard(context) {
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(-10, 0),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.01)
              ..rotateY(.12),
            child: Container(
              height: 230,
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(22)),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(-44, 0),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.01)
              ..rotateY(.12),
            child: Container(
              height: 188,
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(22)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AttributeWidget extends StatelessWidget {
  final double size;
  final double progress;
  final Widget child;

  const AttributeWidget({
    required this.progress,
    this.size = 50,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AttributePainter(progressPercent: progress, context: context),
      size: Size(size, size),
      child: Container(
        padding: EdgeInsets.all(size / 5.8),
        width: size,
        height: size,
        child: child,
      ),
    );
  }
}

class AttributePainter extends CustomPainter {
  final double progressPercent;
  final double strokeWidth, filledStrokeWidth;

  final bgPaint, strokeBgPaint, strokeFilledPaint;

  AttributePainter({
    required this.progressPercent,
    this.strokeWidth = 4.0,
    this.filledStrokeWidth = 8.0,
    context,
  }) : bgPaint = Paint()
         ..color = Theme.of(context).colorScheme.surface.withOpacity(0.25),
       strokeBgPaint = Paint()..color = Theme.of(context).colorScheme.primary,
       strokeFilledPaint = Paint()
         ..color = Theme.of(context).colorScheme.onPrimary
         ..style = PaintingStyle.stroke
         ..strokeWidth = filledStrokeWidth
         ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawCircle(center, radius - strokeWidth, strokeBgPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - (strokeWidth / 2)),
      pi / 2, // - 45 degrees to start from top
      (progressPercent / 100) * pi * 2,
      false,
      strokeFilledPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
