import 'dart:async';
import 'package:app/utils/components/buttons/gardient_button.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../common_lib.dart';
import '../../../utils/components/custom_app_bar.dart';
import 'qr_code_and_date.dart';
import 'ticket_count_down.dart';
import 'ticket_painter.dart';
import 'ticket_shape.dart';

class AvalilableTicketsPage extends StatefulWidget {
  const AvalilableTicketsPage({super.key});

  @override
  createState() => _AvalilableTicketsPageState();
}

class _AvalilableTicketsPageState extends State<AvalilableTicketsPage> {
  DateTime startDate = DateTime(2024, 3, 2);
  DateTime endDate = DateTime(2024, 3, 9);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: Insets.mediumAll,
      body: Column(
        children: [
          ColumnPadded(
            gap: Insets.medium,
            children: [
              CustomAppBar(
                title: 'title',
                gradientColor: GradientColor.pink,
                showCalender: false,
              ),
              const TicketCountdown(
                initialDuration: Duration(hours: 4),
                description:
                    'please pay at the cash point and it\nwill be activated',
                imageUrl:
                    'https://staticg.sportskeeda.com/editor/2022/03/d975d-16474074573617-1920.jpg',
              ),
              const TicketClipShape(
                imageUrl:
                    'https://staticg.sportskeeda.com/editor/2022/03/d975d-16474074573617-1920.jpg',
                child: Text(
                  'Wait For the Driver',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontsTheme.bigWeight,
                      fontSize: FontsTheme.mediumVeryBigSize),
                ),
              ),
              QrcodeAndDate(
                  qrData: 'I want to die but its haram',
                  imageUrl:
                      'https://staticg.sportskeeda.com/editor/2022/03/d975d-16474074573617-1920.jpg',
                  startDate: startDate,
                  endDate: endDate),
            ],
          )
        ],
      ),
    );
  }
}
