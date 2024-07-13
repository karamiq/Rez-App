import 'package:app/common_lib.dart';
import 'package:app/src/home/components/party_card.dart';
import 'package:app/src/tabs/components/custom_botton_app_bar.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final searchController = TextEditingController();
  late TabController _tabController;
  final List<Map<String, String>> partyData = [
    {
      'imageUrl':
          'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
      'title': 'Brightlight Music Festival',
      'genre': 'Indie Rock',
      'ticketInfo': '€40 - €90',
    },
    {
      'imageUrl':
          'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
      'title': 'Summer Beach Party',
      'genre': 'Pop',
      'ticketInfo': '€20 - €60',
    }
  ];
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
          Row(
            children: [
              Expanded(
                flex: 3,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.assetsSvgNotification,
                  ),
                ),
              ),
              Expanded(
                  flex: 20,
                  child: GestureDetector(
                    onTap: () => context.pushNamed(RoutesDocument.googleMaps),
                    child: Container(
                      height: 45,
                      padding:
                          const EdgeInsets.symmetric(horizontal: Insets.small),
                      decoration: const BoxDecoration(
                          borderRadius: BorderSize.extraLargeRadius,
                          color: Color.fromARGB(30, 214, 125, 255)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(Assets.assetsSvgSearchNormal),
                          const Gap(4),
                          const Text(
                            'Search',
                            style: TextStyle(
                                color: Color(0xFF472456),
                                fontSize: FontsTheme.mediumSize),
                          )
                        ],
                      ),
                    ),
                  )),
              Expanded(
                flex: 3,
                child: IconButton(
                  onPressed: () => context.pushNamed(RoutesDocument.calender),
                  icon: GradientIcon(
                    icon: Assets.assetsSvgCalendarOutlined,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 16.0), // Add some spacing between the Row and TabBar
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

class AllTab extends StatelessWidget {
  const AllTab({
    super.key,
    required this.partyData,
  });

  final List<Map<String, String>> partyData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(top: Insets.medium),
        itemBuilder: (context, index) => PartyCard(
              imageUrl: partyData[index]['imageUrl']!,
              title: partyData[index]['title']!,
              genre: partyData[index]['genre']!,
              ticketInfo: partyData[index]['ticketInfo']!,
              expiredDate: DateTime.now(),
              isExpired: false,
            ),
        separatorBuilder: (context, index) => const Gap(Insets.medium),
        itemCount: partyData.length);
  }
}
