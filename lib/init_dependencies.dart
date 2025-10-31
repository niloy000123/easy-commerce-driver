import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_ecommerce_delivery_app/init_dependencies.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit()
Future<void> initDependencies() async {
  serviceLocator.init();
}
