import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

import 'models.dart';
import 'seats_generator.dart';

class SeatsTable extends StatelessWidget {
  const SeatsTable(
      {super.key,
      required this.bookedSeats,
      required this.seats,
      this.unSeatColor = ColorsTheme.subtitle,
      this.onSelect,
      this.selectedSeatColor = ColorsTheme.idkSeat});
  final List<SeatsRow> seats;

  final List<Seat> bookedSeats;
  final Color unSeatColor;
  final Color selectedSeatColor;
  final void Function(Seat)? onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            seats.length,
            (index) => SeatRowGenerator(
                onSelect: onSelect,
                unSeatColor: unSeatColor,
                selectedSeatColor: selectedSeatColor,
                rowIndex: index,
                gap: seats[index].gap,
                spacerIndex: seats[index].spacerIndex,
                statuses: seats[index].statuses,
                bookedSeats: bookedSeats)));
  }
}
