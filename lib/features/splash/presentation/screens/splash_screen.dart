import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/extensions/translation_extension.dart';
import '../../../../core/app_widgets/app_text.dart';
import '../../../../core/constants/translation_keys.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 2500), () {
      SplashController.navigateNextPage(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/logo.png",
            width: MediaQuery.of(context).size.width,
          ),
          AppText(
            text: TranslationKeys.appName.translateValue(),
            fontSize: 30,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
