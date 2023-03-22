// ignore_for_file: constant_identifier_names

library router;

enum AppPage { HOME }

extension AppPageExt on AppPage {
  String get path {
    switch (this) {
      case AppPage.HOME:
        return '/';
    }
  }
}
