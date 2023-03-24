import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kapira/presentation/home/home_page.dart';
import 'package:kapira/presentation/main_page.dart';
import 'package:kapira/presentation/profile/profile_page.dart';
import 'package:kapira/presentation/standings/standings_page.dart';
import 'package:router/router.dart';

// GoRouter configuration
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigator,
      builder: (context, state, child) {
        return MainPage(
          key: state.pageKey,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: AppRoute.HOME.path,
          name: AppRoute.HOME.name,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: HomePage(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: AppRoute.STANDINGS.path,
          name: AppRoute.STANDINGS.name,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: StandingsPage(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: AppRoute.PROFILE.path,
          name: AppRoute.PROFILE.name,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ProfilePage(
                key: state.pageKey,
              ),
            );
          },
        ),
      ],
    )
  ],
  initialLocation: AppRoute.HOME.path,
);
