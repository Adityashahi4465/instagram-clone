import 'package:flutter/material.dart';

import 'core/constants/typography.dart';

/// Global reference to application colors.
abstract class AppColors {
  /// Dark color.
  static const dark = Color(0xFF0c1822);

  static const light = Color(0xFFFAFAFA);

  /// Grey background accent.
  static const grey = Color(0xFF262626);

  /// Primary text color
  static const primaryText = Colors.white;

  /// Secondary color.
  static const secondary = Color(0xFF024daa);

  /// Color to use for favorite icons (indicating a like).
  static const like = Colors.red;

  /// Grey faded color.
  static const faded = Color(0xFF3b506a);

  /// Light grey color
  static const lightGrey = Color(0xFFEEEEEE);

  /// Top gradient color used in various UI components.
  static const topGradient = Color(0xFFE60064);

  /// Bottom gradient color used in various UI components.
  static const bottomGradient = Color(0xFFFFB344);
}

/// Global reference to application [TextStyle]s.

/// Global reference to application [TextStyle]s.
abstract class AppTextStyle {
  /// A medium bold text style.
  static const textStyleBoldMedium = Typogaphy.medium;

  /// A bold text style.
  static const textStyleBold = Typogaphy.bold;

  static const textStyleSemiBold = Typogaphy.semiBold;
  static const textStyleRegular = Typogaphy.regular;
  static const textStyleThin = Typogaphy.thin;
  static const textStyleLight = Typogaphy.light;

  /// A faded text style. Uses [AppColors.faded].
  static const textStyleFaded =
      TextStyle(color: AppColors.faded, fontWeight: FontWeight.w400);

  /// A faded text style. Uses [AppColors.faded].
  static const textStyleFadedSemiBold = Typogaphy.semiBold;

  /// Action text
  static const textStyleAction = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.secondary,
  );
}

/// Global reference to the application theme.
class AppTheme {
  final _darkBase = ThemeData.dark();
  final _lightBase = ThemeData.light();

  ThemeData get darkTheme => _darkBase.copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.dark,
        appBarTheme: _darkBase.appBarTheme.copyWith(
          backgroundColor: AppColors.dark,
          foregroundColor: AppColors.light,
          iconTheme: const IconThemeData(color: AppColors.light),
          elevation: 0,
        ),
        bottomNavigationBarTheme: _darkBase.bottomNavigationBarTheme.copyWith(
          backgroundColor: AppColors.dark,
          selectedItemColor: AppColors.light,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: AppColors.grey,
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.light,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.dark,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.grey,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: AppTextStyle.textStyleFadedSemiBold,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.faded,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.faded,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade50,
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.primaryText,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.grey,
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              AppTextStyle.textStyleSemiBold.copyWith(
                color: AppColors.primaryText,
                fontSize: 16,
              ),
            ),
          ),
        ),
        brightness: Brightness.dark,
        colorScheme: _darkBase.colorScheme
            .copyWith(secondary: AppColors.secondary)
            .copyWith(background: AppColors.dark),
      );

  ThemeData get lightTheme => _lightBase.copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.light,
        appBarTheme: _lightBase.appBarTheme.copyWith(
          backgroundColor: AppColors.light,
          foregroundColor: AppColors.dark,
          iconTheme: const IconThemeData(color: AppColors.dark),
          elevation: 0,
        ),
        bottomNavigationBarTheme: _lightBase.bottomNavigationBarTheme.copyWith(
          backgroundColor: AppColors.light,
          selectedItemColor: AppColors.dark,
        ),
        snackBarTheme:
            _lightBase.snackBarTheme.copyWith(backgroundColor: AppColors.dark),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: AppColors.lightGrey,
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.dark,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.light,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.lightGrey,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: AppTextStyle.textStyleFadedSemiBold,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.faded,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.dark,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade600,
              width: 1.3,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.primaryText,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.lightGrey,
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              Typogaphy.semiBold.copyWith(
                color: AppColors.primaryText,
                fontSize: 16,
              ),
            ),
          ),
        ),
        brightness: Brightness.light,
        colorScheme: _lightBase.colorScheme
            .copyWith(secondary: AppColors.secondary)
            .copyWith(background: AppColors.light),
      );
}
