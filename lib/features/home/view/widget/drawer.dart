import 'package:flutter/material.dart';
import 'package:simple_ecommerce_delivery_app/core/app_export.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colors().scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Row(
              children: [
                CustomImageView(
                  imagePath: Assets.images.appLogo.path,
                  width: 198.w,
                  height: 48.w,
                ),
                Spacer(),
                CustomImageView(
                  imagePath: Assets.icons.close.path,
                  width: 24.w,
                  height: 24.w,
                  onTap: () => Navigator.pop(context),
                ),
                16.pw,
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  width: 104.w,
                  height: 104.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(52.w),
                    child: CustomImageView(
                      imagePath: Assets.images.defaultUser.path,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
                16.ph,
                Text('Emir Yilmaz', style: AppTextStyle(context).s24w500),
                Text('View Profile', style: AppTextStyle(context).s14w400Body),
                12.ph,
                _buildMenuCard(
                  context,
                  backgroundIsActive: true,
                  title: 'My Job History',
                  icon: Assets.icons.order.path,
                  onTap: () => {},
                ),
                24.ph,
              ],
            ),
          ),
          Divider(color: colors().borderColor),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.ph,
                    Text(
                      'SETTINGS',
                      style: AppTextStyle(
                        context,
                      ).s12w500Label.copyWith(color: colors().textLightColor),
                    ),
                    12.ph,
                    _buildMenuCard(
                      context,

                      title: 'Change Password',
                      icon: Assets.icons.key.path,
                      onTap: () => {},
                    ),
                    8.ph,
                    _buildMenuCard(
                      context,

                      title: 'Language',
                      icon: Assets.icons.language.path,
                      onTap: () => {},
                    ),
                    8.ph,
                    _buildMenuCard(
                      context,

                      title: 'Theme',
                      icon: Assets.icons.lightTheme.path,
                      onTap: () => {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(color: colors().borderColor),
          12.ph,
          Row(
            children: [
              24.pw,
              Text(
                'Log Out',
                style: AppTextStyle(
                  context,
                ).s14w400Body.copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              CustomImageView(
                imagePath: Assets.icons.logout.path,
                width: 24.w,
                height: 24.w,
              ),
              24.pw,
            ],
          ),
          24.ph,
        ],
      ),
    );
  }

  _buildMenuCard(
    BuildContext context, {
    bool backgroundIsActive = false,
    required VoidCallback onTap,
    required String title,
    required String icon,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(color: lightenColor(colors().borderColor!, 0.05)),
          color: backgroundIsActive
              ? lightenColor(colors().borderColor!, 0.05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Row(
          children: [
            CustomImageView(imagePath: icon, width: 24.w, height: 24.w),
            8.pw,
            Text('My Job History', style: AppTextStyle(context).s14w400Body),
            Spacer(),
            CustomImageView(
              imagePath: Assets.icons.arrowRight.path,
              width: 16.w,
              height: 16.w,
            ),
          ],
        ),
      ),
    );
  }
}
