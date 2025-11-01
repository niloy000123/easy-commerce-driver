import 'package:injectable/injectable.dart';

abstract class OrderDetailCtrService {}

@LazySingleton(as: OrderDetailCtrService)
class OrderDetailServiceImpl implements OrderDetailCtrService {}
