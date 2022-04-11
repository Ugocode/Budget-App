import 'dart:math';

import 'package:flutter/material.dart';

class RadialPainter extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  final double percent;
  final double width;

  RadialPainter({this.bgColor, this.lineColor, this.percent, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLine = Paint()
      ..color = bgColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint completeLine = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    //to get the center of our paint
    Offset center = Offset(size.width / 2, size.height / 2);

    double radius = min(size.width / 2, size.height / 2);
    //to get the bacground gray circle:
    canvas.drawCircle(center, radius, bgLine);
    //to draw the arc of the progress
    double sweepAngle = 2 * pi * percent;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        //to get where the arc starts from
        //eg: pi, or pi/2 etc:
        -pi / 2,
        sweepAngle,
        false,
        completeLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
