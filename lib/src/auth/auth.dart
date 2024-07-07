// ignore_for_file: non_constant_identifier_names
import 'package:app/common_lib.dart';
import 'package:app/src/auth/components/otp.dart';
import 'package:flutter/material.dart';
import '../../utils/components/buttons/gardient_border_button.dart';
import '../../utils/components/custom_scaffold.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  int pageIndex = 0;

  String? validator(String? query) {
    if (query == null || query.isEmpty) {
      return 'Field is required';
    } else if (query.length < 11) {
      return 'Phone number must be at least 11 numbers';
    } else {
      return null;
    }
  }

  void next() {
    if (_formKey.currentState!.validate()) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      pageIndex++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text(pageIndex == 1 ? 'Choose seats' : ''),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: Insets.mediumAll,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            buildFirstPage(),
            const OtpPage(),
          ],
        ),
      ),
    );
  }

  Widget buildFirstPage() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const Gap(Insets.extraLarge * 3),
                  SvgPicture.asset(Assets.assetsSvgWave),
                  const Spacer(),
                  Padding(
                    padding: Insets.mediumAll,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            validator: validator,
                            prefixIcon: const Icon(Icons.phone_outlined),
                            hintText: 'Phone number',
                            controller: phoneNumberController,
                          ),
                          const Gap(Insets.extraLarge),
                          GradientBorderButton(onPressed: next, text: 'Next'),
                          const Gap(Insets.extraLarge),
                        ],
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
