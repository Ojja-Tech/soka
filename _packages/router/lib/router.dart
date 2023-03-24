// ignore_for_file: constant_identifier_names

library router;

enum AppRoute {
  HOME('/'),
  STANDINGS('/standings'),
  PROFILE('/profile'),
  LOGIN('/auth/login'),
  TEAMS('/teams'),
  PLAYERS('/players'),
  LEAGUES('/leagues');

  final String path;

  const AppRoute(this.path);
}
