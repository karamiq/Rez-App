import 'package:flutter/material.dart';

import '../common_lib.dart';

CustomTransitionPage<void> CustomTransition(GoRouterState state, Widget page) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    restorationId: state.pageKey.value,
    child: page,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: page,
    ),
  );
}
