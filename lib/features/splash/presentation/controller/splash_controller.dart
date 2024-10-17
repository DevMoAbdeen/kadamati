import 'package:flutter/material.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../../../../core/routing/router_list.dart';
import '../../../../core/service_locator/dependency_injection.dart' as di;
import '../../../../infrastructure/shared_preferences.dart';

abstract class SplashController {
  static void navigateNextPage(BuildContext context) async {
    String nextPage = _nameNextPage();
    context.pushNamedAndRemoveAll(nextPage);
  }

  static String _nameNextPage() {
    return di.getIt<SharedPrefController>().getData(key: Keys.isFirstTime) == null ||
            di.getIt<SharedPrefController>().getData(key: Keys.isFirstTime) != false
        ? RouterList.onboardingScreen
        : di.getIt<SharedPrefController>().getData(key: Keys.isLogged) != null &&
                di.getIt<SharedPrefController>().getData(key: Keys.isLogged) == true &&
                !(di.getIt<SharedPrefController>().isTokenNull())
            ? RouterList.mainScreens
            : RouterList.loginScreen;
  }
}
