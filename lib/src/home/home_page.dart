import 'package:app/common_lib.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
          const Row(
            children: [
              Expanded(child: Icon(Icons.abc)),
              Expanded(flex: 11, child: TextField()),
              Expanded(child: Icon(Icons.abc)),
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
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
              Tab(text: 'Tab 4'),
              Tab(text: 'Tab 5'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.separated(
                    padding: const EdgeInsets.only(top: Insets.medium),
                    itemBuilder: (context, index) => Container(
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderSize.smallRadius),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Colors.black.withOpacity(.9),
                              Colors.black.withOpacity(.9)
                            ])),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderSize.smallRadius,
                                  child: Image.network(
                                      fit: BoxFit.cover,
                                      height: double.infinity,
                                      width: double.infinity,
                                      'https://www.shutterstock.com/shutterstock/photos/310965713/display_1500/stock-photo-the-rocky-shore-or-beach-andaman-sea-thailand-310965713.jpg'),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.dangerous),
                                    onPressed: () {},
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Brightlight Music Festival',
                                        style: TextStyle(
                                            fontSize: FontsTheme.mediumBigSize),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.music_note),
                                          Text('Indie Rock')
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) =>
                        const Gap(Insets.small),
                    itemCount: 6),
                const Center(child: Text('Content for Tab 2')),
                const Center(child: Text('Content for Tab 3')),
                const Center(child: Text('Content for Tab 4')),
                const Center(child: Text('Content for Tab 5')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
