import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';

class CustomStatusCard extends StatelessWidget {
  const CustomStatusCard({
    super.key,
    required this.label,
    required this.value,
    required this.iconPath,
    this.borderColor,
    this.showBorder,
  });

  /// The descriptive text shown above the value
  final String label;

  /// The numeric or text value to display prominently
  final String value;

  /// Path to the SVG icon asset
  final String iconPath;

  /// Optional border color for special states
  final Color? borderColor;

  /// Whether to show a border around the card
  final bool? showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
      decoration: BoxDecoration(
        color: colors().scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12.h),
        border: (showBorder ?? false)
            ? Border.all(color: borderColor ?? Colors.transparent, width: 1)
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppTextStyle(
                    context,
                  ).s14w500Label.copyWith(color: colors().textLightColor),
                ),
                SizedBox(height: 12.h),
                Text(
                  value,
                  style: AppTextStyle(
                    context,
                  ).s22w400Title.copyWith(color: colors().textRegularColor),
                ),
              ],
            ),
          ),
          CustomImageView(imagePath: iconPath, height: 24.h, width: 24.h),
        ],
      ),
    );
  }
}
