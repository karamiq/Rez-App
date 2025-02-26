import 'package:flutter/material.dart';

import '../../common_lib.dart';
import '../../utils/components/buttons/gardient_border_button.dart';
import '../../utils/components/gardient/custom_svg_style.dart';
import '../../utils/components/gardient/fading_divider.dart';
import '../../utils/components/seats/models.dart';
import '../buying/buying2/components/ticket_card.dart';
import '../ticketing_&_detailes/components/detailes_upper_half_2nd.dart';

class ChoosingSeat2ndPage extends StatelessWidget {
  const ChoosingSeat2ndPage({super.key, required this.bookedSeats});
  final List<Seat> bookedSeats;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ColumnPadded(gap: Insets.medium, children: [
          const DetailesUpperHalf2nd(
              title: '',
              subtitle: '',
              description: '',
              imageUrl:
                  'https://npr.brightspotcdn.com/dims4/default/ebb6163/2147483647/strip/true/crop/913x653+0+0/resize/1760x1258!/format/webp/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F67%2Fc4%2F9238fb924af49439dba9c9fa40c6%2Fbadluck-180921-pmb-24.jpg'),
          Padding(
            padding: Insets.mediumAll,
            child: ColumnPadded(
              crossAxisAlignment: CrossAxisAlignment.start,
              gap: Insets.medium,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomISvgStyle(icon: Assets.assetsSvgBuildings),
                        const Gap(Insets.small),
                        const Text('Baghdad, Almansour')
                      ],
                    ),
                    const Gap(Insets.small),
                    Row(
                      children: [
                        CustomISvgStyle(
                          icon: Assets.assetsSvgCalendarOutlined,
                        ),
                        const Gap(Insets.small),
                        const Text('2024/2/4')
                      ],
                    ),
                  ],
                ),
                const FadingGardientDivider(),
                const Text(
                  'Choose your seat',
                  style: TextStyle(
                      fontSize: FontsTheme.mediumBigSize,
                      fontWeight: FontsTheme.mediumBigWeight),
                ),
                const Gap(Insets.small),
                Center(child: SvgPicture.asset(Assets.assetsSvgSeatmap)),
                SizedBox(
                  height: 170,
                  child: Center(
                    child: ListView.builder(
                        itemCount: bookedSeats.length,
                        itemBuilder: (context, index) {
                          return TicketCard(
                              title: 'Section P, Row ${bookedSeats[index].row}',
                              subtitle: '12 Seats available',
                              price: '€30',
                              priceDescription: 'per person');
                        }),
                  ),
                ),
                const Gap(Insets.extraLarge),
                GradientBorderButton(
                    onPressed: () =>
                        context.pushNamed(RoutesDocument.buying1, extra: bookedSeats),
                    text: 'Buy Ticket')
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
