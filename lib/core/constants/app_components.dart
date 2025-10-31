import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/extensions.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/size_config.dart';

class AppComponents {
  /// This file contains various components for the app
  static BorderRadius defaultBorderRadiusLarge = BorderRadius.circular(
    getPWidth(inputWidth: 12),
  );
  static BorderRadius defaultBorderRadiusSmall = BorderRadius.circular(
    getPWidth(inputWidth: 8),
  );

  static EdgeInsets defaultAllPadding = EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 16.w,
  );
  static EdgeInsets defaultHPadding = EdgeInsets.symmetric(horizontal: 16.w);
  static SizedBox defaultLeftPadding = 16.pw;
  static SizedBox defaultRightPadding = 16.pw;
  static SizedBox defaultTopPadding = 24.ph;

  static EdgeInsets padding10 = EdgeInsets.symmetric(horizontal: 10.w);
}
