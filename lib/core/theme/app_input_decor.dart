import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce_delivery_app/core/constants/app_constants.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/app_colors.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/theme.dart';

class AppInputDecor {
  AppInputDecor._(); // This class is not meant to be instantiated.

  static appInputDecor(BuildContext context) {
    return InputDecoration(
      isDense: false,
      contentPadding: const EdgeInsets.all(15),
      hintStyle: TextStyle(
        color: colors(context).hintTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      filled: false,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.h),
        borderSide: BorderSide(color: colors(context).borderColor!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.h),
        borderSide: BorderSide(
          color: Theme.of(
            context,
          ).hintColor.withOpacity(AppConstants.hintColorBorderOpacity),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.h),
        borderSide: const BorderSide(color: AppStaticColor.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.h),
        borderSide: const BorderSide(color: AppStaticColor.redColor),
      ),
    );
  }
}
