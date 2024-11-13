import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    Path path = Path();
    path.lineTo(0, h * .85);
    //bottom left corner curver
    final s1 = Offset(w * .07, h * .85);
    final e1 = Offset(w * .07, h);
    path.quadraticBezierTo(s1.dx, s1.dy, e1.dx, e1.dy);
    //
    path.lineTo(w * .16, h);
    //
    //1'st start cut curve
    final s3 = Offset(w * .18, h);
    final e3 = Offset(w * .195, h * .95);
    path.quadraticBezierTo(s3.dx, s3.dy, e3.dx, e3.dy);
    //
    //middle cut curve
    final s4 = Offset(w * .22, h * .89);
    final e4 = Offset(w * .245, h * .95);
    path.quadraticBezierTo(s4.dx, s4.dy, e4.dx, e4.dy);
    //
    //last cut curve
    final s5 = Offset(w * .26, h);
    final e5 = Offset(w * .29, h);
    path.quadraticBezierTo(s5.dx, s5.dy, e5.dx, e5.dy);
    path.lineTo(w * .92, h);
    /////////////////////////////////////////////////////////
    //Bottom right curve
    final s6 = Offset(w * .92, h * .85);
    final e6 = Offset(w, h * .85);
    path.quadraticBezierTo(s6.dx, s6.dy, e6.dx, e6.dy);
    path.lineTo(w, h * .15);
    /////////////////////////////////////////////////////////
    //Top right curve
    final s7 = Offset(w * .92, h * .15);
    final e7 = Offset(w * .92, 0);
    path.quadraticBezierTo(s7.dx, s7.dy, e7.dx, e7.dy);
    path.lineTo(w * .3, 0);
    /////////////////////////////////////////////////////////
    //2'nd start curve
    final s8 = Offset(w * .26, 0);
    final e8 = Offset(w * .245, h * .05);
    path.quadraticBezierTo(s8.dx, s8.dy, e8.dx, e8.dy);
    //
    //2'nd middle curve
    final s9 = Offset(w * .22, h * .11);
    final e9 = Offset(w * .195, h * .05);
    path.quadraticBezierTo(s9.dx, s9.dy, e9.dx, e9.dy);
    //
    //2'nd last curve
    final s10 = Offset(w * .18, 0);
    final e10 = Offset(w * .16, 0);
    path.quadraticBezierTo(s10.dx, s10.dy, e10.dx, e10.dy);
    path.lineTo(w * .07, 0);
    ////////////////////////////////////////////////////////
    //Top left curve
    final s11 = Offset(w * .07, h * .15);
    final e11 = Offset(0, h * .15);
    path.quadraticBezierTo(s11.dx, s11.dy, e11.dx, e11.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
