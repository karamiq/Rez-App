import 'package:app/common_lib.dart';
import 'package:app/src/buying/buying3/components/payment_option.dart';
import 'package:app/src/online_payment/components/add_card_form.dart';
import 'package:app/src/tabs/components/custom_botton_app_bar.dart';
import 'package:app/utils/components/gardient/custom_svg_style.dart';
import 'package:app/utils/components/payment_head.dart';
import 'package:flutter/material.dart';

import '../../../utils/components/buttons/gardient_border_button.dart';
import '../../../utils/components/input_decoration/add_card_decoration.dart';
import '../../../utils/components/methodes/ticket_payment_done.dart';
import '../../../utils/components/text_field_head_line.dart';
import '../components/card_form_animation.dart';

class QiCardPaymentPage extends StatelessWidget {
  const QiCardPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    void submitForm() {
      if (formKey.currentState!.validate()) {
        ticketPaymentDone(context);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const OnlinePaymentHead(
                title: 'Choose Payment Method',
                imageUrl:
                    'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
              ),
              const SizedBox(height: Insets.extraLarge),
              CardFormAnimation(
                title: Column(
                  children: [
                    PaymentOption(
                      raduisBottom: true,
                      image: Assets.assetsImagesPaypal,
                      text: 'Paypal',
                      onTap: () {},
                    ),
                    const Gap(Insets.small),
                    const PaymentOption(
                      raduisBottom: false,
                      image: Assets.assetsImagesQi,
                      text: 'Qi Card',
                    ),
                  ],
                ),
                content: const AddCardForm(),
                contenetHeight: 370,
              ),
              Padding(
                padding: const EdgeInsets.all(Insets.medium),
                child: Column(
                  children: [
                    const SizedBox(height: Insets.extraLarge),
                    GradientBorderButton(
                      onPressed: submitForm,
                      text: 'Next',
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
