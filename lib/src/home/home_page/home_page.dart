import 'package:app/common_lib.dart';
import 'package:app/data/providers/location.dart';
import 'package:app/src/home/components/party_card.dart';
import 'package:app/src/maps/search/components/search_head.dart';
import 'package:app/src/tabs/components/custom_botton_app_bar.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:app/utils/components/gardient/custom_svg_style.dart';
import 'package:flutter/material.dart';

import '../../maps/search/components/data_.dart';
import '../components/all_tabs.dart';
import '../components/home_page_head.dart';

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
          const Gap(Insets.small),
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
                AllTab(partyData: searchparties.toList()),
                AllTab(partyData: searchparties.toList()),
                AllTab(partyData: searchparties.toList()),
                AllTab(partyData: searchparties.toList()),
                AllTab(partyData: searchparties.toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
