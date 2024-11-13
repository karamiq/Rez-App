import 'package:app/common_lib.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/tickets_empty_state.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> titles = [
      {'noor alzayn': 'the id for it'},
      {'Concert': 'the id for it'},
      {'Jazz': 'the id for it'}
    ];
    List tickets = [];
    return CustomScaffold(
        padding: tickets.isEmpty ? null : Insets.mediumAll,
        safeArea: tickets.isEmpty ? false : true,
        body: tickets.isEmpty
            ? TicketsEmptyState(
                populers: titles,
                title: 'No Tickets Bought',
                subtitle:
                    'It appears you haven’t bought any tickets yet. Maybe try these?',
                appearPopuler: true,
              )
            : ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => const Card(
                  color: ColorsTheme.onCard,
                  child: SizedBox(
                    height: 180,
                    width: 250,
                  ),
                ),
              ));
  }
}
