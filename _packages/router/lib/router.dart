// ignore_for_file: constant_identifier_names

library router;

enum AppPage { HOME, STANDINGS, PROFILE, LOGIN, LEAGUES }

extension AppPageExt on AppPage {
  String get path {
    switch (this) {
      case AppPage.HOME:
        return '/';
      case AppPage.STANDINGS:
        return '/standings';
      case AppPage.PROFILE:
        return '/profile';
      case AppPage.LOGIN:
        return '/auth/login';
      case AppPage.LEAGUES:
        return '/leagues';
    }
  }
}
