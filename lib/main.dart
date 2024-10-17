import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/constants/app_themes.dart';
import 'core/routing/app_routes.dart';
import 'core/routing/router_list.dart';
import 'core/service_locator/dependency_injection.dart';
import 'infrastructure/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupServiceLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    EasyLocalization(
      supportedLocales: AppRouter.supportedLanguages.map((langCode) => Locale(langCode)).toList(),
      path: 'assets/translations',
      fallbackLocale: AppRouter.supportedLanguages.map((langCode) => Locale(langCode)).toList().first,
      child: const KadamatiApp(),
    ),
  );
}

class KadamatiApp extends StatelessWidget {
  const KadamatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    // String getDeviceLanguage() {
    //   Locale locale = window.locale;
    //   return locale.languageCode;
    // }
    //
    // context.setLocale(Locale("en"));
    // if (getIt<SharedPrefController>().getData(key: Keys.languageCode) == null) {
    //   if(AppRouter.supportedLanguages.contains(getDeviceLanguage())){
    //     getIt<SharedPrefController>().setData(Keys.languageCode, getDeviceLanguage());
    //     context.setLocale(Locale(getDeviceLanguage()));
    //   }else{
    //     // getIt<SharedPrefController>().setData(Keys.languageCode, LanguagesCodes.en.name);
    //     // context.setLocale(Locale(LanguagesCodes.en.name));
    //   }
    // }

    return MaterialApp(
      title: "Kadamati",
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      supportedLocales: AppRouter.supportedLanguages.map((e) => Locale(e)),
      locale: Locale("en"),
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      initialRoute: RouterList.splashScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
