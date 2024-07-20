import 'package:flutter/material.dart';

import '../../common_lib.dart';
import '../../utils/components/buttons/gardient_border_button.dart';
import '../../utils/components/gardient/custom_svg_style.dart';
import '../../utils/components/gardient/fading_divider.dart';
import '../../utils/components/seats/models.dart';
import '../buying/buying2/components/ticket_card.dart';
import '../ticketing_&_detailes/components/detailes_upper_half_2nd.dart';
import 'components/chosing_secton_dialog.dart';

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
                'https://s3-alpha-sig.figma.com/img/5af1/98e3/f270cd486976bd3900e567c283a931e7?Expires=1722211200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=meUKdEkXHUtvqG-rZTKSHGvFAXhJRJIjqtIBhawq9~NJcDCDbRAAInIycfJ3t-NQagcVTBfMAOHsRFyNMRjni23GVYlgq6LevG8bh~fv4e3j4SY1q3mKwLzQaG6aquiqZ3vvNJKMR5Ssh4LABPXycWHmxCLz4st6yzhGwhcIRreW29litpVre2RR6wHNGr~oTBuGXWNyKt8Ci-DeyVFWGOxFlV7IzDtUANoLYSCuFtN4J5ArSS2R~CxatRAI1czereqKgycDBbiMd85L0ohHg3DCIn5TcaFIeyjiwuiUjzRG9WT1KqC7ZRh9b1nO1k-zqXXvnbCFp2WtndQmVgrOaw__',
          ),
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
                    onPressed: () => context.pushNamed(RoutesDocument.buying1,
                        extra: bookedSeats),
                    text: 'Buy Ticket')
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
