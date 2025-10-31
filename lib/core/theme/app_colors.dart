// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? borderColor;
  final Color? textRegularColor;
  final Color? textLightColor;
  final Color? iconColor;
  final Color? hintTextColor;
  final Color? productBgColor;
  final Color? scaffoldBackgroundColor;

  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.hintTextColor,
    required this.borderColor,
    required this.scaffoldBackgroundColor,
    required this.textLightColor,
    required this.textRegularColor,
    required this.iconColor,
    required this.productBgColor,
  });

  @override
  AppColors copyWith(
      {Color? primaryColor,
      Color? secondaryColor,
      Color? borderColor,
      Color? iconColor,
      Color? hintTextColor,
      Color? productBgColor,
      Color? textLightColor,
      Color? textColor,
      Color? scaffoldBackgroundColor}) {
    return AppColors(
      primaryColor: primaryColor ?? primaryColor,
      secondaryColor: secondaryColor ?? secondaryColor,
      iconColor: iconColor ?? iconColor,
      textRegularColor: textColor ?? textColor,
      hintTextColor: hintTextColor ?? hintTextColor,
      borderColor: borderColor ?? borderColor,
      textLightColor: textLightColor ?? textLightColor,
      productBgColor: productBgColor ?? productBgColor,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? scaffoldBackgroundColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      hintTextColor: Color.lerp(hintTextColor, other.hintTextColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      textRegularColor: Color.lerp(textRegularColor, other.textRegularColor, t),
      textLightColor: Color.lerp(textLightColor, other.textLightColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      productBgColor: Color.lerp(productBgColor, other.productBgColor, t),
      scaffoldBackgroundColor:
          Color.lerp(scaffoldBackgroundColor, other.scaffoldBackgroundColor, t),
    );
  }
}

class AppStaticColor {
  static const Color primaryColor = Color(0xFF8b5cf6);
  static const Color secondaryColor = Color(0XFF1e293b);
  static const Color primaryDarkColor = Color(0xFF8b5cf6);
  static const Color secondaryDarkColor = Color(0XFFe2e8f0);
  static const Color accentColor = Color(0xFFF3F4F6);
  static const Color slate500Color = Color(0xFF64748b);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF030712);
  static const Color redColor = Color(0xffef4444);
  static const Color yellowColor = Color(0xFFf59e0b);
  static const Color greenColor = Color(0xFF45bc1a);
  static const Color blueColor = Color(0xFF3b82f6);
}
