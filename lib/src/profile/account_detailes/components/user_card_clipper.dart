import 'package:flutter/material.dart';

class UserCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * .5, 0);

    var firstP1 = Offset(size.width * .58, 0);
    var endP1 = Offset(size.width * .63, size.height * .1); // Adjusted endP1
    path.quadraticBezierTo(firstP1.dx, firstP1.dy, endP1.dx, endP1.dy);

    var firstP2 =
        Offset(size.width * .68, size.height * .2); // Adjusted firstP2
    var endP2 = Offset(size.width * .72, size.height * .2);
    path.quadraticBezierTo(firstP2.dx, firstP2.dy, endP2.dx, endP2.dy);
    path.lineTo(size.width * .86, size.height * .2);

    var firstP3 = Offset(size.width, size.height * .2);
    var endP3 = Offset(size.width, size.height * .5); // Adjusted endP3
    path.quadraticBezierTo(firstP3.dx, firstP3.dy, endP3.dx, endP3.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}