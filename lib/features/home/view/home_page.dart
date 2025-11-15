import 'package:simple_ecommerce_delivery_app/features/home/view/widget/custom_status_card.dart';
import 'package:simple_ecommerce_delivery_app/features/home/view/widget/drawer.dart';
import 'package:simple_ecommerce_delivery_app/features/home/view/widget/order_card.dart';

import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
      appBar: AppBar(
        backgroundColor: colors().scaffoldBackgroundColor,
        centerTitle: true,
        title: Text('Dashboard'),
        elevation: 0,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: Assets.icons.menu.path,
              height: 24.w,
              width: 24.w,
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ],
        ),
        actions: [
          Image.asset(Assets.icons.notification.path, width: 24.w),
          16.pw,
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildUserProfileSection(context),
              _buildJobStatusSection(context),
              _buildOngoingJobsHeader(context),
              _buildOngoingJobsList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfileSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.h),
      decoration: BoxDecoration(color: colors().scaffoldBackgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: Assets.images.defaultUser.path,
            height: 48.h,
            width: 48.h,
            radius: BorderRadius.circular(24.h),
          ),
          SizedBox(width: 12.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning',
                  style: AppTextStyle(
                    context,
                  ).s14w400Body.copyWith(color: colors().textLightColor),
                ),
                Text(
                  'Isabella Rossi',
                  style: AppTextStyle(
                    context,
                  ).s16w500Title.copyWith(fontSize: 18.sp),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.h),
          Container(width: 1.h, height: 32.h, color: colors().borderColor),
          SizedBox(width: 12.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'DUTY HOUR',
                style: AppTextStyle(
                  context,
                ).s12w400Body.copyWith(color: colors().textLightColor),
              ),
              Text(
                '8:00 to 20:00',
                style: AppTextStyle(
                  context,
                ).s14w400Body.copyWith(color: colors().primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJobStatusSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.h),
      color: lightenColor(colors().borderColor!, 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("TODAY'S JOB", style: AppTextStyle(context).s16w500Title),
          SizedBox(height: 16.h),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16.h,
            mainAxisSpacing: 16.h,
            childAspectRatio: 1.8,
            children: [
              CustomStatusCard(
                label: 'Assigned',
                value: '14',
                iconPath: Assets.icons.statusAssign.path,
              ),
              CustomStatusCard(
                label: 'Ongoing',
                value: '6',
                iconPath: Assets.icons.statusOngoing.path,
              ),
              CustomStatusCard(
                label: 'Overdue',
                value: '2',
                iconPath: Assets.icons.statusOverdue.path,
                showBorder: true,
                borderColor: lightenColor(AppStaticColor.redColor, 0.2),
              ),
              CustomStatusCard(
                label: 'Completed',
                value: '31',
                iconPath: Assets.icons.statusCompleted.path,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOngoingJobsHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 8.h),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Text(
              'Ongoing',
              style: AppTextStyle(
                context,
              ).s16w500Title.copyWith(fontSize: 18.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Text('SEE ALL', style: AppTextStyle(context).s14w500Label),
          ),
        ],
      ),
    );
  }

  Widget _buildOngoingJobsList(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 34.h),
      child: Column(
        children: [
          ...List.generate(
            2,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 8.w),
              child: CustomDeliveryOrderCard(
                orderId: '#25356',
                deliveryDate: 'Tomorrow',
                userName: 'Emir Yilmaz',
                phoneNumber: '01712 345 678',
                address: '2715 Ash Dr. San Jose, South Dakota 83475',
                onTap: () => context.pushNamed(AppRoute.orderDetailPage.name),
                onCallPressed: () {
                  // Handle call press
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
