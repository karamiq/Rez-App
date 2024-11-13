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
                description:
                    'please pay at the cash point and it\nwill be activated',
                imageUrl:
                    'https://s3-alpha-sig.figma.com/img/1543/3cb8/cd926f18468d7804e7dda333397c6d39?Expires=1722211200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=GL3B2JewZCAuSfNd5-4sqP-INvTINa2BlPT-PQZ~tW7VI7H2AnzrLB9XMQFmjkQCoQNzil2v8h59njuSMYLO8ERd96HysZx9ujT4VQpVfz6z8rpz9YXMcBl0HCNyEMlybNo4uCOlj1zeB5F6NiRTxnpPZYLuhBuliea5W8~cJLB7r8ClJEIHBCEplDmY78mDXfUMR7iT7~jXlu9~WGN9ylUnW5jLwRwHQ69ZGsXL4A4w--dgbshnDpI5j8GIG~mok7FafvKabWeeV3oTNtKp~Y~D1IPt93qvLJEzZTS7s-uNMB035WFVq2XqJ1UrDIHRfC~JKDmzb-aj5hudo-40hg__',
              ),
              const TicketClipShape(
                imageUrl:
                    'https://s3-alpha-sig.figma.com/img/1543/3cb8/cd926f18468d7804e7dda333397c6d39?Expires=1722211200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=GL3B2JewZCAuSfNd5-4sqP-INvTINa2BlPT-PQZ~tW7VI7H2AnzrLB9XMQFmjkQCoQNzil2v8h59njuSMYLO8ERd96HysZx9ujT4VQpVfz6z8rpz9YXMcBl0HCNyEMlybNo4uCOlj1zeB5F6NiRTxnpPZYLuhBuliea5W8~cJLB7r8ClJEIHBCEplDmY78mDXfUMR7iT7~jXlu9~WGN9ylUnW5jLwRwHQ69ZGsXL4A4w--dgbshnDpI5j8GIG~mok7FafvKabWeeV3oTNtKp~Y~D1IPt93qvLJEzZTS7s-uNMB035WFVq2XqJ1UrDIHRfC~JKDmzb-aj5hudo-40hg__',
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
                      'https://s3-alpha-sig.figma.com/img/1543/3cb8/cd926f18468d7804e7dda333397c6d39?Expires=1722211200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=GL3B2JewZCAuSfNd5-4sqP-INvTINa2BlPT-PQZ~tW7VI7H2AnzrLB9XMQFmjkQCoQNzil2v8h59njuSMYLO8ERd96HysZx9ujT4VQpVfz6z8rpz9YXMcBl0HCNyEMlybNo4uCOlj1zeB5F6NiRTxnpPZYLuhBuliea5W8~cJLB7r8ClJEIHBCEplDmY78mDXfUMR7iT7~jXlu9~WGN9ylUnW5jLwRwHQ69ZGsXL4A4w--dgbshnDpI5j8GIG~mok7FafvKabWeeV3oTNtKp~Y~D1IPt93qvLJEzZTS7s-uNMB035WFVq2XqJ1UrDIHRfC~JKDmzb-aj5hudo-40hg__',
                  startDate: startDate,
                  endDate: endDate),
            ],
          )
        ],
      ),
    );
  }
}
