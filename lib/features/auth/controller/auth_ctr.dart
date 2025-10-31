import 'package:flutter/material.dart';
import 'package:simple_ecommerce_delivery_app/features/auth/service/auth_service.dart';

import '../../../core/app_export.dart';

final authCtrProvider = StateNotifierProvider<_AuthCtr, bool>(
  (ref) => _AuthCtr(
    ref,
    authService: serviceLocator(),
    hiveService: serviceLocator(),
  ),
);

class _AuthCtr extends StateNotifier<bool> {
  final Ref ref;
  final AuthService authService;
  final HiveService hiveService;
  _AuthCtr(this.ref, {required this.authService, required this.hiveService})
    : super(false);

  Future<CommonResponse> logout() async {
    bool isSuccess = false;
    state = true;
    try {
      final response = await authService.logout(
        token: hiveService.getUserRefreshToken()!,
      );

      isSuccess = true;
      hiveService.removeUserAuthToken();
      showCustomSnackBar('Logout successfully');
      return CommonResponse(
        isSuccess: isSuccess,
        message: response.data['message'],
      );
    } on ServerException catch (e) {
      debugPrint(e.message.toString());
      showCustomSnackBar(e.message.toString(), isSuccess: false);
      return CommonResponse(isSuccess: isSuccess, message: e.toString());
    } finally {
      state = false;
    }
  }

  Future<CommonResponse> login({
    required String contact,
    required String password,
  }) async {
    bool isSuccess = false;
    state = true;
    try {
      final response = await authService.login(
        contact: contact,
        password: password,
      );

      if (response.statusCode == 200) {
        isSuccess = true;
      }
      return CommonResponse(
        isSuccess: isSuccess,
        message: response.data['message'],
      );
    } on ServerException catch (e) {
      debugPrint(e.message.toString());
      showSnackBarRegular(e.message.toString());
      return CommonResponse(isSuccess: isSuccess, message: e.toString());
    } finally {
      state = false;
    }
  }
}
