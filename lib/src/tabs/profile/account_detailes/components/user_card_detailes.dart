import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

Future<dynamic> userCardDetailes(
  BuildContext context,
  String cardNumber,
  String cardholderName,
  String expiryDate,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: ColorsTheme.cardColor,
        content: SizedBox(
          width: MediaQuery.of(context).size.width - 80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Detail Card',
                    style: TextStyle(
                      fontWeight: FontsTheme.mediumBigWeight,
                      color: ColorsTheme.cyan,
                      fontSize: FontsTheme.mediumSize,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.clear,
                      color: ColorsTheme.cyan,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Insets.small),
              const SizedBox(height: Insets.medium),
              _buildCardDetailItem(
                'Card number',
                cardNumber,
              ),
              const SizedBox(height: Insets.medium),
              _buildCardDetailItem(
                'Cardholder name',
                cardholderName,
              ),
              const SizedBox(height: Insets.medium),
              Row(
                children: [
                  Expanded(
                    child: _buildCardDetailItem(
                      'Expiry date',
                      expiryDate,
                    ),
                  ),
                  const SizedBox(width: Insets.medium),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'cvv/cvc',
                          style: TextStyle(
                            fontWeight: FontsTheme.mediumBigWeight,
                            color: ColorsTheme.onCard,
                            fontSize: FontsTheme.mediumSize - 1,
                          ),
                        ),
                        const SizedBox(height: Insets.small),
                        Container(
                          width: double.infinity,
                          height: 55,
                          padding: const EdgeInsets.all(Insets.medium),
                          decoration: const BoxDecoration(
                            borderRadius: BorderSize.extraLargeRadius,
                            color: Color(0xFF181928),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: List.generate(
                              3,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.all(Insets.extraSmall),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                    color: ColorsTheme.onCard,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildCardDetailItem(String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontsTheme.mediumBigWeight,
          color: ColorsTheme.onCard,
          fontSize: FontsTheme.mediumSize - 1,
        ),
      ),
      const SizedBox(height: Insets.small),
      Container(
        width: double.infinity,
        height: 55,
        padding: const EdgeInsets.all(Insets.medium),
        decoration: const BoxDecoration(
          borderRadius: BorderSize.extraLargeRadius,
          color: Color(0xFF181928),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          value,
          style: const TextStyle(
            color: ColorsTheme.onCard,
          ),
        ),
      ),
    ],
  );
}
