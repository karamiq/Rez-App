import 'package:app/src/home/home_page.dart';
import 'package:app/src/likes/likes.dart';
import 'package:app/src/profile/profile.dart';
import 'package:app/src/ticket/ticket.dart';
import 'package:flutter/material.dart';
import 'components/custom_botton_app_bar.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int pageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      // selectedPageIndex = index;
      pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = const [HomePage(), TicketPage(), LikesPage(), ProfilePage()];
  }

  // int selectedPageIndex = 0;
  double slideSize = 0;
  List<Widget> _pages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: CustomBottomAppBar(
        selectedPage: _selectedPage,
        selectedPageIndex: pageIndex,
      ),
      body: SafeArea(child: _pages[pageIndex]),
    );
  }
}
