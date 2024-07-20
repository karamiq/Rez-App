class Seat {
  SeatStatus status;
  int row;
  int column;
  Seat({
    required this.status,
    required this.row,
    required this.column,
  });
}

enum SeatStatus {
  booked,
  available,
  selected,
}

class SeatsRow {
  const SeatsRow({
    required this.statuses,
    this.spacerIndex,
    this.gap = 0,
  });

  final List<SeatStatus> statuses;
  final int? spacerIndex;
  final double? gap;
}
