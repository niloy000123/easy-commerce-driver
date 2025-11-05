import 'package:flutter/material.dart';
import 'package:simple_ecommerce_delivery_app/core/common/widget/custom_icon.dart';
import '../../../../core/app_export.dart';

class CustomDeliveryOrderCard extends StatelessWidget {
  final String? orderId;
  final String? deliveryDate;
  final String? userName;
  final String? phoneNumber;
  final String? address;
  final VoidCallback? onCallPressed;
  final VoidCallback? onTap;

  const CustomDeliveryOrderCard({
    super.key,
    this.orderId,
    this.deliveryDate,
    this.userName,
    this.phoneNumber,
    this.address,
    this.onCallPressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.h),
        decoration: BoxDecoration(
          color: lightenColor(colors().borderColor!, 0.05),
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Column(
          children: [
            _buildOrderHeader(context),
            SizedBox(height: 16.h),
            _buildOrderDetails(context),
          ],
        ),
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
            ).s16w400Body.copyWith(color: colors().textLightColor),
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
        color: colors().scaffoldBackgroundColor,
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
            backgroundColor: lightenColor(colors().borderColor!, 0.05),
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
                ).s12w400Body.copyWith(color: colors().textLightColor),
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
            backgroundColor: lightenColor(colors().borderColor!, 0.05),
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
            color: lightenColor(colors().borderColor!, 0.05),
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
