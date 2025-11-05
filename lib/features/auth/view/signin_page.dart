import 'package:simple_ecommerce_delivery_app/features/auth/controller/auth_ctr.dart';

import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController()
    ..text = 'customer1@gmail.com';
  final TextEditingController passwordController = TextEditingController()
    ..text = '12345678';
  bool showPass = false;
  bool rememberMe = false;
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
            56.ph,
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: AppTextStyle(
                          context,
                        ).s16w400Body.copyWith(color: colors().textLightColor),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            24.ph,
                            CustomFormWidget(
                              hint: 'Email/Phone',
                              label: 'Email/Phone',
                              controller: idController,
                              validator: (val) => validatorWithMessage(
                                message: 'Email Or Phone is required',
                                value: val,
                              ),
                            ),
                            16.ph,
                            CustomFormWidget(
                              hint: 'Password',
                              label: 'Password',
                              controller: passwordController,
                              obscureText: !showPass,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showPass = !showPass;
                                  });
                                },
                                child: Icon(
                                  showPass
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              validator: (val) => validatorWithMessage(
                                message: 'Password is required',
                                value: val,
                              ),
                            ),
                            16.ph,
                            Row(
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        colors().hintTextColor,
                                  ),
                                  child: Checkbox(
                                    value: rememberMe,
                                    onChanged: (newValue) {
                                      setState(() {
                                        rememberMe = newValue!;
                                      });
                                    },
                                    activeColor: colors().primaryColor,
                                    checkColor:
                                        colors().scaffoldBackgroundColor,
                                  ),
                                ),
                                Text(
                                  'Remember Me',
                                  style: AppTextStyle(context).s14w400Body
                                      .copyWith(color: colors().textLightColor),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    context.nav.pop();
                                    context.pushNamed(
                                      AppRoute.forgotPassPage.name,
                                    );
                                  },
                                  child: Text(
                                    "Forget Password?",
                                    style: AppTextStyle(context).s14w400Body,
                                  ),
                                ),
                              ],
                            ),
                            16.ph,
                            Consumer(
                              builder: (context, ref, _) {
                                return AppButton(
                                  title: 'LOG IN',
                                  showLoading: ref.watch(authCtrProvider),
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      // var result = await ref
                                      //     .read(authCtrProvider.notifier)
                                      //     .login(
                                      //       contact: idController.text,
                                      //       password: passwordController.text,
                                      //     );
                                      // if (result.isSuccess) {
                                      //   context.nav.pop();
                                      //   showCustomSnackBar(
                                      //     'Login Successfully',
                                      //     context: context,
                                      //   );
                                      // }

                                      context.goNamed(
                                        AppRoute.reviewDetailPage.name,
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      16.ph,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
