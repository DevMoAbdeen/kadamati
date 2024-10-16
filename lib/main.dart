import 'package:flutter/material.dart';
import 'core/constants/app_themes.dart';
import 'core/routing/app_routes.dart';
import 'core/routing/router_list.dart';

void main() {
  runApp(const KadamatiApp());
}

class KadamatiApp extends StatelessWidget {
  const KadamatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kadamati",
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      initialRoute: RouterList.splashScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );


  }
}
