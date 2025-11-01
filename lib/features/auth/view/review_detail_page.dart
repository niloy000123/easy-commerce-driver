import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class ReviewDetailPage extends StatefulWidget {
  const ReviewDetailPage({super.key});

  @override
  State<ReviewDetailPage> createState() => _ReviewDetailPageState();
}

class _ReviewDetailPageState extends State<ReviewDetailPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController()
    ..text = 'driver1@gmail.com';
  final TextEditingController mobileController = TextEditingController()
    ..text = '01XXXXXXX';
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottom buttons
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(color: colors().borderColor),
            8.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AppButton(
                title: 'CONFIRM',
                onTap: () {
                  context.goNamed(AppRoute.home.name);
                },
              ),
            ),
            4.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AppButton(
                title: 'SKIP NOW',
                onTap: () {
                  context.goNamed(AppRoute.home.name);
                },
                titleColor: colors().primaryColor,
                buttonColor: colors().primaryColor!.withOpacity(.2),
              ),
            ),
            24.ph,
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Center(
                  child: Text(
                    'Review Details',
                    style: AppTextStyle(context).s32w400Headline.copyWith(
                      color: colors().textRegularColor,
                    ),
                  ),
                ),

                32.ph,

                // personal info
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PERSONAL INFO',
                        style: AppTextStyle(context).s14w500Label.copyWith(
                          color: AppStaticColor.slate500Color,
                        ),
                      ),
                      24.ph,
                      CustomFormWidget(
                        hint: 'Name',
                        label: 'Your Name',
                        controller: nameController,
                        readOnly: false,
                        validator: (val) => validatorWithMessage(
                          message: 'Name is required',
                          value: val,
                        ),
                      ),
                      8.ph,
                      CustomFormWidget(
                        hint: 'Mobile Number',
                        label: 'Mobile Number',
                        controller: mobileController,
                        readOnly: true,
                        validator: (val) => validatorWithMessage(
                          message: 'Mobile Number is required',
                          value: val,
                        ),
                      ),
                      8.ph,
                      Row(
                        children: [
                          Expanded(
                            child: CustomFormWidget(
                              hint: 'Gender',
                              label: 'Gender',
                              controller: genderController,
                              readOnly: true,
                              validator: (val) => validatorWithMessage(
                                message: 'Gender is required',
                                value: val,
                              ),
                            ),
                          ),
                          16.pw,
                          Expanded(
                            child: CustomFormWidget(
                              hint: 'Date of Birth',
                              label: 'Date of Birth',
                              controller: dobController,
                              readOnly: true,
                              validator: (val) => validatorWithMessage(
                                message: 'Date of Birth is required',
                                value: val,
                              ),
                            ),
                          ),
                        ],
                      ),
                      8.ph,
                      CustomFormWidget(
                        hint: 'Email',
                        label: 'Email',
                        controller: emailController,

                        validator: (val) => validatorWithMessage(
                          message: 'Email is required',
                          value: val,
                          isEmail: true,
                        ),
                      ),
                    ],
                  ),
                ),
                16.ph,
                // VEHICLE INFO
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VEHICLE INFO',
                        style: AppTextStyle(context).s14w500Label.copyWith(
                          color: AppStaticColor.slate500Color,
                        ),
                      ),
                      24.ph,

                      Row(
                        children: [
                          Expanded(
                            child: CustomFormWidget(
                              hint: 'By-Cycle',
                              label: 'Vehicle Type',
                              controller: vehicleController,

                              validator: (val) => validatorWithMessage(
                                message: 'Vehicle Type is required',
                                value: val,
                              ),
                            ),
                          ),
                          16.pw,
                          Expanded(
                            child: CustomFormWidget(
                              hint: 'Brand Name',
                              label: 'Brand Name',
                              controller: brandController,
                            ),
                          ),
                        ],
                      ),
                      8.ph,

                      CustomFormWidget(
                        hint: 'Color',
                        label: 'Color',
                        controller: brandController,

                        validator: (val) => validatorWithMessage(
                          message: 'Color is required',
                          value: val,
                        ),
                      ),
                    ],
                  ),
                ),
                8.ph,
                // image picker
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  width: double.infinity,
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: lightenColor(colors().borderColor!, .04),
                  ),
                  child: Column(
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
                      20.ph,
                      AppButton(
                        suffixIcon: Icon(
                          Icons.camera_alt_outlined,
                          color: colors().primaryColor,
                        ),
                        buttonColor: colors().scaffoldBackgroundColor,
                        title: 'Take Photo',
                        titleColor: colors().primaryColor,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
