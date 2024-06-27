import 'package:get_it/get_it.dart';
import 'navigation_service.dart';
import 'repositories/app_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator(AppRepository appRepository) {
  locator.registerLazySingleton(() => NavigationService(appRepository));
}
