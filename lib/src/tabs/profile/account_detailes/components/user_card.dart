import 'package:app/src/tabs/profile/account_detailes/components/user_card_detailes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common_lib.dart';
import 'user_card_clipper.dart';

class UserCard extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;

  const UserCard({
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: UserCardClipper(),
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Insets.medium, vertical: Insets.extraLarge),
            height: 260,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderSize.mediumRadius,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFE85EFF), Color(0xFF561976)])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.assetsImagesVisaIncLogo),
                const Gap(Insets.large * 1.5),
                Text(
                  cardNumber,
                  style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontsTheme.mediumBigWeight,
                      fontSize: FontsTheme.veryBigSize - 3),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Holder',
                            style: TextStyle(
                                fontWeight: FontsTheme.mediumBigWeight,
                                fontSize: FontsTheme.mediumBigSize),
                          ),
                          Text(
                            cardHolder,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontsTheme.mediumBigWeight,
                                fontSize: FontsTheme.bigSize),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Exp Date',
                            style: TextStyle(
                                fontWeight: FontsTheme.mediumBigWeight,
                                fontSize: FontsTheme.mediumBigSize),
                          ),
                          Text(
                            expiryDate,
                            style: const TextStyle(
                                fontWeight: FontsTheme.mediumBigWeight,
                                fontSize: FontsTheme.bigSize),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(500),
            onTap: () => userCardDetailes(
              context,
              '1234 - 5678 - 1234 - 5678', // Card number
              'Prince', // Cardholder name
              '07 / 2027', // Expiry date
            ),
            child: Container(
              height: 40,
              width: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderSize.mediumRadius,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFE85EFF), Color(0xFF561976)],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Gap(Insets.small),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Gap(Insets.small),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
