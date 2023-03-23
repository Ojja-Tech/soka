import 'package:go_router/go_router.dart';
import 'package:kapira_admin/presentation/leagues/leagues_page.dart';
import 'package:kapira_admin/presentation/login/login_page.dart';
import 'package:router/router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppPage.LOGIN.path,
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: AppPage.LEAGUES.path,
      builder: (_, __) => const LeaguesPage(),
    ),
  ],
  initialLocation: AppPage.LEAGUES.path,
);
