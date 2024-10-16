import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../app_widgets/app_text.dart';
import '../constants/app_colors.dart';
import 'router_list.dart';

abstract class AppRouter {

  static List<String> getSupportedLanguages = ["en", "ar"];

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterList.splashScreen:
        return _buildRoute(settings, screen: const SplashScreen());

      default:
        return _errorRoute(settings.name ?? "null");
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings settings, {
    required Widget screen,
    Cubit? cubit,
    maintainState = true,
    fullscreenDialog = false,
    allowSnapshotting = true,
    barrierDismissible = false,
  }) {
    return MaterialPageRoute(
      builder: (_) => cubit != null
          ? BlocProvider(create: (context) => cubit, child: screen)
          : screen,
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
