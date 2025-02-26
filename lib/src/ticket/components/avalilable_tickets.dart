import 'package:app/utils/components/buttons/gardient_button.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../utils/components/custom_app_bar.dart';
import 'qr_code_and_date.dart';
import 'ticket_count_down.dart';
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
                description: 'please pay at the cash point and it\nwill be activated',
                imageUrl:
                    'https://npr.brightspotcdn.com/dims4/default/ebb6163/2147483647/strip/true/crop/913x653+0+0/resize/1760x1258!/format/webp/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F67%2Fc4%2F9238fb924af49439dba9c9fa40c6%2Fbadluck-180921-pmb-24.jpg',
              ),
              const TicketClipShape(
                imageUrl:
                    'https://npr.brightspotcdn.com/dims4/default/ebb6163/2147483647/strip/true/crop/913x653+0+0/resize/1760x1258!/format/webp/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F67%2Fc4%2F9238fb924af49439dba9c9fa40c6%2Fbadluck-180921-pmb-24.jpg',
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
                  // imageUrl:
                  //     'https://npr.brightspotcdn.com/dims4/default/ebb6163/2147483647/strip/true/crop/913x653+0+0/resize/1760x1258!/format/webp/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F67%2Fc4%2F9238fb924af49439dba9c9fa40c6%2Fbadluck-180921-pmb-24.jpg',
                  imageUrl:
                      'https://npr.brightspotcdn.com/dims4/default/ebb6163/2147483647/strip/true/crop/913x653+0+0/resize/1760x1258!/format/webp/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F67%2Fc4%2F9238fb924af49439dba9c9fa40c6%2Fbadluck-180921-pmb-24.jpg',
                  startDate: startDate,
                  endDate: endDate),
            ],
          )
        ],
      ),
    );
  }
}
