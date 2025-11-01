import 'package:flutter/material.dart';
import '../core/app_export.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key, required this.hiveService});
  final HiveService hiveService;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                Assets.images.appLogo.path,
                width: 198.w,
                height: 48.w,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 276.w,
                    height: 406.h,
                    child: CustomImageView(
                      imagePath: Assets.images.welcomeIm.path,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Text(
                    'Welcome to FreeCom Rider App',
                    style: AppTextStyle(context).bigTitle,
                    textAlign: TextAlign.center,
                  ),
                  12.ph,
                  Text(
                    'Manage your deliveries, update order status, and get your jobs done faster.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle(context).s16w400Body.copyWith(
                      color: colors().textLightColor,
                    ),
                  ),
                  32.ph,
                  AppButton(
                    title: 'GET STARTED',
                    onTap: () {
                      hiveService.firstOpenDone();
                      context.goNamed(AppRoute.signIn.name);
                    },
                    showLoading: false,
                  ),
                  16.ph,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
