import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class SeatRow extends StatefulWidget {
  const SeatRow(
      {super.key,
      required this.seatsStyle,
      required this.colors,
      required this.seatsNumber});
  final MainAxisAlignment seatsStyle;
  final List<Color> colors;
  final Function(int value) seatsNumber;
  @override
  State<SeatRow> createState() => _SeatRowState();
}

class _SeatRowState extends State<SeatRow> {
  late List<Color> seatColors;
  @override
  void initState() {
    super.initState();
    seatColors = List.from(widget.colors);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.seatsStyle,
      children: List.generate(widget.colors.length, (index) {
        return InkWell(
          onTap: () {
            int bookedSeats = 0;
            setState(() {
              if (seatColors[index] == ColorsTheme.soldSeat) {
                print('Cannot book');
              } else if (seatColors[index] == ColorsTheme.subtitle) {
                seatColors[index] = ColorsTheme.idkSeat;
                bookedSeats++;
                widget.seatsNumber(bookedSeats);
              } else {
                seatColors[index] = ColorsTheme.subtitle;
                bookedSeats--;
                widget.seatsNumber(bookedSeats);
              }
            });
          },
          borderRadius: BorderSize.extraSmallRadius,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Insets.small, horizontal: Insets.extraSmall),
            child: SvgPicture.asset(
              Assets.assetsSvgSeat,
              color: seatColors[index],
            ),
          ),
        );
      }).toList(),
    );
  }
}
