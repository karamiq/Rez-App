import 'package:app/common_lib.dart';
import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TicketPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    Path path = Path();
    path.moveTo(0, h * .1);
    path.lineTo(0, h * .9);
    final s1 = Offset(w * .1, h * .9);
    final e1 = Offset(w * .1, h);
    path.quadraticBezierTo(s1.dx, s1.dy, e1.dx, e1.dy);
    path.lineTo(w * .18, h);
    final s3 = Offset(w * .235, h * .85);
    final e3 = Offset(w * .27, h);
    path.quadraticBezierTo(s3.dx, s3.dy, e3.dx, e3.dy);
    path.lineTo(w * .9, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
