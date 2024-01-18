import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core.dart';

/// {@template app_theme}
/// The Default App [ThemeData].
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// Default `ThemeData` for App UI.
  ThemeData get themeData {
    return ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: _colorScheme,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      buttonTheme: _buttonTheme,
      splashColor: AppColors.transparent,
      snackBarTheme: _snackBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      bottomSheetTheme: _bottomSheetTheme,
      listTileTheme: _listTileTheme,
      switchTheme: _switchTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      tabBarTheme: _tabBarTheme,
      bottomNavigationBarTheme: _bottomAppBarTheme,
      chipTheme: _chipTheme,
      badgeTheme: _badgeTheme,
      fontFamily: GoogleFonts.taviraj().fontFamily,
    );
  }

  ColorScheme get _colorScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      background: _backgroundColor,
    );
  }

  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      contentTextStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      actionTextColor: AppColors.lightBlue.shade300,
      backgroundColor: AppColors.black,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }

  Color get _backgroundColor => AppColors.bg200;

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: _iconTheme,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 64,
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(
      color: AppColors.text100,
    );
  }

  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: AppColors.outlineLight,
      space: AppSpacing.lg,
      thickness: AppSpacing.xxxs,
      indent: AppSpacing.lg,
      endIndent: AppSpacing.lg,
    );
  }

  TextTheme get _textTheme => uiTextTheme;

  /// The Content text theme based on [ContentTextStyle].
  static final contentTextTheme = TextTheme(
    displayLarge: ContentTextStyle.headline1,
    displayMedium: ContentTextStyle.headline2,
    displaySmall: ContentTextStyle.headline3,
    headlineMedium: ContentTextStyle.headline4,
    headlineSmall: ContentTextStyle.headline5,
    titleLarge: ContentTextStyle.headline6,
    titleMedium: ContentTextStyle.subtitle1,
    titleSmall: ContentTextStyle.subtitle2,
    bodyLarge: ContentTextStyle.bodyText1,
    bodyMedium: ContentTextStyle.bodyText2,
    labelLarge: ContentTextStyle.button,
    bodySmall: ContentTextStyle.caption,
    labelSmall: ContentTextStyle.overline,
  ).apply(
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
    decorationColor: AppColors.black,
  );

  /// The UI text theme based on [UITextStyle].
  static final uiTextTheme = TextTheme(
    displayLarge: UITextStyle.headline1,
    displayMedium: UITextStyle.headline2,
    displaySmall: UITextStyle.headline3,
    headlineMedium: UITextStyle.headline4,
    headlineSmall: UITextStyle.headline5,
    titleLarge: UITextStyle.headline6,
    titleMedium: UITextStyle.subtitle1,
    titleSmall: UITextStyle.subtitle2,
    bodyLarge: UITextStyle.bodyText1,
    bodyMedium: UITextStyle.bodyText2,
    labelLarge: UITextStyle.button,
    bodySmall: UITextStyle.caption,
    labelSmall: UITextStyle.overline,
  ).apply(
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
    decorationColor: AppColors.black,
  );

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      suffixIconColor: AppColors.mediumEmphasisSurface,
      prefixIconColor: AppColors.mediumEmphasisSurface,
      hoverColor: AppColors.inputHover,
      focusColor: AppColors.inputFocused,
      fillColor: AppColors.inputEnabled,
      enabledBorder: _textFieldBorder,
      focusedBorder: _textFieldBorder,
      disabledBorder: _textFieldBorder,
      hintStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.mediumEmphasisSurface,
      ),
      contentPadding: const EdgeInsets.all(AppSpacing.lg),
      border: const UnderlineInputBorder(),
      filled: true,
      isDense: true,
      errorStyle: UITextStyle.caption,
    );
  }

  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        textStyle: _textTheme.labelLarge,
        backgroundColor: AppColors.blue,
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _textTheme.labelLarge?.copyWith(
          fontWeight: AppFontWeight.light,
        ),
        foregroundColor: AppColors.black,
      ),
    );
  }

  BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: AppColors.modalBackground,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.lg),
          topRight: Radius.circular(AppSpacing.lg),
        ),
      ),
    );
  }

  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: AppColors.onBackground,
      contentPadding: EdgeInsets.all(AppSpacing.lg),
    );
  }

  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.darkAqua;
        }
        return AppColors.eerieBlack;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary300;
        }
        return AppColors.paleSky;
      }),
    );
  }

  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: AppColors.darkAqua,
      circularTrackColor: AppColors.borderOutline,
    );
  }

  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: UITextStyle.button,
      labelColor: AppColors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md + AppSpacing.xxs,
      ),
      unselectedLabelStyle: UITextStyle.button,
      unselectedLabelColor: AppColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: AppColors.darkAqua,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  BadgeThemeData get _badgeTheme => const BadgeThemeData(
        backgroundColor: AppColors.primary200,
      );
}

InputBorder get _textFieldBorder => const UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: AppColors.darkAqua,
      ),
    );

BottomNavigationBarThemeData get _bottomAppBarTheme {
  return BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.primary200,
    unselectedItemColor: AppColors.primary,
    selectedLabelStyle: UITextStyle.bodyText2.copyWith(
      fontWeight: FontWeight.w700,
    ),
    unselectedLabelStyle: UITextStyle.bodyText2,
  );
}

ChipThemeData get _chipTheme {
  return const ChipThemeData(
    backgroundColor: AppColors.transparent,
  );
}

/// {@template app_dark_theme}
/// Dark Mode App [ThemeData].
/// {@endtemplate}
class AppDarkTheme extends AppTheme {
  /// {@macro app_dark_theme}
  const AppDarkTheme();

  @override
  ColorScheme get _colorScheme {
    return const ColorScheme.dark().copyWith(
      primary: AppColors.white,
      secondary: AppColors.secondary,
      background: AppColors.grey.shade900,
    );
  }

  @override
  TextTheme get _textTheme {
    return AppTheme.contentTextTheme.apply(
      bodyColor: AppColors.white,
      displayColor: AppColors.white,
      decorationColor: AppColors.white,
    );
  }

  @override
  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      contentTextStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.black,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      actionTextColor: AppColors.lightBlue.shade300,
      backgroundColor: AppColors.grey.shade300,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }

  @override
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _textTheme.labelLarge?.copyWith(
          fontWeight: AppFontWeight.light,
        ),
        foregroundColor: AppColors.white,
      ),
    );
  }

  @override
  Color get _backgroundColor => AppColors.grey.shade900;

  @override
  IconThemeData get _iconTheme {
    return const IconThemeData(color: AppColors.white);
  }

  @override
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: AppColors.onBackground,
      space: AppSpacing.lg,
      thickness: AppSpacing.xxxs,
      indent: AppSpacing.lg,
      endIndent: AppSpacing.lg,
    );
  }
}

// abstract class AppTheme {
//   // This theme was made for FlexColorScheme version 6.1.1. Make sure
// // you use same or higher version, but still same major version. If
// // you use a lower version, some properties may not be supported. In
// // that case you can also remove them after copying the theme to your app.
//   static final lightTheme = FlexThemeData.light(
//     colors: const FlexSchemeColor(
//       primary: AppColors.primary,
//       secondary: AppColors.secondary,
//       tertiary: AppColors.tertiary,
//       error: AppColors.orange,
//     ),
//     surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
//     scaffoldBackground: AppColors.bg100,
//     appBarBackground: AppColors.bg100,
//     surface: AppColors.bg100,
//     blendLevel: 9,
//     subThemesData: FlexSubThemesData(
//       useTextTheme: true,
//       bottomSheetRadius: 20.r,
//       defaultRadius: 8.r,
//       adaptiveRadius: const FlexAdaptive.all(),
//       defaultRadiusAdaptive: 8.r,
//       appBarBackgroundSchemeColor: SchemeColor.inversePrimary,
//       appBarCenterTitle: true,
//       bottomSheetModalBackgroundColor: SchemeColor.surface,
//       bottomSheetBackgroundColor: SchemeColor.surface,
//       dialogBackgroundSchemeColor: SchemeColor.onTertiary,
//       dialogRadius: 8.r,
//       snackBarBackgroundSchemeColor: SchemeColor.secondary,
//       snackBarActionSchemeColor: SchemeColor.background,
//       snackBarElevation: 8,
//       buttonMinSize: const Size.fromHeight(48),
//       outlinedButtonRadius: 8.r,
//       // outlinedButtonTextStyle: MaterialStateProperty.all(
//       //   TextStyle(
//       //     fontSize: 18.sp,
//       //     fontWeight: FontWeight.w600,
//       //     letterSpacing: .15,
//       //     color: AppColors.bg300,
//       //   ),
//       // ),
//       outlinedButtonBorderWidth: 1.w,
//       filledButtonRadius: 8.r,
//       // filledButtonTextStyle: MaterialStateProperty.all(TextStyle(
//       //   fontSize: 18.sp,
//       //   fontWeight: FontWeight.w600,
//       //   letterSpacing: .15,
//       //   color: AppColors.bg300,
//       // )),
//       filledButtonSchemeColor: SchemeColor.inverseSurface,
//       elevatedButtonRadius: 8.r,
//       // elevatedButtonTextStyle: MaterialStateProperty.all(
//       //   TextStyle(
//       //     fontSize: 18.sp,
//       //     fontWeight: FontWeight.w600,
//       //     letterSpacing: .15,
//       //     color: AppColors.bg300,
//       //   ),
//       // ),
//       elevatedButtonSchemeColor: SchemeColor.inverseSurface,
//       outlinedButtonOutlineSchemeColor: SchemeColor.secondary,
//       outlinedButtonSchemeColor: SchemeColor.secondary,
//       adaptiveSplash: const FlexAdaptive.all(),
//       splashType: FlexSplashType.inkSparkle,
//       splashTypeAdaptive: FlexSplashType.inkSparkle,
//     ),
//     useMaterial3: true,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     swapLegacyOnMaterial3: true,
//     // To use the playground font, add GoogleFonts package and uncomment
//     fontFamily: GoogleFonts.raleway().fontFamily,
//   );
//   static final darkTheme = FlexThemeData.dark(
//     colors: const FlexSchemeColor(
//       primary: AppColors.primary,
//       secondary: AppColors.secondary,
//       error: AppColors.error,
//     ),
//     surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
//     scaffoldBackground: AppColors.black900,
//     appBarBackground: AppColors.black900,
//     surface: AppColors.black900,
//     blendLevel: 9,
//     subThemesData: const FlexSubThemesData(useTextTheme: true),
//     useMaterial3: true,
//     useMaterial3ErrorColors: true,
//     // visualDensity: FlexColorScheme.comfortablePlatformDensity,
//     // To use the playground font, add GoogleFonts package and uncomment
//     fontFamily: GoogleFonts.jost().fontFamily,
//   );
// // If you do not have a themeMode switch, uncomment this line
// // to let the device system mode control the theme mode:
// // themeMode: ThemeMode.system,
// }
