// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class AppThemeBottomSheet extends StatefulWidget {
//   const AppThemeBottomSheet({super.key});
//   @override
//   State<AppThemeBottomSheet> createState() => _AppThemeBottomSheetState();
// }

// class _AppThemeBottomSheetState extends State<AppThemeBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       width: double.infinity,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.h),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             BottomSheetTitleAndCloseHeader(
//               onTap: () {
//                 context.nav.pop();
//               },
//               title: 'Theme',
//             ),
//             16.ph,
//             // _filterItem(context,
//             //     title: 'Auto',
//             //     image: Assets.icons.tickCircle.path,
//             //     icon: Assets.icons.autoTheme.path),
//             _filterItem(
//               context,
//               title: 'Light',
//               image: Assets.icons.lightTheme.path,

//               isSelected:
//                   Hive.box(
//                     AppHSC.appSettingsBox,
//                   ).get(AppHSC.isDarkTheme, defaultValue: false) ==
//                   false,

//               onTap: () {
//                 context.nav.pop();

//                 Hive.box(AppHSC.appSettingsBox).put(AppHSC.isDarkTheme, false);
//               },
//             ),
//             _filterItem(
//               context,
//               title: 'Dark',
//               image: Assets.icons.darkTheme.path,
//               isSelected:
//                   Hive.box(
//                     AppHSC.appSettingsBox,
//                   ).get(AppHSC.isDarkTheme, defaultValue: false) ==
//                   true,
//               onTap: () {
//                 context.nav.pop();
//                 Hive.box(AppHSC.appSettingsBox).put(AppHSC.isDarkTheme, true);
//               },
//             ),
//             24.ph,
//           ],
//         ),
//       ),
//     );
//   }

//   _filterItem(
//     BuildContext context, {
//     required String title,
//     String? image,
//     required bool isSelected,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.only(bottom: 8.w),
//         padding: EdgeInsets.all(16.w),
//         decoration: BoxDecoration(
//           border: Border.all(color: colors(context).borderColor!),
//           borderRadius: BorderRadius.circular(16.r),
//         ),
//         child: Row(
//           children: [
//             CustomImageView(width: 24.w, height: 24.w, imagePath: image),
//             12.pw,
//             Text(title, style: AppTextStyle(context).s16w400Body),
//             Spacer(),
//             if (isSelected)
//               CustomImageView(
//                 width: 24.w,
//                 height: 24.w,
//                 imagePath: Assets.icons.rightC.path,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
