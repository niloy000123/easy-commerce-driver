import 'package:simple_ecommerce_delivery_app/features/home/service/home_service.dart';

import '../../../core/app_export.dart';

final homeCtrProvider = StateNotifierProvider<_HomeCtr, bool>(
  (ref) => _HomeCtr(
    ref,
    homeService: serviceLocator(),
    hiveService: serviceLocator(),
  ),
);

class _HomeCtr extends StateNotifier<bool> {
  final Ref ref;
  final HomeService homeService;
  final HiveService hiveService;
  _HomeCtr(this.ref, {required this.homeService, required this.hiveService})
    : super(false);
}
