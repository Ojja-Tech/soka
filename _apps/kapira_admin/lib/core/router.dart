import 'package:core/models/league/league.dart';
import 'package:core/models/team/team.dart';
import 'package:go_router/go_router.dart';
import 'package:kapira_admin/view/leagues/leagues_page.dart';
import 'package:kapira_admin/view/login/login_page.dart';
import 'package:kapira_admin/view/players/players_page.dart';
import 'package:kapira_admin/view/teams/teams_page.dart';
import 'package:router/router.dart';

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
  initialLocation: AppRoute.LEAGUES.path,
);
