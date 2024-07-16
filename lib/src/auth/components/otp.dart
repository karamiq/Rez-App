import 'package:app/common_lib.dart';
import 'package:app/src/intro/first.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../router/routing_animation.dart';
import '../../../utils/components/buttons/gardient_border_button.dart';
import '../../../utils/components/custom_app_bar.dart';

class OtpPage extends StatelessWidget {
  const OtpPage(
      {super.key, required this.phoneNumber, required this.pageController});
  final TextEditingController phoneNumber;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final code = '11111';

    String? validator(String? query) {
      if (query == null || query.isEmpty) {
        return 'Field is required';
      } else if (query != code) {
        return 'Wrong';
      } else {
        return null;
      }
    }

    void next() {
      if (formKey.currentState!.validate()) {
        context.goNamed(RoutesDocument.tabs);
        // context.go(RoutesDocument.intro);
      }
    }

    return SafeArea(
      child: Padding(
        padding: Insets.mediumAll,
        child: Column(
          children: [
            CustomAppBar(
                onBackPressed: () => pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                title: 'Choose seats',
                showCalender: false),
            const Spacer(),
            Text(
              '+964 ${phoneNumber.text.substring(1)}',
              style: TextStyle(
                fontWeight: FontsTheme.mediumWeight,
                fontSize: FontsTheme.bigSize,
                fontFamily: GoogleFonts.cairo().fontFamily,
              ),
            ),
            Text(
              'Write the OTP have been sent to your phone number',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontsTheme.mediumSize,
                fontFamily: GoogleFonts.cairo().fontFamily,
              ),
            ),
            const Gap(Insets.extraLarge * 2),
            Form(
              key: formKey,
              child: Pinput(
                validator: validator,
                length: 5,
                cursor: Container(
                  height: 25,
                  width: 1.5,
                  color: ColorsTheme.border,
                ),
                focusedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderSize.smallRadius,
                    border: Border.all(color: ColorsTheme.border),
                    color: ColorsTheme.backGround,
                  ),
                ),
                errorPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderSize.mediumRadius,
                    border: Border.all(
                      width: .5,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                ),
                defaultPinTheme: const PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderSize.smallRadius,
                    color: ColorsTheme.onBackground,
                  ),
                ),
              ),
            ),
            const Gap(Insets.small),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t receive the OTP?',
                  style: TextStyle(
                    fontFamily: GoogleFonts.cairo().fontFamily,
                    fontSize: FontsTheme.smallSize,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print('send again');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColorDark,
                    minimumSize: const Size(40, 40),
                  ),
                  child: Text(
                    'Resend',
                    style: TextStyle(
                      color: ColorsTheme.lightBorder,
                      fontSize: FontsTheme.smallSize,
                      fontFamily: GoogleFonts.cairo().fontFamily,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(Insets.extraLarge * 5),
            const Spacer(),
            GradientBorderButton(onPressed: next, text: 'Next'),
            const Gap(Insets.extraLarge),
          ],
        ),
      ),
    );
  }
}
