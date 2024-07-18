import 'package:app/common_lib.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:app/utils/components/custom_app_bar.dart';
import 'package:app/utils/components/gardient/custom_svg_style.dart';
import 'package:app/utils/components/gardient/fading_divider.dart';
import 'package:flutter/material.dart';

class ChoosingSeatPage extends StatelessWidget {
  const ChoosingSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ColumnPadded(gap: Insets.medium, children: [
          Container(
            height: 600,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/5af1/98e3/f270cd486976bd3900e567c283a931e7?Expires=1722211200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=meUKdEkXHUtvqG-rZTKSHGvFAXhJRJIjqtIBhawq9~NJcDCDbRAAInIycfJ3t-NQagcVTBfMAOHsRFyNMRjni23GVYlgq6LevG8bh~fv4e3j4SY1q3mKwLzQaG6aquiqZ3vvNJKMR5Ssh4LABPXycWHmxCLz4st6yzhGwhcIRreW29litpVre2RR6wHNGr~oTBuGXWNyKt8Ci-DeyVFWGOxFlV7IzDtUANoLYSCuFtN4J5ArSS2R~CxatRAI1czereqKgycDBbiMd85L0ohHg3DCIn5TcaFIeyjiwuiUjzRG9WT1KqC7ZRh9b1nO1k-zqXXvnbCFp2WtndQmVgrOaw__'))),
            child: Stack(
              children: [
                SafeArea(
                    child: Padding(
                  padding: Insets.mediumAll,
                  child: CustomAppBar(
                    title: 'Choose seats',
                    showCalender: true,
                  ),
                )),
                const Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Jazz Night',
                        style: TextStyle(
                          fontWeight: FontsTheme.bigWeight,
                          fontSize: FontsTheme.mediumVeryBigSize,
                        ),
                      ),
                      Text(
                        'with Ali Jasseb',
                        style: TextStyle(
                          fontWeight: FontsTheme.bigWeight,
                          fontSize: FontsTheme.mediumSize,
                        ),
                      ),
                      Gap(Insets.medium),
                      Text(
                        'A pretty night with calm and relax jazz A pretty night with calm and relax jazz A pretty night with calm and relax jazz',
                        textAlign: TextAlign.center,
                        maxLines: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                const Gap(Insets.extraLarge * 2),
                GradientBorderButton(onPressed: () {}, text: 'Buy Ticket')
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
