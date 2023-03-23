// ignore_for_file: constant_identifier_names

library router;

enum AppPage {
  HOME('/'),
  STANDINGS('/standings'),
  PROFILE('/profile'),
  LOGIN('/auth/login'),
  LEAGUES('/leagues');

  final String path;

  const AppPage(this.path);
}
