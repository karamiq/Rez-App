import 'package:app/src/intro/first.dart';
import 'package:app/src/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../src/auth/auth.dart';
import '../src/intro/second.dart';

final Provider<GoRouter> routerProvider = Provider((ref) => router);

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutesDocument.home,
      builder: (context, state) => const FirstIntroPage(),
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
      builder: (context, state) => const TabsPage(),
    ),
  ],
);

class RoutesDocument {
  const RoutesDocument._();
  static const String home = '/';
  static const String login = '/login';
  static const intro1 = '/intro1';
  static const intro2 = '/intro2';
  static const tabs = '/tabs';

  // // Product
  // static String productDetails(String id) => 'product-details/$id';
}

  // final encodedItemId = getEncodedComponent(item.id);
  // context.push(
  //     "${RoutesDocument.pharmacyHome}/${RoutesDocument.productDetails(encodedItemId)}");
