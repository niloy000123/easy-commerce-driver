import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_ecommerce_delivery_app/core/constants/app_constants.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/api_client.dart';

abstract class AuthService {
  Future<Response> login({required String contact, required String password});
  Future<Response> logout({required String token});
}

@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  @override
  Future<Response> login({
    required String contact,
    required String password,
  }) async {
    return await apiClient.dioRequest(() async {
      final response = await apiClient.post(
        AppConstants.LOGIN,
        data: {'email': contact, 'password': password},
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        apiClient.checkError(response.data);
      }
    });
  }

  @override
  Future<Response> logout({required String token}) async {
    return await apiClient.dioRequest(() async {
      final response = await apiClient.post(
        AppConstants.LOGOUT,
        data: {'refresh_token': token},
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        apiClient.checkError(response.data);
      }
    });
  }
}
