import 'package:app/common_lib.dart';
import 'package:app/src/tabs/components/custom_botton_app_bar.dart';
import 'package:app/utils/components/custom_app_bar.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:app/utils/components/gardient/gardient_text.dart';
import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/components/buttons/gardient_border_button.dart';
import '../../../../utils/components/buttons/gardient_button.dart';
import '../../../../utils/components/custom_info_text_form_field.dart';
import 'components/card_added_dialog.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final _formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  final cardholderNameController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();
  bool isCheckboxChecked = false;
  bool checkboxError = false;

  void checkValidation() {
    setState(() {
      checkboxError = !isCheckboxChecked;
    });
    if (_formKey.currentState!.validate() && isCheckboxChecked) {
      CardAdded(context);
    }
  }

  String? validator(String? query) {
    if (query == null || query.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    cardholderNameController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: Insets.mediumAll,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GradientBackButton(
              gradientColor: GradientColor.pink,
            ),
            const Gap(Insets.extraLarge),
            const Text(
              'Card number',
              style: TextStyle(
                fontWeight: FontsTheme.mediumBigWeight,
                color: ColorsTheme.cyan,
                fontSize: FontsTheme.mediumSize,
              ),
            ),
            const Gap(Insets.small),
            CustomInfoTextFormField(
              controller: cardNumberController,
              validator: validator,
              labelText: '1234 - 5678 - 1234 - 5678',
            ),
            const Gap(Insets.small),
            const Text(
              'Cardholder name',
              style: TextStyle(
                fontWeight: FontsTheme.mediumBigWeight,
                color: ColorsTheme.cyan,
                fontSize: FontsTheme.mediumSize,
              ),
            ),
            const Gap(Insets.small),
            CustomInfoTextFormField(
              controller: cardholderNameController,
              validator: validator,
              labelText: 'Prince',
            ),
            const Gap(Insets.small),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Expiry date',
                        style: TextStyle(
                          fontWeight: FontsTheme.mediumBigWeight,
                          color: ColorsTheme.cyan,
                          fontSize: FontsTheme.mediumSize,
                        ),
                      ),
                      const Gap(Insets.small),
                      CustomInfoTextFormField(
                        controller: expiryDateController,
                        validator: validator,
                        labelText: '07 / 2027',
                      ),
                    ],
                  ),
                ),
                const Gap(Insets.extraLarge),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CVV/CVC',
                        style: TextStyle(
                          fontWeight: FontsTheme.mediumBigWeight,
                          color: ColorsTheme.cyan,
                          fontSize: FontsTheme.mediumSize,
                        ),
                      ),
                      const Gap(Insets.small),
                      CustomInfoTextFormField(
                        controller: cvvController,
                        validator: validator,
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
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox.adaptive(
                  value: isCheckboxChecked,
                  activeColor: ColorsTheme.secondary,
                  side: BorderSide(color: ColorsTheme.indego),
                  onChanged: (value) {
                    setState(() {
                      isCheckboxChecked = value!;
                      checkboxError = !isCheckboxChecked;
                    });
                  },
                ),
                const Text(
                  'Agree to terms and conditions',
                  style: TextStyle(color: ColorsTheme.indego),
                ),
              ],
            ),
            if (checkboxError)
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'You must agree to terms and conditions',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            const Spacer(),
            GradientBorderButton(onPressed: checkValidation, text: 'Save card'),
          ],
        ),
      ),
    );
  }
}
