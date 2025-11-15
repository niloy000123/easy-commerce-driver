import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/api_client.dart';

abstract class ProfileService {
  // Future<Response> getProfile();
  // Future<Response> updateProfile(dynamic data);
}

@LazySingleton(as: ProfileService)
class ProfileServiceImpl implements ProfileService {}
