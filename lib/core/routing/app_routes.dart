import 'package:flutter/material.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../app_widgets/app_text.dart';
import '../constants/app_colors.dart';
import 'router_list.dart';

abstract class AppRouter {

  static List<String> supportedLanguages = ["en", "ar"];

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterList.splashScreen:
        return _buildRoute(settings, builder: const SplashScreen());

      case RouterList.onboardingScreen:
        return _buildRoute(settings, builder: const OnboardingScreen());

      default:
        return _errorRoute(settings.name ?? "null");
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings settings, {
    required Widget builder,
    maintainState = true,
    fullscreenDialog = false,
    allowSnapshotting = true,
    barrierDismissible = false,
  }) {
    return MaterialPageRoute(
      builder: (context) => builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      allowSnapshotting: allowSnapshotting,
      barrierDismissible: barrierDismissible,
    );
  }

static Route _errorRoute(String routeName) {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppText(text: "Page not found", fontSize: 18, color: Colors.white),
        backgroundColor: AppColors.mainColorLight,
      ),
      body: Center(
        child: AppText(
          text: "No route in app defined for: $routeName",
          fontSize: 16,
          textAlign: TextAlign.center,
          maxLines: 3,
          horizontalPadding: 16,
        ),
      ),
    );
  });
}
}
