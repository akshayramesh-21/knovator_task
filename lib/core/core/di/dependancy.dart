import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:knovator_test/core/core/di/dependancy.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  getIt.init(environment: Environment.prod);
}
