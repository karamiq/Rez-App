// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:app/common_lib.dart';
import 'package:app/src/ticketing_&_detailes/components/detailes_upper_half_2nd.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:flutter/material.dart';
import 'components/fading_divider.dart';
import 'components/seat_row.dart';

class PartyDetailes2ndPage extends StatelessWidget {
  const PartyDetailes2ndPage({super.key});

  @override
  Widget build(BuildContext context) {
    int bookedSeats = 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                Padding(
                  padding: Insets.mediumAll,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                  Assets.assetsSvgLocationOutlined),
                              const Gap(Insets.small),
                              const Text('Baghdad, Almansour'),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  Assets.assetsSvgCalendarOutlined),
                              const Gap(Insets.small),
                              const Text('March 2-9, 2024')
                            ],
                          ),
                        ],
                      ),
                      const Gap(Insets.extraLarge * 1.5),
                      const Text(
                        'Choose your seat',
                        style: TextStyle(
                            fontWeight: FontsTheme.mediumWeight,
                            fontSize: FontsTheme.mediumBigSize),
                      ),
                      const Gap(Insets.small),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.assetsSvgSeat,
                            color: ColorsTheme.soldSeat,
                          ),
                          const Text(
                            'Sold',
                            style: TextStyle(
                              color: ColorsTheme.soldSeat,
                            ),
                          ),
                          const Gap(Insets.large),
                          SvgPicture.asset(
                            Assets.assetsSvgSeat,
                            color: ColorsTheme.subtitle,
                          ),
                          const Text(
                            'Available',
                            style: TextStyle(
                              color: ColorsTheme.subtitle,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(Insets.extraLarge * 2),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: Insets.large),
                  decoration: BoxDecoration(
                      borderRadius: BorderSize.mediumRadius,
                      border:
                          Border.all(color: ColorsTheme.darkIndego, width: .5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatRow(
                              seatsNumber: (value) => bookedSeats += value,
                              seatsStyle: MainAxisAlignment.center,
                              colors: const [
                                ColorsTheme.soldSeat,
                                ColorsTheme.soldSeat,
                                ColorsTheme.subtitle,
                              ]),
                          SeatRow(
                              seatsNumber: (value) => bookedSeats += value,
                              seatsStyle: MainAxisAlignment.center,
                              colors: const [
                                ColorsTheme.soldSeat,
                                ColorsTheme.soldSeat,
                                ColorsTheme.subtitle,
                              ]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatRow(
                              seatsNumber: (value) => bookedSeats += value,
                              seatsStyle: MainAxisAlignment.spaceAround,
                              colors: const [
                                ColorsTheme.soldSeat,
                                ColorsTheme.soldSeat,
                                ColorsTheme.idkSeat,
                                ColorsTheme.idkSeat,
                              ]),
                          SeatRow(
                              seatsNumber: (value) => bookedSeats += value,
                              seatsStyle: MainAxisAlignment.center,
                              colors: const [
                                ColorsTheme.soldSeat,
                                ColorsTheme.soldSeat,
                                ColorsTheme.soldSeat,
                                ColorsTheme.soldSeat,
                              ]),
                        ],
                      ),
                      SeatRow(
                          seatsNumber: (value) => bookedSeats += value,
                          seatsStyle: MainAxisAlignment.center,
                          colors: const [
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.subtitle,
                            ColorsTheme.subtitle,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.subtitle,
                          ]),
                      SeatRow(
                          seatsNumber: (value) => bookedSeats += value,
                          seatsStyle: MainAxisAlignment.spaceAround,
                          colors: const [
                            ColorsTheme.subtitle,
                            ColorsTheme.subtitle,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.subtitle,
                            ColorsTheme.subtitle,
                          ]),
                      SeatRow(
                          seatsNumber: (value) => bookedSeats += value,
                          seatsStyle: MainAxisAlignment.spaceAround,
                          colors: const [
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.subtitle,
                            ColorsTheme.subtitle,
                            ColorsTheme.subtitle,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                          ]),
                      SeatRow(
                          seatsNumber: (value) => bookedSeats += value,
                          seatsStyle: MainAxisAlignment.spaceAround,
                          colors: const [
                            ColorsTheme.subtitle,
                            ColorsTheme.subtitle,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                            ColorsTheme.subtitle,
                            ColorsTheme.subtitle,
                            ColorsTheme.soldSeat,
                            ColorsTheme.soldSeat,
                          ]),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: Insets.mediumAll,
              child: GradientBorderButton(
                  onPressed: () {
                    context.pushNamed(RoutesDocument.buying1);
                    print('booked Seats: $bookedSeats');
                  },
                  text: 'Buy Ticket'),
            ),
            const Gap(Insets.large)
          ],
        ),
      ),
    );
  }
}
