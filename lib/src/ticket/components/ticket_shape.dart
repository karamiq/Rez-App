import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import 'ticket_painter.dart';

class TicketClipShape extends StatelessWidget {
  final Widget child;
  final String imageUrl;

  const TicketClipShape({
    required this.child,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsTheme.secondary,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
        ),
        height: 180,
        width: double.infinity,
        child: Center(child: child),
      ),
    );
  }
}
