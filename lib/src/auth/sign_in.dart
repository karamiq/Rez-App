import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';
import '../../utils/components/buttons/gardient_border_button.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController phoneNumberController;
  final GlobalKey<FormState> formKey;
  final String? Function(String?) validator;
  final VoidCallback onNext;

  const SignInPage({
    required this.phoneNumberController,
    required this.formKey,
    required this.validator,
    required this.onNext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  //SvgPicture.asset(Assets.assetsSvgWave),
                  const Spacer(),
                  Padding(
                    padding: Insets.mediumAll,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              keyboardType: TextInputType.phone,
                              validator: validator,
                              prefixIcon: SvgPicture.asset(Assets.assetsSvgCall),
                              hintText: 'Phone number',
                              controller: phoneNumberController,
                            ),
                            const Gap(Insets.extraLarge),
                            GradientBorderButton(onPressed: onNext, text: 'Next'),
                            const Gap(Insets.extraLarge),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
