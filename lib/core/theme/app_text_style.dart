import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/app_colors.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/theme.dart';

class AppTextStyle {
  final BuildContext context;
  AppTextStyle(this.context);

  // titles
  TextStyle get s22w400Title => Theme.of(context).textTheme.titleLarge!;
  TextStyle get s16w500Title => Theme.of(context).textTheme.titleMedium!;
  TextStyle get s14w500Title => Theme.of(context).textTheme.titleSmall!;

  // body
  TextStyle get s16w400Body => Theme.of(context).textTheme.bodyLarge!;
  TextStyle get s14w400Body => Theme.of(context).textTheme.bodyMedium!;
  TextStyle get s12w400Body => Theme.of(context).textTheme.bodySmall!;

  // headlines
  TextStyle get s32w400Headline => Theme.of(context).textTheme.headlineLarge!;
  TextStyle get s28w400Headline => Theme.of(context).textTheme.headlineMedium!;
  TextStyle get s24w400Headline => Theme.of(context).textTheme.headlineSmall!;
  TextStyle get s24w500 =>
      s24w400Headline.copyWith(fontWeight: FontWeight.w500);

  // display
  TextStyle get s57w400Display => Theme.of(context).textTheme.displayLarge!;
  TextStyle get s45w400Display => Theme.of(context).textTheme.displayMedium!;
  TextStyle get s36w400Display => Theme.of(context).textTheme.displaySmall!;

  // labels
  TextStyle get s14w500Label => Theme.of(context).textTheme.labelLarge!;
  TextStyle get s12w500Label => Theme.of(context).textTheme.labelMedium!;
  TextStyle get s11w500Label => Theme.of(context).textTheme.labelSmall!;

  TextStyle get button =>
      s16w500Title.copyWith(color: AppStaticColor.whiteColor, fontSize: 14.sp);
  //hint
  TextStyle get hintText => s16w400Body.copyWith(
    color: colors().hintTextColor,
    fontWeight: FontWeight.w400,
  );

  TextStyle get bigTitle =>
      s28w400Headline.copyWith(fontSize: 30.sp, fontWeight: FontWeight.w500);
  TextStyle get title =>
      s28w400Headline.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500);
  // TextStyle get subTitle => TextStyle(
  //       color: colors().textColor900,
  //       fontSize: 18.sp,
  //       fontWeight: FontWeight.w700,
  //     );
  // TextStyle get bodyText14 => TextStyle(
  //       color: colors().textColor800,
  //       fontSize: 14.sp,
  //       fontWeight: FontWeight.w300,
  //     );
  // TextStyle get bodyText12 => TextStyle(
  //       color: colors().textColor800,
  //       fontSize: 12.sp,
  //       fontWeight: FontWeight.w300,
  //     );
}
