import 'package:flutter/material.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../../../../core/extensions/translation_extension.dart';
import '../../../../core/app_widgets/app_text.dart';
import '../../../../core/constants/translation_keys.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/routing/router_list.dart';
import '../../../../core/service_locator/dependency_injection.dart';
import '../../../../infrastructure/shared_preferences.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/indicator_widget.dart';
import '../widgets/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  clickForwardButton(BuildContext context) {
    if (_currentIndex == OnboardingController.onboardingList.length - 1) {
      finishPageView();
    } else {
      nextPage();
    }
  }

  beforePage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.slowMiddle,
    );
  }

  nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 1000),
      curve: _currentIndex == 0 ? Curves.easeInOutSine : Curves.easeInOutBack,
    );
  }

  finishPageView() async {
    getIt<SharedPrefController>().setData(Keys.isFirstTime, false);
    context.pushNamedAndRemoveAll(RouterList.loginScreen);
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: 0.widthSpace(),
          actions: [
            TextButton(
              onPressed: () {
                finishPageView();
              },
              child: AppText(
                text: TranslationKeys.skip.translateValue(),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                controller: _pageController,
                itemCount: OnboardingController.onboardingList.length,
                allowImplicitScrolling: true,
                itemBuilder: (BuildContext context, int index) {
                  return OnboardingWidget(onboardingModel: OnboardingController.onboardingList[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex > 0
                      ? IconButton(
                          iconSize: 30,
                          onPressed: () => beforePage(),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.ac_unit,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                  Row(
                    children: indicatorWidget(context, OnboardingController.onboardingList.length, _currentIndex),
                  ),
                  IconButton(
                    iconSize: 30,
                    onPressed: () => clickForwardButton(context),
                    color: Theme.of(context).primaryColor,
                    icon: Icon(
                      _currentIndex ==
                              OnboardingController.onboardingList.length - 1
                          ? Icons.check
                          : Icons.arrow_forward,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
