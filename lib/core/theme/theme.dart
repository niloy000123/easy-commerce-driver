import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/app_colors.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/global_function.dart';

AppColors colors() => Theme.of(
  ApGlobalFunctions.navigatorKey.currentState!.context,
).extension<AppColors>()!;
ThemeData getAppTheme({
  required BuildContext context,
  required bool isDarkTheme,
}) {
  return ThemeData(
    extensions: <ThemeExtension<AppColors>>[
      AppColors(
        primaryColor: isDarkTheme
            ? AppStaticColor.primaryDarkColor
            : AppStaticColor.primaryColor,
        secondaryColor: isDarkTheme
            ? AppStaticColor.secondaryDarkColor
            : AppStaticColor.secondaryColor,
        hintTextColor: isDarkTheme
            ? const Color(0XFF475569)
            : const Color(0XFF94a3b8),
        borderColor: isDarkTheme
            ? const Color(0XFF1e293b)
            : const Color(0XFFe2e8f0),
        scaffoldBackgroundColor: isDarkTheme
            ? const Color(0XFF020617)
            : const Color(0XFFFFFFFF),
        textRegularColor: isDarkTheme
            ? const Color(0XFFFFFFFF)
            : const Color(0XFF000000),
        iconColor: isDarkTheme
            ? const Color(0XFFcbd5e1)
            : const Color(0XFF334155),
        productBgColor: isDarkTheme
            ? const Color(0XFF0f172a)
            : const Color(0XFFf4f4f4),
        textLightColor: isDarkTheme
            ? const Color(0XFF94a3b8)
            : const Color(0XFF475569),
      ),
    ],
    fontFamily: 'Poppins',
    colorScheme: isDarkTheme
        ? ColorScheme.fromSeed(
            seedColor: AppStaticColor.primaryDarkColor,
            secondary: AppStaticColor.secondaryDarkColor,
            brightness: Brightness.dark,
          )
        : ColorScheme.fromSeed(
            seedColor: AppStaticColor.primaryColor,
            secondary: AppStaticColor.secondaryColor,
            brightness: Brightness.light,
          ),
    useMaterial3: true,
    unselectedWidgetColor: isDarkTheme
        ? AppStaticColor.accentColor
        : AppStaticColor.accentColor,
    scaffoldBackgroundColor: isDarkTheme
        ? const Color(0XFF020617)
        : const Color(0XFFFFFFFF),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: isDarkTheme
          ? const Color(0XFF020617)
          : const Color(0XFFFFFFFF),

      titleTextStyle: TextStyle(
        color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
        fontSize: 20.sp,

        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        overflow: TextOverflow.ellipsis,
      ),

      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: isDarkTheme ? const Color(0XFFcbd5e1) : const Color(0XFF020617),
      ),
    ),

    inputDecorationTheme: inputDecorationTheme(isDarkTheme: isDarkTheme),
    textTheme: _textTheme(isDarkTheme: isDarkTheme),
  );
}

TextTheme _textTheme({required bool isDarkTheme}) {
  return TextTheme(
    bodyLarge: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    bodyMedium: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    bodySmall: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    displayLarge: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    displayMedium: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    displaySmall: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    headlineLarge: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    headlineMedium: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    headlineSmall: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    titleLarge: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    titleMedium: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    titleSmall: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    labelLarge: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    labelMedium: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
    labelSmall: TextStyle(
      color: isDarkTheme ? const Color(0XFFFFFFFF) : const Color(0XFF000000),
    ),
  );
}

InputDecorationTheme inputDecorationTheme({required bool isDarkTheme}) {
  var inputBorderRadius = BorderRadius.circular(12.r);
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    isDense: false,
    contentPadding: const EdgeInsets.all(15),
    hintStyle: TextStyle(
      color: isDarkTheme ? const Color(0XFF475569) : const Color(0XFF94a3b8),
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    filled: false,
    fillColor: isDarkTheme
        ? AppStaticColor.blackColor
        : AppStaticColor.whiteColor,
    enabledBorder: OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(
        color: isDarkTheme ? const Color(0XFF1e293b) : const Color(0XFFe2e8f0),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(
        color: isDarkTheme
            ? AppStaticColor.primaryDarkColor
            : AppStaticColor.primaryColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: const BorderSide(color: AppStaticColor.redColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: const BorderSide(color: AppStaticColor.redColor),
    ),
  );
}
