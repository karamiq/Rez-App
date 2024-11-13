import 'package:app/common_lib.dart';
import 'package:app/src/home/components/party_card.dart';
import 'package:app/utils/components/buttons/gardient_button.dart';
import 'package:app/utils/components/custom_app_bar.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../maps/search/components/data_.dart';

class TicketHistoryPage extends StatelessWidget {
  const TicketHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Party> partyList = [
      Party(
        imageUrl:
            'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Party 1',
        genre: 'Electronic',
        ticketInfo: 'VIP Ticket',
        isExpired: true,
        expiredDate: DateTime(2024, 8, 1),
      ),
      Party(
        imageUrl:
            'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Party 2',
        genre: 'Rock',
        ticketInfo: 'General Admission',
        isExpired: true,
        expiredDate: DateTime(2024, 7, 1),
      ),
      Party(
        imageUrl:
            'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Party 3',
        genre: 'Jazz',
        ticketInfo: 'VIP Ticket',
        isExpired: true,
        expiredDate: DateTime(2024, 9, 1),
      ),
      Party(
        imageUrl:
            'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Party 4',
        genre: 'Hip-Hop',
        ticketInfo: 'Early Bird',
        isExpired: true,
        expiredDate: DateTime(2024, 6, 1),
      ),
      Party(
        imageUrl:
            'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Party 5',
        genre: 'Classical',
        ticketInfo: 'General Admission',
        isExpired: true,
        expiredDate: DateTime(2024, 10, 1),
      ),
      Party(
        imageUrl:
            'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Party 6',
        genre: 'Pop',
        ticketInfo: 'VIP Ticket',
        isExpired: true,
        expiredDate: DateTime(2024, 5, 1),
      ),
      Party(
        imageUrl:
            'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Party 7',
        genre: 'Reggae',
        ticketInfo: 'Early Bird',
        isExpired: true,
        expiredDate: DateTime(2024, 11, 1),
      ),
    ];

    return CustomScaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            toolbarHeight: 72,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
              child: CustomAppBar(
                gradientColor: GradientColor.pink,
                title: 'Ticket Archive',
                showCalender: false,
              ),
            ),
          ),
        ],
        body: Padding(
          padding: Insets.mediumAll,
          child: ListView.separated(
            itemBuilder: (context, index) {
              final party = partyList[index];
              return PartyCard(
                type: 'stadium',
                imageUrl: party.imageUrl,
                title: party.title,
                genre: party.genre,
                ticketInfo: party.ticketInfo,
                isExpired: party.isExpired,
                expiredDate: party.expiredDate,
              );
            },
            separatorBuilder: (context, index) => const Gap(Insets.medium),
            itemCount: partyList.length,
          ),
        ),
      ),
    );
  }
}
