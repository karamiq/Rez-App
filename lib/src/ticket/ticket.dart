import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          Row(),
          Center(
            child: Text('ticket'),
          ),
        ],
      ),
    );
  }
}
