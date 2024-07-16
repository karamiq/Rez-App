import 'package:flutter/material.dart';

import '../../../utils/components/input_decoration/add_card_decoration.dart';
import '../../../utils/components/text_field_head_line.dart';
import '../../../utils/constants/sizes.dart';

class AddCardForm extends StatelessWidget {
  static final TextEditingController cardNumberController =
      TextEditingController();
  static final TextEditingController cardHolderNameController =
      TextEditingController();
  static final TextEditingController expiryDateController =
      TextEditingController();
  static final TextEditingController cvvController = TextEditingController();

  const AddCardForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? validator(String? query) {
      if (query == null || query.isEmpty) {
        return 'Field required';
      }
      return null;
    }

    String? cardValidator(String? query) {
      if (query == null || query.isEmpty) {
        return 'Field required';
      } else if (query.length != 16) {
        return 'Invalid card number';
      }
      return null;
    }

    return Padding(
      padding: Insets.smallAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldHeadline(text: 'Card number'),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: cardNumberController,
            validator: cardValidator,
            decoration:
                addCardDecoration(labelText: '1234 - 5678 - 1234 - 5678'),
          ),
          const TextFieldHeadline(text: 'Cardholder name'),
          TextFormField(
            controller: cardHolderNameController,
            validator: validator,
            decoration: addCardDecoration(labelText: 'Prince'),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFieldHeadline(text: 'Expiry date'),
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      controller: expiryDateController,
                      validator: validator,
                      decoration: addCardDecoration(labelText: '07 / 2027'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Insets.extraLarge),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFieldHeadline(text: 'CVV/CVC'),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: cvvController,
                      validator: validator,
                      decoration: addCardDecoration(
                        labelText: '',
                        label: Row(
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: const EdgeInsets.all(Insets.extraSmall),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
