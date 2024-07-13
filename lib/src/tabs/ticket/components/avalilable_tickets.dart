import 'package:app/utils/components/buttons/gardient_button.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../common_lib.dart';
import '../../../../utils/components/custom_app_bar.dart';
import 'ticket_painter.dart';

class AvalilableTicketsPage extends StatelessWidget {
  const AvalilableTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('width: ${MediaQuery.of(context).size.width - 20}');
    print('height: ${MediaQuery.of(context).size.height}');
    return CustomScaffold(
      padding: Insets.mediumAll,
      body: Column(
        children: [
          Column(
            children: [
              CustomAppBar(
                title: 'title',
                gradientColor: GradientColor.pink,
                showCalender: false,
              ),
              const Gap(Insets.extraLarge),
              ClipPath(
                clipper: TicketPainter(),
                child: Container(
                  color: ColorsTheme.secondary,
                  height: 180,
                  width: double.infinity,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
