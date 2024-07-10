import 'package:app/src/home/google_maps/google_maps.dart';
import 'package:app/src/home/party_detailes/party_detailes.dart';
import 'package:app/src/profile/account_detailes/account_detailes.dart';
import 'package:app/src/profile/add_card/add_card.dart';
import 'package:app/src/profile/ticket_history/ticket_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../src/auth/auth.dart';
import '../src/calender/calender.dart';
import '../src/intro/first.dart';
import '../src/intro/second.dart';
import '../src/tabs/tabs.dart';
import 'routing_animation.dart';

final Provider<GoRouter> routerProvider = Provider((ref) => router);

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: RoutesDocument.home,
      pageBuilder: (context, state) =>
          CustomTransition(state, const TabsPage()),
    ),
    GoRoute(
      path: RoutesDocument.intro1,
      builder: (context, state) => const FirstIntroPage(),
    ),
    GoRoute(
      path: RoutesDocument.intro2,
      builder: (context, state) => const SecondIntroPage(),
    ),
    GoRoute(
      path: RoutesDocument.tabs,
      name: RoutesDocument.tabs,
      pageBuilder: (context, state) =>
          CustomTransition(state, const TabsPage()),
    ),
    GoRoute(
      path: RoutesDocument.calender,
      name: RoutesDocument.calender,
      pageBuilder: (context, state) =>
          CustomTransition(state, const CalenderPage()),
    ),
    GoRoute(
      path: RoutesDocument.partyDetailes,
      name: RoutesDocument.partyDetailes,
      pageBuilder: (context, state) =>
          CustomTransition(state, const PartyDetailesPage()),
    ),
    GoRoute(
      path: RoutesDocument.googleMaps,
      name: RoutesDocument.googleMaps,
      pageBuilder: (context, state) =>
          CustomTransition(state, const GoogleMapsPage()),
    ),
    GoRoute(
      path: RoutesDocument.accountDetailes,
      name: RoutesDocument.accountDetailes,
      pageBuilder: (context, state) =>
          CustomTransition(state, const AccountDetailesPage()),
    ),
    GoRoute(
      path: RoutesDocument.addCard,
      name: RoutesDocument.addCard,
      pageBuilder: (context, state) =>
          CustomTransition(state, const AddCardPage()),
    ),
    GoRoute(
      path: RoutesDocument.ticketHistory,
      name: RoutesDocument.ticketHistory,
      pageBuilder: (context, state) =>
          CustomTransition(state, const TicketHistoryPage()),
    ),
  ],
);

class RoutesDocument {
  const RoutesDocument._();
  static const ticketHistory = '/ticketHistory';
  static const addCard = '/add_card';
  static const accountDetailes = '/accountDetailes';
  static const googleMaps = '/google_maps';
  static const String home = '/';
  static const String login = '/login';
  static const String intro1 = '/intro1';
  static const String intro2 = '/intro2';
  static const String tabs = '/tabs';
  static const String calender = '/calender';
  static const partyDetailes = '/partyDetailes';
}

// Example usage:
// final route = FadeTransitionPage(child: MyWidget());

// Inside your code where you want to navigate:
// context.push(route);
