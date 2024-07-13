import 'package:app/common_lib.dart';
import 'package:app/utils/components/custom_app_bar.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/empty_state.dart';
import 'components/ticket_painter.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    List tickets = [''];
    return CustomScaffold(
      padding: tickets.isEmpty ? null : Insets.mediumAll,
      safeArea: tickets.isEmpty ? false : true,
      body: tickets.isNotEmpty
          ? Column(
              children: [
                CustomAppBar(
                  title: 'title',
                  showBackButton: false,
                  showCalender: false,
                ),
                const Gap(Insets.extraLarge),
                Container(
                  color: Colors.white,
                  height: 180,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: TicketPainter(),
                    child: SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: Image.asset(
                        Assets.assetsImagesTicketTimerBackground,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const NoTicketsState(),
    );
  }
}
