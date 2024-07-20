import 'package:app/common_lib.dart';
import 'package:app/src/ticketing_&_detailes/components/detailes_upper_half_2nd.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:app/utils/components/seats/empty_state_snack_bar.dart';
import 'package:flutter/material.dart';
import '../../utils/components/seats/seats_table.dart';
import '../../utils/components/seats/models.dart';
import 'components/detailes2nd_info.dart';

class PartyDetailes2ndPage extends StatelessWidget {
  const PartyDetailes2ndPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Seat> bookedSeats = [];

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      const DetailesUpperHalf2nd(
        title: 'Jazz Night',
        subtitle: 'with Ali Jasseb',
        description:
            'A pretty night with calm and relax jazz A pretty night with calm and relax jazz A pretty night with calm and relax jazz',
        imageUrl:
            'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
      ),
      const Gap(Insets.medium),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Detailes2ndInfo(
            location: 'Baghdad, Almansour',
            date: 'March 2-9, 2024',
          ),
          const Gap(Insets.extraLarge * 2),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: Insets.large),
            decoration: BoxDecoration(
                borderRadius: BorderSize.mediumRadius,
                border: Border.all(color: ColorsTheme.darkIndego, width: .5)),
            child: SeatsTable(
              bookedSeats: bookedSeats,
              seats: [
                SeatsRow(
                  spacerIndex: 3,
                  gap: MediaQuery.of(context).size.width / 5,
                  statuses: const [
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.available,
                    SeatStatus.booked,
                    SeatStatus.available,
                    SeatStatus.booked,
                  ],
                ),
                SeatsRow(
                  spacerIndex: 4,
                  gap: MediaQuery.of(context).size.width / 10,
                  statuses: const [
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.available,
                    SeatStatus.booked,
                    SeatStatus.available,
                    SeatStatus.booked,
                    SeatStatus.available,
                    SeatStatus.booked,
                  ],
                ),
                const SeatsRow(
                  statuses: [
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.available,
                    SeatStatus.available,
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.available,
                  ],
                ),
                const SeatsRow(
                  statuses: [
                    SeatStatus.available,
                    SeatStatus.available,
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.available,
                    SeatStatus.available,
                  ],
                ),
                const SeatsRow(
                  statuses: [
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.available,
                    SeatStatus.available,
                    SeatStatus.available,
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.booked,
                  ],
                ),
                const SeatsRow(
                  statuses: [
                    SeatStatus.available,
                    SeatStatus.available,
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.booked,
                    SeatStatus.available,
                    SeatStatus.available,
                    SeatStatus.booked,
                    SeatStatus.booked,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      Padding(
        padding: Insets.mediumAll,
        child: GradientBorderButton(
            onPressed: () {
              if (bookedSeats.isEmpty) {
                EmptySelectedSeatsSnackBar.show(context);
                return;
              }
              context.pushNamed(RoutesDocument.buying1, extra: bookedSeats);
            },
            text: 'Buy Ticket'),
      ),
    ])));
  }
}
