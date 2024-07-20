import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class Detailes2ndInfo extends StatelessWidget {
  const Detailes2ndInfo({
    super.key,
    required this.location,
    required this.date,
  });
  final String location;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.mediumAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.assetsSvgLocationOutlined),
                  const Gap(Insets.small),
                  Text(location),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(Assets.assetsSvgCalendarOutlined),
                  const Gap(Insets.small),
                  Text(date)
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
    );
  }
}
