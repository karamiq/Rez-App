import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../utils/components/custom_item_select.dart';
import '../../../utils/components/input_decoration/ticketing_info.dart';

class OnCashDeleveryCardForm extends StatelessWidget {
  const OnCashDeleveryCardForm({
    super.key,
  });

  static final TextEditingController cityController = TextEditingController();
  static final TextEditingController addressController =
      TextEditingController();
  static final TextEditingController phoneNumberController =
      TextEditingController();
  static final TextEditingController detailesController =
      TextEditingController();
  static final TextEditingController countryCodeController =
      TextEditingController(text: '+964');

  @override
  Widget build(BuildContext context) {
    String? validator(String? query) {
      if (query == null || query.isEmpty) {
        return 'Field required';
      }
      return null;
    }

    return Padding(
      padding: Insets.mediumAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            controller: cityController,
            validator: validator,
            decoration: ticketingInfoDecoration(labelText: 'City'),
          ),
          TextFormField(
            controller: addressController,
            validator: validator,
            decoration: ticketingInfoDecoration(labelText: 'Address'),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomItemSelect(
                    labelText: countryCodeController.text,
                    controller: countryCodeController,
                    itemList: const {
                      'Iraq': '+964',
                      'Kuwait': '+965',
                      'Saudi Arabia': '+966',
                    },
                    validator: validator),
              ),
              const Gap(Insets.medium),
              Expanded(
                flex: 7,
                child: TextFormField(
                  controller: phoneNumberController,
                  validator: validator,
                  decoration:
                      ticketingInfoDecoration(labelText: 'Phone number'),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 7,
            keyboardType: TextInputType.datetime,
            controller: detailesController,
            validator: validator,
            decoration: ticketingInfoDecoration(labelText: 'Detailes'),
          ),
        ],
      ),
    );
  }
}
