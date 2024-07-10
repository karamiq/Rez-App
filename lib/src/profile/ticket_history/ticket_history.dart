import 'package:app/common_lib.dart';
import 'package:app/utils/components/buttons/gardient_button.dart';
import 'package:app/utils/components/custom_app_bar.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

class TicketHistoryPage extends StatelessWidget {
  const TicketHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: Insets.mediumAll,
      body: Column(
        children: [
          CustomAppBar(
            gradientColor: GradientColor.pink,
            title: 'Ticket Archive',
            showCalender: false,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const Gap(Insets.medium),
              separatorBuilder: (context, index) => const Gap(Insets.medium),
              itemCount: 7)
        ],
      ),
    );
  }
}
