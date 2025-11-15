import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/theme.dart';
import 'package:simple_ecommerce_delivery_app/generated/assets.gen.dart';

AppBar cAppBarWidget({
  required String title,
  required BuildContext context,
  bool showBackButton = true,
  List<Widget> actions = const [],
}) => AppBar(
  title: Text(title),
  leading: showBackButton
      ? IconButton(
          icon: Image.asset(
            Assets.icons.arrowLeft.path,
            width: 24.w,
            height: 24.w,
            color: colors().secondaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        )
      : null,
  bottom: PreferredSize(
    preferredSize: const Size.fromHeight(1),
    child: Container(
      color: colors().borderColor, // border color
      height: 1, // thickness
    ),
  ),
  actions: actions,
);
