import 'package:simple_ecommerce_delivery_app/features/home/service/home_service.dart';

import '../../../core/app_export.dart';

final orderDetailCtrProvider = StateNotifierProvider<_OrderDetailCtr, bool>(
  (ref) => _OrderDetailCtr(
    ref,
    homeService: serviceLocator(),
    hiveService: serviceLocator(),
  ),
);

class _OrderDetailCtr extends StateNotifier<bool> {
  final Ref ref;
  final HomeService homeService;
  final HiveService hiveService;
  _OrderDetailCtr(
    this.ref, {
    required this.homeService,
    required this.hiveService,
  }) : super(false);
}
