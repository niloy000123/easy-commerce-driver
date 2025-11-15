import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:simple_ecommerce_delivery_app/features/profile_tab/controller/profile_ctr.dart';
import '../../../../core/app_export.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage(this.hiveService, {super.key});
  final HiveService hiveService;
  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
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

  Uint8List? _image;
  XFile? _xFileimage;

  void selectImage() async {
    ApGlobalFunctions.setEasyLoading();
    var img = await pickImage(ImageSource.gallery);
    _image = img?[0];
    _xFileimage = img?[1];
    var image = await compressImage(File(_xFileimage!.path));

    if (image != null) {
      // ref
      //     .read(profileCtrProvider.notifier)
      //     .updateProfilePicture(image: XFile(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileCtrProvider);
    return Scaffold(
      appBar: cAppBarWidget(title: 'Profile', context: context),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(color: colors().borderColor),
            24.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AppButton(
                title: 'UPDATE PROFILE',
                showLoading:
                    ref.watch(profileCtrProvider).buttonLoading ?? false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    // ref.read(profileCtrProvider.notifier).updateProfile({
                    //   'full_name': nameController.text,
                    //   'email': emailController.text,
                    //   'phone': numberController.text,
                    // });
                  }
                },
              ),
            ),
            24.ph,
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.ph,
              // personal info
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileIconAndEditButton(_image, context),
                    24.ph,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget profileIconAndEditButton(Uint8List? image, BuildContext context) {
    if (image != null) {
      return Stack(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 6.w),
            width: 96.w,
            height: 96.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48.w),
              border: Border.all(color: colors().borderColor!, width: 1),

              image: DecorationImage(
                image: MemoryImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => selectImage(),
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppStaticColor.whiteColor),
                  color: colors().primaryColor,
                ),
                child: CustomImageView(
                  icon: Icons.camera_alt_outlined,
                  color: AppStaticColor.whiteColor,
                  width: 24.w,
                  height: 24.w,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(right: 6.w),
          width: 96.w,
          height: 96.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48.w),
            image:
                widget.hiveService.getUserInfo()?.profilePicture != '' &&
                    widget.hiveService.getUserInfo()?.profilePicture != null
                ? DecorationImage(
                    image: NetworkImage(
                      '${widget.hiveService.getUserInfo()!.profilePicture}',
                    ),
                    fit: BoxFit.cover,
                  )
                : DecorationImage(
                    image: AssetImage(Assets.images.defaultUser.path),
                  ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => selectImage(),
            child: Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppStaticColor.whiteColor),
                color: colors().primaryColor,
              ),
              child: CustomImageView(
                icon: Icons.camera_alt_outlined,
                color: AppStaticColor.whiteColor,
                width: 24.w,
                height: 24.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
