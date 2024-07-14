import 'package:app/common_lib.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:flutter/material.dart';
import '../../../utils/components/custom_app_bar.dart';
import 'components/payment_info_confirm.dart';
import 'components/ticket_card.dart';

class Buying2ndPage extends StatelessWidget {
  const Buying2ndPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text(
                          'Image failed to load',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: Insets.mediumAll,
                  child: SafeArea(
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomAppBar(
                        title: 'Payment',
                        showCalender: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: Insets.mediumAll,
              child: ListView.builder(
                padding: Insets.noneAll,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => const TicketCard(
                  title: 'Section P, Row 3',
                  subtitle: '12 Seats available',
                  price: '€30',
                  priceDescription: 'per person',
                ),
              ),
            ),
            Padding(
              padding: Insets.mediumAll * 2,
              child: Column(
                children: [
                  const PaymentInfoConfirm(
                    perPerson: 18000,
                    seatPrice: 18000,
                    fees: 18000,
                    total: 54000,
                  ),
                  const Gap(Insets.extraLarge),
                  GradientBorderButton(
                      onPressed: () =>
                          context.pushNamed(RoutesDocument.buying3),
                      text: 'Confirm payment'),
                  const Gap(Insets.extraLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
