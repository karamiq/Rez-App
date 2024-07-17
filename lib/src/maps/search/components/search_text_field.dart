import 'package:flutter/material.dart';

import '../../../../common_lib.dart';

class SearchBarTextField extends StatelessWidget {
  const SearchBarTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onFieldSubmitted,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function() onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        fillColor: const Color(0x4DD67DFF),
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        prefixIcon: Padding(
          padding: Insets.smallAll,
          child: SvgPicture.asset(
              color: Colors.white, Assets.assetsSvgSearchNormal),
        ),
        border: const OutlineInputBorder(borderRadius: BorderSize.smallRadius),
      ),
      onSubmitted: (value) {
        if (value.isNotEmpty) onFieldSubmitted();
      },
    );
  }
}
