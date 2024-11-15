import 'package:app/common_lib.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:flutter/material.dart';

import 'components/detailes_upper_half.dart';
import '../../utils/components/gardient/fading_divider.dart';

class PartyDetailesPage extends StatelessWidget {
  const PartyDetailesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DetailesUpperHalf(
            title: 'Jazz Night',
            subtitle: 'with Ali Jasseb',
            description:
                'A pretty night with calm and relax jazz A pretty night with calm and relax jazz A pretty night with calm and relax jazz',
            imageUrl:
                'https://media.istockphoto.com/id/1977237765/photo/empty-cinema-theatre-seats.jpg?s=1024x1024&w=is&k=20&c=IInm0dHJYkfSF4kGpyhgZeMsfPIAzXooImBc6I_g-IM=',
          ),
          const Column(
            children: [],
          ),

          ////////////////////////
          const Spacer(),

          Padding(
            padding: Insets.mediumAll,
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Assets.assetsSvgLocationOutlined),
                    const Gap(Insets.small),
                    const Text('Baghdad, Almansour')
                  ],
                ),
                const Gap(Insets.small),
                Row(
                  children: [
                    SvgPicture.asset(Assets.assetsSvgCalendarOutlined),
                    const Gap(Insets.small),
                    const Text('March 2-9, 2024')
                  ],
                ),
                const Gap(Insets.small),
                Row(
                  children: [
                    SvgPicture.asset(Assets.assetsSvgMusicOultlineded),
                    const Gap(Insets.small),
                    const Text('Jazz')
                  ],
                ),
                const Gap(Insets.small),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: Insets.medium),
                  child: FadingGardientDivider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '25000IQD',
                      style: TextStyle(
                          fontWeight: FontsTheme.bigWeight,
                          fontSize: FontsTheme.mediumBigSize),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: GradientBorderButton(
                            onPressed: () =>
                                context.pushNamed(RoutesDocument.partyDetailes2nd),
                            text: 'Buy Ticket')),
                  ],
                ),
              ],
            ),
          ),
          const Gap(Insets.large)
        ],
      ),
    );
  }
}
