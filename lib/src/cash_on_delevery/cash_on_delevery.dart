import 'package:app/common_lib.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:app/utils/components/payment_head.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../utils/components/methodes/ticket_payment_done.dart';
import 'components/card_form.dart';
import 'components/map_card.dart';

class CashOnDeliveryPage extends StatelessWidget {
  const CashOnDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    LatLng? selectedLocation = DefaultVars.defaultLocation;

    void next() {
      if (formKey.currentState!.validate()) {
        OnCashDeleveryCardForm.addressController;
        OnCashDeleveryCardForm.cityController;
        OnCashDeleveryCardForm.countryCodeController;
        OnCashDeleveryCardForm.detailesController;
        OnCashDeleveryCardForm.phoneNumberController;
        print(selectedLocation);
        ticketPaymentDone(context);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: ColumnPadded(
            gap: Insets.medium,
            children: [
              SizedBox(
                height: 430,
                child: Stack(
                  children: [
                    const OnlinePaymentHead(
                      title: '',
                      imageUrl:
                          'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DrivenToLocation(
                              selectedLocation: (p0) => selectedLocation = p0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const OnCashDeleveryCardForm(),
              GradientBorderButton(onPressed: next, text: 'next'),
              const Gap(Insets.extraLarge * 2),
            ],
          ),
        ),
      ),
    );
  }
}
