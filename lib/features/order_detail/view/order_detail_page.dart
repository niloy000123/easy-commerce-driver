import 'package:simple_ecommerce_delivery_app/core/common/widget/custom_icon.dart';
import 'package:simple_ecommerce_delivery_app/features/order_detail/view/widget/detail_appbar.dart';

import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(
        title: "ORDER ID #25356",
        subtitle: "Ongoing",
        leadingIcon: Assets.icons.arrowLeft.path,
        appBarType: CustomAppBarType.order,
        showBorder: true,
        subtitleColor: Colors.blue[200],
        subtitleBackgroundColor: lightenColor(colors().borderColor!, 0.05),
        onLeadingPressed: () => Navigator.pop(context),
        height: 64.h,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildOrderItemSection(context),
                  _buildShippingAddressSection(context),
                ],
              ),
            ),
          ),
          DeliveryButton(),
        ],
      ),
    );
  }

  Widget _buildOrderItemSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.ph,
          Text(
            'Order Items (2)',
            style: AppTextStyle(context).s16w500Title.copyWith(
              fontSize: 18.sp,
              color: colors().textRegularColor,
            ),
          ),
          12.ph,
          //items
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              border: Border.all(color: colors().borderColor!),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Men's Harrington Jacket",
                  style: AppTextStyle(context).s16w400Body,
                ),
                10.ph,
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Size: ",
                          style: AppTextStyle(context).s14w400Body.copyWith(
                            color: colors().textLightColor,
                          ),
                        ),
                        Text("M", style: AppTextStyle(context).s14w400Body),
                        16.pw,
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Color: ",
                            style: AppTextStyle(context).s14w400Body.copyWith(
                              color: colors().textLightColor,
                            ),
                          ),
                          Text(
                            "Lemon",
                            style: AppTextStyle(context).s14w400Body,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "1x",
                      style: AppTextStyle(
                        context,
                      ).s14w400Body.copyWith(color: colors().textLightColor),
                    ),
                  ],
                ),
                16.ph,
                Divider(color: colors().borderColor),
                12.ph,
                Text(
                  'Vibez Majestic Luxury Smartwatch for Women & Men ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyle(context).s16w400Body,
                ),
                10.ph,
                Row(
                  children: [
                    Text(
                      "Color ",
                      style: AppTextStyle(
                        context,
                      ).s14w400Body.copyWith(color: colors().textLightColor),
                    ),
                    Text(
                      "- Silver-Golden",
                      style: AppTextStyle(context).s14w400Body,
                    ),
                    Spacer(),
                    Text(
                      "1x",
                      style: AppTextStyle(
                        context,
                      ).s14w400Body.copyWith(color: colors().textLightColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.ph,

          // delivery info
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: lightenColor(AppStaticColor.blueColor, 0.33),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomIconButton(
                      iconPath: Assets.icons.byCycle.path,
                      height: 32.h,
                      width: 32.h,
                      padding: EdgeInsets.all(4.h),
                      borderRadius: 12.h,
                    ),
                    8.pw,
                    Text(
                      "Delivery by",
                      style: AppTextStyle(context).s16w400Body,
                    ),
                    8.pw,
                    Spacer(),
                    Text("Tomorrow", style: AppTextStyle(context).s16w500Title),
                  ],
                ),
                12.ph,
                Text(
                  'N.B: Make sure to reach out to the customer before deliver!',
                  style: AppTextStyle(context).s14w400Body.copyWith(
                    color: AppStaticColor.blueColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          16.ph,
        ],
      ),
    );
  }

  Widget _buildShippingAddressSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: lightenColor(colors().borderColor!, 0.05),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.ph,
          Text(
            'Shipping Details',
            style: AppTextStyle(context).s16w500Title.copyWith(
              fontSize: 18.sp,
              color: colors().textRegularColor,
            ),
          ),
          12.ph,
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: colors().scaffoldBackgroundColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomIconButton(
                      iconPath: Assets.icons.profile.path,
                      height: 48.h,
                      width: 48.h,
                      padding: EdgeInsets.all(12.h),
                      borderRadius: 24.h,
                      backgroundColor: lightenColor(
                        colors().borderColor!,
                        0.05,
                      ),
                    ),
                    SizedBox(width: 12.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Emir Yilmaz",
                          style: AppTextStyle(context).s14w500Label,
                        ),
                        Text(
                          "01712 345 678",
                          style: AppTextStyle(context).s12w400Body.copyWith(
                            color: colors().textLightColor,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomImageView(
                      imagePath: Assets.icons.call.path,
                      height: 24.h,
                      width: 24.h,
                      color: Colors.deepPurpleAccent,
                    ),
                  ],
                ),
                8.ph,
                Divider(color: colors().borderColor),
                8.ph,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          "2715 Ash Dr. San Jose, South Dakota 83475,San Jose, South Dakota",
                          style: AppTextStyle(context).s14w500Label,
                        ),
                      ),
                    ),
                  ],
                ),
                8.ph,
                AppButton(
                  title: 'GET DIRECTION ON MAP',
                  onTap: () {},
                  buttonColor: colors().textRegularColor,
                ),
              ],
            ),
          ),
          16.ph,
        ],
      ),
    );
  }
}

class DeliveryButton extends StatefulWidget {
  const DeliveryButton({super.key});

  @override
  State<DeliveryButton> createState() => _DeliveryButtonState();
}

class _DeliveryButtonState extends State<DeliveryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("🚚 Delivery Started!"),
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _onLongPressStart(LongPressStartDetails details) {
    _controller.forward(from: 0);
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    if (_controller.isCompleted) {
      _showSnackBar(context);
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Base curved button
        ClipPath(
          clipper: CurvedTopClipper(),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30.h),
            color: const Color(0xFFAA8FFF),
            child: const Center(
              child: Text(
                "Tap & Hold to Begin Delivery",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),

        // Animated curved progress bar overlay
        ClipPath(
          clipper: CurvedTopClipper(),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * _controller.value,
                  height: 80, // same as curved area height
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                  ),
                ),
              );
            },
          ),
        ),

        // Gesture detector to handle press
        Positioned.fill(
          child: GestureDetector(
            onLongPressStart: _onLongPressStart,
            onLongPressEnd: _onLongPressEnd,
            child: Container(color: Colors.transparent),
          ),
        ),
      ],
    );
  }
}

// Custom curved clipper for top shape
class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 15); // ↓ reduced curve height
    path.quadraticBezierTo(size.width / 2, 0, size.width, 15);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
