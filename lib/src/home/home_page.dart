import 'package:app/common_lib.dart';
import 'package:app/data/providers/location.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'party_detailes/home_page_head.dart';
import 'party_detailes/tabs_screens.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, String>> partyData = [
    {
      'imageUrl':
          'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
      'title': 'Brightlight Music Festival',
      'genre': 'Indie Rock',
      'ticketInfo': '€40 - €90',
      'type': 'ticket'
    },
    {
      'imageUrl':
          'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
      'title': 'Summer Beach Party',
      'genre': 'Pop',
      'ticketInfo': '€20 - €60',
      'type': 'stadium'
    }
  ];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.watch(locationProvider.notifier).getCurrentLocation();
    print(ref.watch(locationProvider));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: Insets.mediumAll,
      body: Column(
        children: [
          const HomePageHead(),
          const SizedBox(height: Insets.medium),
          TabBar(
            labelColor: ColorsTheme.primary,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: ColorsTheme.primary,
            controller: _tabController,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Jazz'),
              Tab(text: 'Music'),
              Tab(text: 'Concert'),
              Tab(text: 'Other'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AllTab(partyData: partyData),
                AllTab(partyData: partyData),
                AllTab(partyData: partyData),
                AllTab(partyData: partyData),
                AllTab(partyData: partyData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
