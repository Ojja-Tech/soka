part of 'core.dart';

@immutable
class KapiraTheme extends ThemeExtension<KapiraTheme> {
  // Colors
  final Color primary0;
  final Color primary1;
  final Color secondary0;
  final Color secondary1;
  final Color secondary2;

  // Text Style
  final TextStyle regular;
  final TextStyle medium;
  final TextStyle semiBold;

  const KapiraTheme({
    required this.primary0,
    required this.primary1,
    required this.secondary0,
    required this.secondary1,
    required this.secondary2,
    required this.regular,
    required this.medium,
    required this.semiBold,
  });

  @override
  ThemeExtension<KapiraTheme> copyWith({
    Color? primary0,
    Color? primary1,
    Color? secondary0,
    Color? secondary1,
    Color? secondary2,
    TextStyle? regular,
    TextStyle? medium,
    TextStyle? semiBold,
  }) {
    return KapiraTheme(
      primary0: primary0 ?? this.primary0,
      primary1: primary1 ?? this.primary1,
      secondary0: secondary0 ?? this.secondary0,
      secondary1: secondary1 ?? this.secondary1,
      secondary2: secondary2 ?? this.secondary2,
      regular: regular ?? this.regular,
      medium: medium ?? this.medium,
      semiBold: semiBold ?? this.semiBold,
    );
  }

  @override
  ThemeExtension<KapiraTheme> lerp(
      covariant ThemeExtension<KapiraTheme>? other, double t) {
    if (other is! KapiraTheme) {
      return this;
    }

    return KapiraTheme(
      primary0: Color.lerp(primary0, other.primary0, t) ?? primary0,
      primary1: Color.lerp(primary1, other.primary1, t) ?? primary1,
      secondary0: Color.lerp(secondary0, other.secondary0, t) ?? secondary0,
      secondary1: Color.lerp(secondary1, other.secondary1, t) ?? secondary1,
      secondary2: Color.lerp(secondary2, other.secondary2, t) ?? secondary2,
      regular: TextStyle.lerp(regular, other.regular, t) ?? regular,
      medium: TextStyle.lerp(medium, other.medium, t) ?? medium,
      semiBold: TextStyle.lerp(semiBold, other.semiBold, t) ?? semiBold,
    );
  }

  static const dark = KapiraTheme(
    primary0: Color(0xFF171827),
    primary1: Color(0xFFD2B5FF),
    secondary0: Color(0xFFFFFFFF),
    secondary1: Color(0xFFDADADA),
    secondary2: Color(0xFF797979),
    regular: TextStyle(fontWeight: FontWeight.w400),
    medium: TextStyle(fontWeight: FontWeight.w500),
    semiBold: TextStyle(fontWeight: FontWeight.w600),
  );
}
