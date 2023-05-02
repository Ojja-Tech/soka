import 'package:core/models/league/league.dart';
import 'package:core/models/team/team.dart';
import 'package:go_router/go_router.dart';
import 'package:router/router.dart';

import '../view/leagues/leagues_page.dart';
import '../view/login/login_page.dart';
import '../view/players/players_page.dart';
import '../view/teams/teams_page.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoute.LOGIN.path,
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoute.LEAGUES.path,
      builder: (_, __) => const LeaguesPage(),
    ),
    GoRoute(
      path: AppRoute.TEAMS.path,
      builder: (_, state) => TeamsPage(
        league: state.extra! as League,
      ),
    ),
    GoRoute(
      path: AppRoute.PLAYERS.path,
      builder: (_, state) => PlayersPage(
        team: state.extra! as Team,
      ),
    ),
  ],
  initialLocation: AppRoute.LOGIN.path,
);
