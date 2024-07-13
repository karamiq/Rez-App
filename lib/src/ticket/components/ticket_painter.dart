import 'package:app/common_lib.dart';
import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TicketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    canvas.drawArc(
        Rect.fromCircle(center: const Offset(0, 0), radius: 25),
        0,
        10,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = ColorsTheme.backGround);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(w, h), radius: 25),
        0,
        10,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = ColorsTheme.backGround);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(0, h), radius: 25),
        0,
        10,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = ColorsTheme.backGround);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(w, 0), radius: 25),
        0,
        10,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = ColorsTheme.backGround);

    canvas.drawArc(
        Rect.fromCircle(center: Offset(w / 3, 0), radius: 15),
        0,
        10,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = ColorsTheme.backGround);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(w / 3, h), radius: 15),
        0,
        10,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = ColorsTheme.backGround);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
