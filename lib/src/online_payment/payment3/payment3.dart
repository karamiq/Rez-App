import 'package:app/common_lib.dart';
import 'package:app/src/buying/buying3/components/payment_option.dart';
import 'package:app/utils/components/input_decoration/add_card_decoration.dart';
import 'package:app/utils/components/payment_head.dart';
import 'package:flutter/material.dart';

import '../../../utils/components/buttons/gardient_border_button.dart';

class Payment3Page extends StatelessWidget {
  const Payment3Page({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    void _submitForm() {
      if (_formKey.currentState!.validate()) {
        // Access form data from AddCardForm
        final cardNumber = AddCardForm.cardNumberController.text;
        final cardHolderName = AddCardForm.cardHolderNameController.text;
        final expiryDate = AddCardForm.expiryDateController.text;
        final cvv = AddCardForm.cvvController.text;

        // Print or use the data
        print('Card Number: $cardNumber');
        print('Cardholder Name: $cardHolderName');
        print('Expiry Date: $expiryDate');
        print('CVV: $cvv');

        // Example: Send data to API or process further
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sending payment data...')),
        );
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const OnlinePaymentHead(
                title: 'Choose Payment Method',
                imageUrl:
                    'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
              ),
              const SizedBox(height: Insets.extraLarge),
              Padding(
                padding: const EdgeInsets.all(Insets.medium),
                child: Column(
                  children: [
                    PaymentOption(
                      image: Assets.assetsImagesPaypal,
                      text: 'Paypal',
                      onTap: () {},
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: ColorsTheme.lightPrimary,
                        borderRadius: BorderSize.smallRadius,
                      ),
                      child: Column(
                        children: [
                          PaymentOption(
                            image: Assets.assetsImagesQi,
                            text: 'Qi Card',
                            onTap: () {},
                          ),
                          const SizedBox(height: Insets.medium),
                          AddCardForm(),
                          const SizedBox(height: Insets.medium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Insets.medium),
                child: Column(
                  children: [
                    const SizedBox(height: Insets.extraLarge),
                    GradientBorderButton(
                      onPressed: _submitForm,
                      text: 'Confirm payment',
                    ),
                    const SizedBox(height: Insets.extraLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class TextFieldHeadline extends StatelessWidget {
  const TextFieldHeadline({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.small),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontsTheme.mediumBigWeight,
          color: ColorsTheme.cyan,
          fontSize: FontsTheme.mediumSize,
        ),
      ),
    );
  }
}
