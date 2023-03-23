part of '../core.dart';

extension InputX on ThemeData {
  ThemeData themeInputs() {
    return copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(color: colorScheme.surface),
        filled: true,
        fillColor: kTheme.backgroundColor,
        focusColor: kTheme.secondary0,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: .5,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(kTheme.smallBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kTheme.secondary2,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(kTheme.smallBorderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(kTheme.smallBorderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(kTheme.smallBorderRadius),
        ),
        contentPadding: const EdgeInsets.all(10.0),
      ),
    );
  }
}
