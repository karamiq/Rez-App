import 'package:app/common_lib.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:app/utils/components/gardient/custom_svg_style.dart';
import 'package:app/utils/components/gardient/fading_divider.dart';
import 'package:flutter/material.dart';

import '../ticketing_&_detailes/components/detailes_upper_half_2nd.dart';
import 'components/chosing_secton_dialog.dart';

class ChoosingSeatPage extends StatelessWidget {
  const ChoosingSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ColumnPadded(gap: Insets.medium, children: [
          const DetailesUpperHalf2nd(
            title: 'Jazz Night',
            subtitle: 'with Ali Jasseb',
            description:
                'A pretty night with calm and relax jazz A pretty night with calm and relax jazz A pretty night with calm and relax jazz',
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
                InkWell(
                  //AlertDialog
                  onTap: () => choseSectionDialog(context),
                  child: Image.asset(Assets.assetsImagesStaduim),
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

/**
 import 'package:flutter/material.dart';
import '../ticketing_&_detailes/components/detailes_upper_half_2nd.dart';
import 'components/chosing_secton_dialog.dart';
import 'package:app/common_lib.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:app/utils/components/gardient/custom_svg_style.dart';
import 'package:app/utils/components/gardient/fading_divider.dart';

class ChoosingSeatPage extends StatelessWidget {
  const ChoosingSeatPage({super.key});

  // Example list to track selected seats
  final List<String> selectedSeats = []; // This could be a list of seat IDs or similar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ColumnPadded(gap: Insets.medium, children: [
          const DetailesUpperHalf2nd(
            title: 'Jazz Night',
            subtitle: 'with Ali Jasseb',
            description:
                'A pretty night with calm and relax jazz A pretty night with calm and relax jazz A pretty night with calm and relax jazz',
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
                InkWell(
                  onTap: () => choseSectionDialog(context),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                ),
                const Gap(Insets.extraLarge * 2),
                GradientBorderButton(
                  onPressed: () {
                    if (selectedSeats.isEmpty) {
                      // Show an alert dialog or a snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No seats selected. Please choose your seats before proceeding.'),
                        ),
                      );
                    } else {
                      // Proceed with ticket purchase
                      // Add your ticket purchase logic here
                    }
                  },
                  text: 'Buy Ticket',
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

 */