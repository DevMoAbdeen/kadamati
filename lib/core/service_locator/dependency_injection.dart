import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../infrastructure/shared_preferences.dart';
import '../network/internet_connection.dart';

GetIt getIt = GetIt.instance;

// registerSingleton => create object when open app
// registerLazySingleton => create object when need it

Future<void> setupServiceLocator() async {

  /// External ///
  getIt.registerSingleton<SharedPrefController>(SharedPrefController());
  getIt.registerLazySingleton(() => InternetConnectionChecker());

  ///////////////////////////////////////////////////////////////////

  /// Core ///
  await getIt<SharedPrefController>().init();
  getIt.registerLazySingleton<InternetConnection>(() => InternetConnectionImp(getIt()));
  // getIt.registerLazySingleton(() => ApiController());

  ///////////////////////////////////////////////////////////////////

}