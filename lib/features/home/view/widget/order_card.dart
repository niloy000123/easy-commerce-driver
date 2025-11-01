import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';

class CustomDeliveryOrderCard extends StatelessWidget {
  final String? orderId;
  final String? deliveryDate;
  final String? userName;
  final String? phoneNumber;
  final String? address;
  final VoidCallback? onCallPressed;

  const CustomDeliveryOrderCard({
    super.key,
    this.orderId,
    this.deliveryDate,
    this.userName,
    this.phoneNumber,
    this.address,
    this.onCallPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.h),
      decoration: BoxDecoration(
        color: lightenColor(colors(context).borderColor!, 0.05),
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Column(
        children: [
          _buildOrderHeader(context),
          SizedBox(height: 16.h),
          _buildOrderDetails(context),
        ],
      ),
    );
  }

  Widget _buildOrderHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h).copyWith(top: 8.h),
      child: Row(
        children: [
          Text(orderId ?? "#25356", style: AppTextStyle(context).s16w500Title),
          Spacer(),
          CustomIconButton(
            iconPath: Assets.icons.byCycle.path,
            height: 24.h,
            width: 24.h,
            padding: EdgeInsets.all(4.h),
            borderRadius: 12.h,
          ),
          SizedBox(width: 8.h),
          Text(
            "By:",
            style: AppTextStyle(
              context,
            ).s16w400Body.copyWith(color: colors(context).textLightColor),
          ),
          SizedBox(width: 8.h),
          Text(
            deliveryDate ?? "Tomorrow",
            style: AppTextStyle(context).s16w500Title,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetails(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8.h),
      ),
      child: Column(
        children: [_buildUserInfo(context), _buildAddressSection(context)],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h).copyWith(top: 10.h),
      child: Row(
        children: [
          CustomIconButton(
            iconPath: Assets.icons.profile.path,
            height: 40.h,
            width: 40.h,
            padding: EdgeInsets.all(8.h),
            borderRadius: 20.h,
            backgroundColor: lightenColor(colors(context).borderColor!, 0.05),
          ),
          SizedBox(width: 12.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName ?? "Emir Yilmaz",
                style: AppTextStyle(context).s14w500Label,
              ),
              Text(
                phoneNumber ?? "01712 345 678",
                style: AppTextStyle(
                  context,
                ).s12w400Body.copyWith(color: colors(context).textLightColor),
              ),
            ],
          ),
          Spacer(),
          CustomIconButton(
            iconPath: Assets.icons.call.path,
            height: 32.h,
            width: 32.h,
            padding: EdgeInsets.all(6.h),
            borderRadius: 16.h,
            backgroundColor: lightenColor(colors(context).borderColor!, 0.05),
            onPressed: onCallPressed,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: lightenColor(colors(context).borderColor!, 0.05),
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.all(16.h).copyWith(top: 4.h, bottom: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: Assets.icons.location.path,
            height: 20.h,
            width: 20.h,
          ),
          SizedBox(width: 4.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 2.h, right: 6.h),
              child: Text(
                address ?? "2715 Ash Dr. San Jose, South Dakota 83475",
                style: AppTextStyle(context).s14w500Label,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
          color: backgroundColor ?? colors(context).scaffoldBackgroundColor,
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
