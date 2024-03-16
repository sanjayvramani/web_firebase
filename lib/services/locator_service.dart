import 'package:get_it/get_it.dart';

import 'navigator_service.dart';

GetIt locator = GetIt.instance;


Future<void> setupLocator() async
{
  locator.registerLazySingleton<NavigatorService>(() => NavigatorService());
}