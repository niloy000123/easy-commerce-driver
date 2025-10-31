import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:simple_ecommerce_delivery_app/core/constants/hive_contents.dart';
import 'package:simple_ecommerce_delivery_app/core/router/router.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/global_function.dart';

void addApiInterceptors(Dio dio) {
  dio.options.connectTimeout = const Duration(seconds: 20);
  dio.options.receiveTimeout = const Duration(seconds: 30);
  dio.options.headers['Accept'] = 'application/json';
  dio.options.headers['contentType'] = 'application/json';
  // logger
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );

  // respone handler
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
      onResponse: (response, handler) {
        // final message = response.data['message'];
        // print(message);
        switch (response.statusCode) {
          case 401:
            // Box authBox = Hive.box(AppHSC.authBox);
            // authBox.clear();
            // Box userBox = Hive.box(AppHSC.userBox);
            // userBox.clear();
            // ApGlobalFunctions.navigatorKey.currentState
            //     ?.pushNamedAndRemoveUntil(
            //         AppRoute.welcome.name, (route) => false);
            // ApGlobalFunctions.showCustomSnackbar(
            //   message: message,
            //   isSuccess: false,
            // );
            break;
          case 302:
          case 400:
          case 403:
          case 404:
            // ApGlobalFunctions.showCustomSnackbar(
            //   message: message,
            //   isSuccess: false,
            // );
            break;
          case 409:
          case 422:
          case 500:
            // ApGlobalFunctions.showCustomSnackbar(
            //   message: message,
            //   isSuccess: false,
            // );
            break;
          default:
            break;
        }
        handler.next(response);
      },
      onError: (error, handler) {
        if (error.response == null) {
          switch (error.type) {
            case DioExceptionType.connectionError:
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.badResponse:
            case DioExceptionType.sendTimeout:
            case DioExceptionType.receiveTimeout:
            case DioExceptionType.unknown:
              // ApGlobalFunctions.showCustomSnackbar(
              //   message: 'An unknown error occurred',
              //   isSuccess: false,
              // );
              break;
            default:
              break;
          }
        }

        if (error.response != null) {
          final message = error.response!.data['message'];

          final statusCode = error.response!.statusCode;
          switch (statusCode) {
            case 400:
            case 401:
              Box authBox = Hive.box(AppHSC.authBox);
              authBox.clear();
              Box userBox = Hive.box(AppHSC.userBox);
              userBox.clear();

              ApGlobalFunctions.navigatorKey.currentState?.context.goNamed(
                AppRoute.signIn.name,
              );
              ApGlobalFunctions.showCustomSnackbar(
                message: message,
                isSuccess: false,
              );
              break;
            case 403:
              // ApGlobalFunctions.showCustomSnackbar(
              //   message: message,
              //   isSuccess: false,
              // );
              break;
            case 404:
              EasyLoading.showError(message);
              break;
            default:
              // ApGlobalFunctions.showCustomSnackbar(
              //   message: 'unexpected error',
              //   isSuccess: false,
              // );
              break;
          }
        }
        handler.reject(error);
      },
    ),
  );
}
