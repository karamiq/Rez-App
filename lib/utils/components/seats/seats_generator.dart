import 'package:flutter/material.dart';
import '../../../common_lib.dart';
import 'models.dart';

class SeatRowGenerator extends StatefulWidget {
  const SeatRowGenerator({
    super.key,
    required this.rowIndex,
    required this.statuses,
    this.unSeatColor = ColorsTheme.subtitle,
    this.spacerIndex,
    this.gap = 0,
    required this.bookedSeats,
    this.onSelect,
    required this.selectedSeatColor,
  });
  final Color unSeatColor;
  final Color selectedSeatColor;
  final int rowIndex;
  final List<SeatStatus> statuses;
  final void Function(Seat)? onSelect;
  final int? spacerIndex;
  final double? gap;
  final List<Seat> bookedSeats;

  @override
  State<SeatRowGenerator> createState() => _SeatRowGeneratorState();
}

class _SeatRowGeneratorState extends State<SeatRowGenerator> {
  late List<Seat> _seats;

  @override
  void initState() {
    super.initState();
    _seats = List.generate(widget.statuses.length, (index) {
      return Seat(
        status: widget.statuses[index],
        row: widget.rowIndex,
        column: index,
      );
    });
  }

  void handleSeatTapped(Seat seat) {
    setState(() {
      if (seat.status == SeatStatus.available) {
        seat.status = SeatStatus.selected;
        widget.bookedSeats.add(seat);
      } else if (seat.status == SeatStatus.selected) {
        seat.status = SeatStatus.available;
        widget.bookedSeats.remove(seat);
      }
    });
    if (widget.onSelect != null && seat.status != SeatStatus.booked) {
      widget.onSelect!(seat);
    }
    print(
        'Row: ${seat.row}, Column: ${seat.column}, Booked Seats: ${widget.bookedSeats.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_seats.length + 1, (index) {
        if (widget.spacerIndex != null && index == widget.spacerIndex!) {
          return SizedBox(width: widget.gap);
        }
        int seatIndex = index;
        if (widget.spacerIndex != null && index > widget.spacerIndex!) {
          seatIndex = index - 1;
        }
        if (seatIndex < 0 || seatIndex >= _seats.length) {
          return const SizedBox.shrink();
        }

        Seat seat = _seats[seatIndex];
        Color seatColor = seat.status == SeatStatus.booked
            ? ColorsTheme.soldSeat
            : seat.status == SeatStatus.available
                ? widget.unSeatColor
                : widget.selectedSeatColor;

        return InkWell(
          onTap: () => handleSeatTapped(seat),
          borderRadius: BorderSize.extraSmallRadius,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Insets.small, horizontal: Insets.extraSmall),
            child: SvgPicture.asset(
              Assets.assetsSvgSeat,
              color: seatColor,
            ),
          ),
        );
      }),
    );
  }
}
