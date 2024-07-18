import 'package:app/common_lib.dart';
import 'package:app/src/home/components/party_card.dart';
import 'package:app/src/maps/search/searching_map.dart/searching_map.dart';
import 'package:app/src/ticket/components/tickets_empty_state.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../profile/ticket_history/ticket_history.dart';
import '../components/data_.dart';
import '../components/search_head.dart';

class searchingOfMapPage extends StatefulWidget {
  const searchingOfMapPage({super.key});

  @override
  State<searchingOfMapPage> createState() => _searchingOfMapPageState();
}

class _searchingOfMapPageState extends State<searchingOfMapPage> {
  final searchController = TextEditingController();
  List<Party> filteredList = [];
  void filtering(String? query) {}

  @override
  void initState() {
    filteredList = searchparties.toList();
    super.initState();
  }

  void _filterCountries(String query) {
    setState(() {
      filteredList = searchparties
          .toList()
          .where((party) =>
              party.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      print(filteredList);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      safeArea: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: SearchMapHead(
        controller: searchController,
        onChanged: _filterCountries,
        route: false,
        readOnly: false,
      ),
      body: filteredList.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: Insets.extraLarge * 3),
              child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) => Padding(
                        padding: Insets.mediumAll,
                        child: PartyCard(
                            imageUrl: filteredList.elementAt(index).imageUrl,
                            title: filteredList.elementAt(index).title,
                            genre: filteredList.elementAt(index).genre,
                            ticketInfo:
                                filteredList.elementAt(index).ticketInfo,
                            isExpired: filteredList.elementAt(index).isExpired,
                            expiredDate:
                                filteredList.elementAt(index).expiredDate,
                            type: filteredList.elementAt(index).title),
                      )))
          : const TicketsEmptyState(
              title: 'Tickets',
              subtitle: 'Please search for something else',
              populers: [
                {'noor alzayn': 'noor alzayn'},
                {'Concert': 'Concert'},
                {'Jazz': 'Jazz'},
              ],
              appearPopuler: false,
            ),
    );
  }
}
