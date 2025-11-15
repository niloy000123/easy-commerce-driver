import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_ecommerce_delivery_app/core/app_export.dart';

class ShimmerShort extends StatelessWidget {
  const ShimmerShort({super.key, this.topPadding = 20});
  final double topPadding;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.color.surface,
      highlightColor: context.color.primary.withOpacity(.0001),
      enabled: true,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topPadding.ph,
              Container(
                height: 20.h,
                width: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppStaticColor.accentColor,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 14.h,
                width: 260.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppStaticColor.accentColor,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 14.h,
                width: 220.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppStaticColor.accentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerForPrice extends StatelessWidget {
  const ShimmerForPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.color.surface,
      highlightColor: context.color.primary.withOpacity(.0001),
      enabled: true,
      child: Container(
        constraints: BoxConstraints(
          minWidth: 120.w,
          maxWidth: MediaQuery.of(context).size.width - 40.w,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 14.h,
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppStaticColor.accentColor,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 14.h,
                width: 120.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppStaticColor.accentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.color.surface,
      highlightColor: context.color.primary.withOpacity(.0001),
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerTop(),
              SizedBox(height: 55.h),
              shimmerBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget shimmerTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20.h,
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppStaticColor.accentColor,
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          height: 14.h,
          width: 260.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppStaticColor.accentColor,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 14.h,
          width: 220.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppStaticColor.accentColor,
          ),
        ),
      ],
    );
  }

  Widget shimmerBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppStaticColor.accentColor,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppStaticColor.accentColor,
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 260.h,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppStaticColor.accentColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppStaticColor.accentColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppStaticColor.accentColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppStaticColor.accentColor,
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
