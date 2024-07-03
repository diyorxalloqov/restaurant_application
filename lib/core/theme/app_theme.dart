import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/assets/app_colors.dart';
import 'package:restaurant_app/core/constants/assets/app_fontfamily.dart';
import 'package:restaurant_app/core/constants/assets/app_fontweight.dart';
import 'package:restaurant_app/core/constants/assets/app_sizes.dart';

class AppTheme {
  ThemeData get lightMode => _ligthMode;
  ThemeData get darkMode => _darkMode;
  CupertinoThemeData get cupertinoLightMode => _cupertinoLightMode;
  CupertinoThemeData get cupertinoDarkMode => _cupertinoDarkMode;

  final CupertinoThemeData _cupertinoLightMode = CupertinoThemeData(
      applyThemeToAll: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: scaffoldColor);

  final CupertinoThemeData _cupertinoDarkMode = CupertinoThemeData(
      applyThemeToAll: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: scaffoldColorBlack);

  final ThemeData _ligthMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppfontFamily.inter,
    textTheme: const TextTheme(
        bodySmall: TextStyle(
      fontWeight: AppFontWeight.w_400,
      fontSize: AppSizes.size_12,
    )),
    searchBarTheme: const SearchBarThemeData(
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.white)),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffCCCFD3), width: 1),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffCCCFD3), width: 1),
            borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: textFormFieldFillColor),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: bottomNavbarColor),
    scaffoldBackgroundColor: scaffoldColor,
    cupertinoOverrideTheme: CupertinoThemeData(
        applyThemeToAll: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: scaffoldColor),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    cardTheme: CardTheme(color: cardColor),
    tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        unselectedLabelColor: tabLabelUnselectedColor,
        labelColor: tabLabelSelectedColor),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: bottomSheetColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: elevatedButtonBorderColor),
                borderRadius: BorderRadius.circular(8)),
            backgroundColor: elevatedButtonColor)),

    // bottomAppBarTheme: BottomAppBarTheme(color: bottomAppbarColor),
  );

  final ThemeData _darkMode = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: scaffoldColorBlack,
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      unselectedLabelColor: tabLabelUnselectedDarkColor,
      labelColor: tabLabelSelectedDarkColor,
    ),

    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: bottomSheetDarkColor),

    fontFamily: AppfontFamily.inter,
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff595F6B), width: 1),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff595F6B), width: 1),
            borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: textFormFieldFillDarkColor),
    searchBarTheme: const SearchBarThemeData(
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.black)),
    cardTheme: CardTheme(color: cardDarkColor),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: bottomNavbarBlackColor),
    textTheme: const TextTheme(
        bodySmall: TextStyle(
            fontWeight: AppFontWeight.w_400, fontSize: AppSizes.size_12)),
    cupertinoOverrideTheme: CupertinoThemeData(
        applyThemeToAll: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: scaffoldColorBlack),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS:
          CupertinoPageTransitionsBuilder(), //CupertinoFullScreenDialogTransitionBuilder
    }),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            shape: RoundedRectangleBorder(
                side:
                    BorderSide(width: 1, color: elevatedButtonBorderDarkColor),
                borderRadius: BorderRadius.circular(8)),
            backgroundColor: elevatedButtonDarkColor)),
    // bottomSheetTheme: BottomSheetThemeData(
    //   backgroundColor: Colors.blueGrey.shade900,
    // ),
  );
}
