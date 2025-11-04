import 'package:flutter/material.dart';
import '../../app_export.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.iconPath,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.height,
    this.width,
    this.iconSize,
  });

  /// Path to the icon/image file
  final String iconPath;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Border radius for rounded corners
  final double? borderRadius;

  /// Internal padding around the icon
  final EdgeInsetsGeometry? padding;

  /// Height of the button
  final double? height;

  /// Width of the button
  final double? width;

  /// Size of the icon inside the button
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 48.h,
        width: width ?? 48.h,
        padding: padding ?? EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? colors().scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 24.h),
        ),
        child: CustomImageView(
          imagePath: iconPath,
          height: iconSize,
          width: iconSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
