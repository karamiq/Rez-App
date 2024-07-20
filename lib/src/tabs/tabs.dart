import 'package:app/src/home/home_page/home_page.dart';
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
      pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      const TicketPage(),
      const LikesPage(),
      const ProfilePage(),
    ];
  }

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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        switchInCurve: Curves.decelerate,
        switchOutCurve: Curves.decelerate,
        child: _pages[pageIndex],
      ),
    );
  }
}
