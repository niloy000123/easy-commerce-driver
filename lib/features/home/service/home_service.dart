import 'package:injectable/injectable.dart';

abstract class HomeService {}

@LazySingleton(as: HomeService)
class HomeServiceImpl implements HomeService {}
