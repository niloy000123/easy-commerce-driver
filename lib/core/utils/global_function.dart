import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/app_colors.dart';
import 'package:simple_ecommerce_delivery_app/core/theme/theme.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/context_less_nav.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/extensions.dart';

class ApGlobalFunctions {
  ApGlobalFunctions._();

  static void changeStatusBarColor({
    required Color color,
    Brightness? iconBrightness,
    Brightness? brightness,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color, //or set color with: Color(0xFF0000FF)
        statusBarIconBrightness:
            iconBrightness ?? Brightness.dark, // For Android (dark icons)
        statusBarBrightness: brightness ?? Brightness.light,
      ),
    );
  }

  static setEasyLoading({String? text}) {
    EasyLoading.show(
      status: text ?? 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );
  }

  static void showCustomSnackbar({
    required String message,
    required bool isSuccess,
    bool isTop = false,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      dismissDirection: isTop
          ? DismissDirection.startToEnd
          : DismissDirection.down,
      backgroundColor: isSuccess
          ? AppStaticColor.greenColor
          : AppStaticColor.redColor,
      content: Text(message),
      margin: isTop
          ? EdgeInsets.only(
              bottom:
                  MediaQuery.of(
                    navigatorKey.currentState!.context,
                  ).size.height -
                  160,
              right: 20,
              left: 20,
            )
          : null,
    );
    ScaffoldMessenger.of(
      navigatorKey.currentState!.context,
    ).showSnackBar(snackBar);
  }

  static getPickImageAlert({
    required BuildContext context,
    required VoidCallback pressCamera,
    required VoidCallback pressGallery,
  }) {
    showModalBottomSheet<void>(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      constraints: const BoxConstraints(maxWidth: 640),
      builder: (context) {
        return Container(
          color: Theme.of(context).colorScheme.surface,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: pressGallery,
                child: Container(
                  margin: EdgeInsets.only(bottom: 1.w),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: const ListTile(
                    leading: Icon(Icons.attach_file),
                    title: Text("uploadFromGallery"),
                  ),
                ),
              ),
              InkWell(
                onTap: pressCamera,
                child: Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: const ListTile(
                    leading: Icon(Icons.add_a_photo),
                    title: Text("takePhoto"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static showBottomSheet({
    required BuildContext context,
    required Widget widget,
    bool isDismissible = false,
  }) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      showDragHandle: isDismissible,
      isDismissible: isDismissible,
      enableDrag: isDismissible,

      elevation: 0,
      context: context,
      backgroundColor: colors(context).scaffoldBackgroundColor,
      // TODO: Remove when this is in the framework https://github.com/flutter/flutter/issues/118619
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        minHeight: 20,
      ),
      builder: (context) {
        return widget;
      },
    );
  }

  static Future<String> getPath() async {
    String directory;
    if (Platform.isIOS) {
      directory =
          (await getDownloadsDirectory())?.path ??
          (await getTemporaryDirectory()).path;
    } else {
      directory = '/storage/emulated/0/Download/';

      var dirDownloadExists = true;

      dirDownloadExists = await Directory(directory).exists();

      if (!dirDownloadExists) {
        directory = '/storage/emulated/0/Downloads/';

        dirDownloadExists = await Directory(directory).exists();

        if (!dirDownloadExists) {
          directory = (await getTemporaryDirectory()).path;
        }
      }
    }

    return directory;
  }

  static showSnacbarMethod({
    required BuildContext context,
    required String message,
    required bool isSuccess,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        content: Text(message),
      ),
    );
  }

  static appDialogDialog({
    required BuildContext context,
    required Widget title,
    Widget? leftButton,
    required Widget rightButton,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: context.color.surface,
        shadowColor: context.color.surface,
        backgroundColor: context.color.surface,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.w)),
        ),
        content: Container(
          width: MediaQuery.of(context).size.width - 30.h,
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              title,
              20.ph,
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    if (leftButton != null) Expanded(child: leftButton),
                    12.pw,
                    Expanded(child: rightButton),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static GlobalKey<ScaffoldMessengerState> getSnackbarKey() {
    final snackbarKey = GlobalKey<ScaffoldMessengerState>();
    return snackbarKey;
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
