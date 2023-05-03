part of 'core.dart';

extension ThemeBuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  // Primary Color
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  // Primary Color
  Color get primary => theme.primary;

  // Secondary/Accent Color
  Color get secondary => theme.colorScheme.secondary;

  // Formerly Secondary Color
  Color get tertiary => theme.colorScheme.secondaryContainer;

  // Background Color
  Color get background => theme.colorScheme.background;

  // Scaffold color
  Color get scaffoldColor => theme.scaffoldBackgroundColor;

  // Foreground color
  Color get onBackground => theme.onBackground;

  // If brightness dark
  bool get isDark => theme.brightness == Brightness.dark;

  // Color scheme
  ColorScheme get scheme => theme.colorScheme;

  KapiraTheme get kTheme => theme.kTheme;

  // Text themes
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelSmall => textTheme.labelSmall;
}

extension ThemeX on ThemeData {
  KapiraTheme get kTheme => extension<KapiraTheme>()!;

  // Primary Color
  Color get primary => colorScheme.primary;

  // Foreground color
  Color get onBackground => colorScheme.onBackground;

  // Scaffold color
  Color get scaffoldColor => scaffoldBackgroundColor;
}
