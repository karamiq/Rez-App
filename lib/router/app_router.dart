import 'package:app/src/auth/auth.dart';
import 'package:app/src/auth/sign_in.dart';
import 'package:app/src/buying/buying1/buying1.dart';
import 'package:app/src/buying/buying2/buying2.dart';
import 'package:app/src/cash_on_delevery/cash_on_delevery.dart';
import 'package:app/src/maps/relocate/relocate.dart';
import 'package:app/src/online_payment/payment1/payment1.dart';
import 'package:app/src/online_payment/payment2/payment2.dart';
import 'package:app/src/online_payment/payment3/qi_card.dart';
import 'package:app/src/maps/search/search.dart';
import 'package:app/src/ticketing_&_detailes/party_detailes.dart';
import 'package:app/src/ticketing_&_detailes/party_detailes_2nd.dart';
import 'package:app/src/intro/fourth.dart';
import 'package:app/src/intro/second.dart';
import 'package:app/src/profile/account_detailes/account_detailes.dart';
import 'package:app/src/profile/add_card/add_card.dart';
import 'package:app/src/profile/ticket_history/ticket_history.dart';
import 'package:app/src/ticket/components/avalilable_tickets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../src/buying/buying3/buying3.dart';
import '../src/home/calender/calender.dart';
import '../src/intro/first.dart';
import '../src/intro/third.dart';
import '../src/tabs/tabs.dart';
import 'routing_animation.dart';

final Provider<GoRouter> routerProvider = Provider((ref) => router);

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  initialLocation: RoutesDocument.intro1,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: RoutesDocument.intro1,
      pageBuilder: (context, state) =>
          customTransition(state, const CashOnDeliveryPage()),
    ),
    GoRoute(
      path: RoutesDocument.intro2,
      pageBuilder: (context, state) =>
          customTransition(state, const SecondIntroPage()),
    ),
    GoRoute(
      path: RoutesDocument.intro3,
      name: RoutesDocument.intro3,
      pageBuilder: (context, state) =>
          customTransition(state, const ThirdIntroPage()),
    ),
    GoRoute(
      path: RoutesDocument.intro4,
      name: RoutesDocument.intro4,
      pageBuilder: (context, state) =>
          customTransition(state, const FourthIntroPage()),
    ),
    GoRoute(
      path: RoutesDocument.tabs,
      name: RoutesDocument.tabs,
      pageBuilder: (context, state) =>
          customTransition(state, const TabsPage()),
    ),
    GoRoute(
      path: RoutesDocument.calender,
      name: RoutesDocument.calender,
      pageBuilder: (context, state) =>
          customTransition(state, const CalenderPage()),
    ),
    GoRoute(
      path: RoutesDocument.partyDetailes,
      name: RoutesDocument.partyDetailes,
      pageBuilder: (context, state) =>
          customTransition(state, const PartyDetailesPage()),
    ),
    GoRoute(
      path: RoutesDocument.googleMaps,
      name: RoutesDocument.googleMaps,
      pageBuilder: (context, state) =>
          customTransition(state, const GoogleMapsPage()),
    ),
    GoRoute(
      path: RoutesDocument.accountDetailes,
      name: RoutesDocument.accountDetailes,
      pageBuilder: (context, state) =>
          customTransition(state, const AccountDetailesPage()),
    ),
    GoRoute(
      path: RoutesDocument.addCard,
      name: RoutesDocument.addCard,
      pageBuilder: (context, state) =>
          customTransition(state, const AddCardPage()),
    ),
    GoRoute(
      path: RoutesDocument.ticketHistory,
      name: RoutesDocument.ticketHistory,
      pageBuilder: (context, state) =>
          customTransition(state, const TicketHistoryPage()),
    ),
    GoRoute(
      path: RoutesDocument.availableTickets,
      name: RoutesDocument.availableTickets,
      pageBuilder: (context, state) =>
          customTransition(state, const AvalilableTicketsPage()),
    ),
    GoRoute(
      path: RoutesDocument.partyDetailes2nd,
      name: RoutesDocument.partyDetailes2nd,
      pageBuilder: (context, state) =>
          customTransition(state, const PartyDetailes2ndPage()),
    ),
    GoRoute(
        path: RoutesDocument.buying1,
        name: RoutesDocument.buying1,
        pageBuilder: (context, state) {
          final bookedSeats = state.uri.queryParameters['bookedSeats'];
          return customTransition(
              state, Buying1stPage(bookedSeats: int.parse(bookedSeats!)));
        }),
    GoRoute(
        path: RoutesDocument.buying2,
        name: RoutesDocument.buying2,
        pageBuilder: (context, state) =>
            customTransition(state, const Buying2ndPage())),
    GoRoute(
        path: RoutesDocument.buying3,
        name: RoutesDocument.buying3,
        pageBuilder: (context, state) =>
            customTransition(state, const Buying3ndPage())),
    GoRoute(
        path: RoutesDocument.cashOnDelevery,
        name: RoutesDocument.cashOnDelevery,
        pageBuilder: (context, state) =>
            customTransition(state, const CashOnDeliveryPage())),
    GoRoute(
        path: RoutesDocument.payment1,
        name: RoutesDocument.payment1,
        pageBuilder: (context, state) =>
            customTransition(state, const Payment1Page())),
    GoRoute(
        path: RoutesDocument.payment2,
        name: RoutesDocument.payment2,
        pageBuilder: (context, state) =>
            customTransition(state, const Payment2Page())),
    GoRoute(
        path: RoutesDocument.payment3,
        name: RoutesDocument.payment3,
        pageBuilder: (context, state) => customTransition(
              duration: Duration.zero,
              state,
              const QiCardPaymentPage(),
            )),
    GoRoute(
        path: RoutesDocument.reLocate,
        name: RoutesDocument.reLocate,
        pageBuilder: (context, state) =>
            customTransition(state, const RelocationPage())),
  ],
);

class RoutesDocument {
  const RoutesDocument._();
  static const reLocate = '/reLocate';
  static const cashOnDelevery = '/CashOnDelevery';
  static const payment3 = '/payment3';
  static const payment2 = '/payment2';
  static const payment1 = '/payment1';
  static const buying3 = '/buying3';
  static const buying2 = '/buying2';
  static const buying1 = '/buying1';
  static const partyDetailes2nd = '/partyDetailes2nd';
  static const ticketHistory = '/ticketHistory';
  static const addCard = '/add_card';
  static const accountDetailes = '/accountDetailes';
  static const googleMaps = '/google_maps';
  static const home = '/';
  static const login = '/login';
  static const intro1 = '/intro1';
  static const intro2 = '/intro2';
  static const intro4 = '/intro4';
  static const intro3 = '/intro3';
  static const tabs = '/tabs';
  static const calender = '/calender';
  static const partyDetailes = '/partyDetailes';
  static const availableTickets = '/availableTickets';
}

// Example usage:
// final route = FadeTransitionPage(child: MyWidget());

// Inside your code where you want to navigate:
// context.push(route);
