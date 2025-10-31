import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_ecommerce_delivery_app/core/common/model/user_model.dart';
import 'package:simple_ecommerce_delivery_app/core/constants/hive_contents.dart';

abstract interface class HiveService {
  Future saveUserAuthTokens({
    required String token,
    required String refreshToken,
  });
  String? getUserAuthToken();
  String? getUserRefreshToken();
  Future removeUserAuthToken();
  Future saveUserInfo(UserModel user);
  bool isFirstOpen();
  bool isLogin();
  firstOpenDone();
  UserModel? getUserInfo();
}

@LazySingleton(as: HiveService)
class HiveServiceImpl implements HiveService {
  final authBox = Hive.box(AppHSC.authBox);
  final userBox = Hive.box(AppHSC.userBox);
  @override
  String? getUserAuthToken() {
    final authToken = authBox.get(AppHSC.authToken);
    if (authToken != null) {
      return authToken;
    }
    return null;
  }

  @override
  String? getUserRefreshToken() {
    final authToken = authBox.get(AppHSC.refreshToken);
    if (authToken != null) {
      return authToken;
    }
    return null;
  }

  @override
  Future removeUserAuthToken() async {
    authBox.delete(AppHSC.authToken);
    userBox.clear();
  }

  @override
  Future saveUserInfo(UserModel user) async {
    userBox.put(AppHSC.userInfo, jsonEncode(user.toJson()));
  }

  @override
  UserModel? getUserInfo() {
    var userRowData = userBox.get(AppHSC.userInfo);
    Map<dynamic, dynamic>? userInfo = userRowData != null
        ? jsonDecode(userRowData)
        : null;
    if (userInfo != null) {
      Map<String, dynamic> userInfoStringKeys = userInfo.map(
        (key, value) => MapEntry(key.toString(), value),
      );
      UserModel user = UserModel.fromJson(userInfoStringKeys);

      return user;
    } else {
      return null;
    }
  }

  @override
  Future saveUserAuthTokens({
    required String token,
    required String refreshToken,
  }) async {
    authBox.put(AppHSC.authToken, token);
    authBox.put(AppHSC.refreshToken, refreshToken);
  }

  @override
  bool isFirstOpen() {
    return authBox.get(AppHSC.firstOpen, defaultValue: true);
  }

  @override
  firstOpenDone() {
    authBox.put(AppHSC.firstOpen, false);
  }

  @override
  bool isLogin() {
    final authToken = authBox.get(AppHSC.authToken);
    if (authToken != null) {
      return true;
    }
    return false;
  }
}
