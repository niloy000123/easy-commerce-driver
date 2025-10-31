import 'dart:async';

import 'package:flutter/material.dart';

import '../../app_export.dart';

SingleChildScrollView noItemFound({
  String text = 'No item found',
  double? size,
}) {
  return SingleChildScrollView(
    physics: const AlwaysScrollableScrollPhysics(),
    child: SizedBox(
      width: double.infinity,
      height: size ?? SizeConfig.screenHeight - 200,
      child: Center(
        child: CustomImageView(
          width: 222.w,
          imagePath: Assets.images.empty.path,
        ),
      ),
    ),
  );
}

arrowLeft({double? width, double? height, Function()? onTap}) {
  return InkResponse(
    onTap: onTap,
    child: CustomImageView(
      imagePath: Assets.icons.arrowLeft.path,
      width: width ?? 24.w,
      height: height ?? 24.w,
      color: colors(
        ApGlobalFunctions.navigatorKey.currentContext!,
      ).textRegularColor,
    ),
  );
}

Future<Widget?> loadingDialogTransparent(BuildContext context) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder:
        (
          BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation,
        ) {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(getPWidth(inputWidth: 5)),
              ),
              padding: const EdgeInsets.all(20),
              child: Image.asset(Assets.images.spinner.path),
            ),
          );
        },
  );
}

Widget buttonCenterLoading({var color = Colors.white}) {
  return Container(
    constraints: const BoxConstraints(minWidth: 50),
    child: Column(
      children: [
        SizedBox(
          width: getProportionateScreenHeight(18),
          height: getPWidth(inputWidth: 18),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    ),
  );
}
