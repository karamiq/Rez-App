// ignore_for_file: non_constant_identifier_names
import 'package:app/src/auth/components/otp.dart';
import 'package:flutter/material.dart';
import '../../utils/components/custom_scaffold.dart';
import 'sign_in.dart';

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
      body: PageView(
        padEnds: true,
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SignInPage(
            phoneNumberController: phoneNumberController,
            formKey: _formKey,
            validator: validator,
            onNext: next,
          ),
          OtpPage(
            phoneNumber: phoneNumberController,
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}
