import 'package:flutter/material.dart';
import 'package:simple_ecommerce_delivery_app/core/constants/app_constants.dart';
import '../../app_export.dart';

class CustomFormWidget extends StatelessWidget {
  const CustomFormWidget({
    super.key,
    this.hint = '',
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.label,
    this.suffixIcon,
    this.prefix,
    this.maxLength,
    this.onChanged,
    this.focusNode,
    this.filled = false,
    this.readOnly = false,
    this.helperText = '',
    this.showCounter = false,
  });
  final String? hint;
  final String? label;
  final TextEditingController controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines, maxLength;
  final Widget? suffixIcon, prefix;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool filled;
  final String helperText;
  final bool showCounter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
        label: label != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label!,
                    style: TextStyle(
                      // color: AppStaticColor.labelColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  if (validator != null)
                    Text(
                      "*",
                      style: TextStyle(
                        color: AppStaticColor.redColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                ],
              )
            : null,
        hintText: hint,
        hintStyle: AppTextStyle(context).hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefix,
        filled: filled,
        helperText: helperText,
        helperStyle: AppTextStyle(
          context,
        ).s12w400Body.copyWith(color: AppStaticColor.slate500Color),

        counterStyle: AppTextStyle(
          context,
        ).s12w400Body.copyWith(color: AppStaticColor.slate500Color),
      ),
      buildCounter: showCounter
          ? (context, {required currentLength, required isFocused, maxLength}) {
              return Text(
                "$currentLength/$maxLength",
                style: AppTextStyle(
                  context,
                ).s12w400Body.copyWith(color: AppStaticColor.slate500Color),
              );
            }
          : null,
      style: TextStyle(fontSize: 16.sp),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}

validatorWithMessage({
  required String message,
  String? value,
  bool isEmail = false,
  bool isPhone = false,
}) {
  if (value == null || value.isEmpty) {
    return message;
  }
  if (isEmail &&
      !RegExp(AppConstants.kTextValidatorEmailRegex).hasMatch(value)) {
    return 'Has to be a valid email address.';
  }
  if (isPhone &&
      !RegExp(AppConstants.kTextValidatorPhoneNumberRegex).hasMatch(value)) {
    return 'Has to be a valid phone number.';
  }

  return null;
}
