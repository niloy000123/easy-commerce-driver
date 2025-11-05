import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce_delivery_app/core/common/widget/custom_image_view.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/app_colors.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/app_text_style.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/theme.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/box_shado.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/extensions.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/global_function.dart';
import 'package:simple_ecommerce_delivery_app/generated/assets.gen.dart';

OverlayEntry? _currentSnackBar; // Store the active snackbar globally

void showSnackBarRegular(
  String message, {
  BuildContext? context,
  Color? color,
  bool showCancelButton = true,
}) {
  final overlay = Overlay.of(
    context ?? ApGlobalFunctions.navigatorKey.currentState!.context,
  );

  // Remove the existing snackbar if it's already visible
  _currentSnackBar?.remove();
  _currentSnackBar = null;

  // Create new snackbar
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 20.0, // Keep it at the bottom
      left: 20,
      right: 20,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(8),
        color: color ?? Colors.black87, // Default color
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (showCancelButton)
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    _currentSnackBar?.remove();
                    _currentSnackBar = null;
                  },
                ),
            ],
          ),
        ),
      ),
    ),
  );

  // Insert the new snackbar
  overlay.insert(overlayEntry);
  _currentSnackBar = overlayEntry; // Store the current snackbar

  // Automatically remove after 3 seconds
  Future.delayed(const Duration(seconds: 3), () {
    if (_currentSnackBar == overlayEntry) {
      _currentSnackBar?.remove();
      _currentSnackBar = null;
    }
  });
}

// ----------------- product snackbar ------------------
OverlayEntry? _customSnackBar; // Store the active snackbar globally

void showCustomSnackBar(
  String message, {
  BuildContext? context,
  bool isSuccess = true,
}) {
  final overlay = Overlay.of(
    context ?? ApGlobalFunctions.navigatorKey.currentState!.context,
  );

  // Remove the existing snackbar if it's already visible
  _customSnackBar?.remove();
  _customSnackBar = null;

  // Create new snackbar
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 20.0, // Keep it at the bottom
      left: 20,
      right: 20,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(8),
        // Default color
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(8.w),

              decoration: BoxDecoration(
                boxShadow: boxShadow(context),
                color: colors().scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: isSuccess
                        ? Assets.icons.check.path
                        : Assets.icons.error.path,
                    width: 27.w,
                    height: 27.w,
                  ),
                  12.pw,
                  Expanded(
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      message,
                      style: AppTextStyle(context).s14w400Body,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -10,
              right: -10,
              child: InkWell(
                onTap: () {
                  _customSnackBar?.remove();
                  _customSnackBar = null;
                  print('test');
                },
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colors().scaffoldBackgroundColor!,
                      width: 2.w,
                    ),
                    color: AppStaticColor.slate500Color,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: Colors.white, size: 16.w),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  // Insert the new snackbar
  overlay.insert(overlayEntry);
  _customSnackBar = overlayEntry; // Store the current snackbar

  // Automatically remove after 3 seconds
  Future.delayed(const Duration(seconds: 3), () {
    if (_customSnackBar == overlayEntry) {
      _customSnackBar?.remove();
      _customSnackBar = null;
    }
  });
}
