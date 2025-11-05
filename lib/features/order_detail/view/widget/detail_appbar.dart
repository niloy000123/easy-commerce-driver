import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.leadingIcon,
    this.actionIcon,
    this.backgroundColor,
    this.titleColor,
    this.subtitleColor,
    this.subtitleBackgroundColor,
    this.showBorder,
    this.onLeadingPressed,
    this.onActionPressed,
    this.appBarType,
    this.height,
  });

  /// Main title text displayed in the app bar
  final String? title;

  /// Optional subtitle or status text
  final String? subtitle;

  /// Path to the leading icon (back button, menu, etc.)
  final String? leadingIcon;

  /// Path to the action icon (profile, notification, etc.)
  final String? actionIcon;

  /// Background color of the app bar
  final Color? backgroundColor;

  /// Color of the title text
  final Color? titleColor;

  /// Color of the subtitle text
  final Color? subtitleColor;

  /// Background color for subtitle badge
  final Color? subtitleBackgroundColor;

  /// Whether to show bottom border
  final bool? showBorder;

  /// Callback for leading icon tap
  final VoidCallback? onLeadingPressed;

  /// Callback for action icon tap
  final VoidCallback? onActionPressed;

  /// Type of app bar layout
  final CustomAppBarType? appBarType;

  /// Custom height for the app bar
  final double? height;

  @override
  Size get preferredSize => Size.fromHeight(height ?? 64.h);

  @override
  Widget build(BuildContext context) {
    final effectiveAppBarType = appBarType ?? CustomAppBarType.order;
    final effectiveBackgroundColor =
        backgroundColor ?? colors().scaffoldBackgroundColor;
    final effectiveTitleColor = titleColor ?? Color(0xFF000000);
    final effectiveShowBorder = showBorder ?? false;

    return AppBar(
      backgroundColor: effectiveBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 64.h,
      centerTitle: true,
      leading: GestureDetector(
        onTap: onLeadingPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: leadingIcon ?? Assets.icons.arrowLeft.path,
              height: 24.h,
              width: 24.h,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      title: _buildAppBarContent(
        context,
        effectiveAppBarType,
        effectiveTitleColor,
      ),
      bottom: effectiveShowBorder ? _buildBorder() : null,
    );
  }

  Widget _buildAppBarContent(
    BuildContext context,
    CustomAppBarType type,
    Color titleColor,
  ) {
    return _buildOrderLayout(context, titleColor);
  }

  Widget _buildOrderLayout(BuildContext context, Color titleColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Text(title!, style: AppTextStyle(context).s22w400Title),
        if (subtitle != null) ...[
          SizedBox(height: 6.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            decoration: BoxDecoration(
              color: subtitleBackgroundColor ?? Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(14.h),
            ),
            child: Text(
              subtitle!,
              style: AppTextStyle(
                context,
              ).s14w400Body.copyWith(color: subtitleColor ?? Color(0xFF3B82F6)),
            ),
          ),
          4.ph,
        ],
      ],
    );
  }

  PreferredSizeWidget _buildBorder() {
    return PreferredSize(
      preferredSize: Size.fromHeight(1.h),
      child: Container(
        height: 1.h,
        color: lightenColor(colors().borderColor!, 0.05),
      ),
    );
  }
}

/// Enum for different app bar layout types
enum CustomAppBarType { order }

//---------------

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.label,
    this.onPressed,
    this.buttonStyle,
    this.buttonTextStyle,
    this.isDisabled = false,
    this.height,
    this.width,
    this.margin,
    this.alignment,
  });

  /// Custom decoration for the button (background, borders, etc.)
  final BoxDecoration? decoration;

  /// Path to the left icon image
  final String? leftIcon;

  /// Path to the right icon image
  final String? rightIcon;

  /// Text label displayed on the button
  final String? label;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Custom button style configuration
  final ButtonStyle? buttonStyle;

  /// Custom text style for the button label
  final TextStyle? buttonTextStyle;

  /// Whether the button is disabled
  final bool isDisabled;

  /// Fixed height for the button
  final double? height;

  /// Fixed width for the button
  final double? width;

  /// External margin around the button
  final EdgeInsets? margin;

  /// Alignment of the button within its parent
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      alignment: alignment,
      child: decoration != null
          ? _buildDecoratedButton()
          : _buildElevatedButton(),
    );
  }

  /// Builds button with custom decoration
  Widget _buildDecoratedButton() {
    return Container(
      decoration: decoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: decoration?.borderRadius as BorderRadius?,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 12.h),
            child: _buildButtonContent(),
          ),
        ),
      ),
    );
  }

  /// Builds standard elevated button
  Widget _buildElevatedButton() {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: buttonStyle ?? _getDefaultButtonStyle(),
      child: _buildButtonContent(),
    );
  }

  /// Builds the content inside the button (text and icons)
  Widget _buildButtonContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIcon != null) ...[
          CustomImageView(imagePath: leftIcon!, height: 24.h, width: 24.h),
          SizedBox(width: 8.h),
        ],
        if (label != null)
          Flexible(
            child: Text(
              label!,
              style: buttonTextStyle ?? _getDefaultTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
        if (rightIcon != null) ...[
          SizedBox(width: 8.h),
          CustomImageView(imagePath: rightIcon!, height: 24.h, width: 24.h),
        ],
      ],
    );
  }

  /// Default button style configuration
  ButtonStyle _getDefaultButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: colors().borderColor,
      foregroundColor: colors().scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 12.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.h)),
      elevation: 0,
      minimumSize: Size(0, 45.h),
    );
  }

  /// Default text style for button label
  TextStyle _getDefaultTextStyle() {
    return AppTextStyle(
      ApGlobalFunctions.navigatorKey.currentState!.context,
    ).s14w400Body;
  }
}
