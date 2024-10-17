import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/app_widgets/app_text.dart';
import '../../domain/entities/onboarding_model.dart';

class OnboardingWidget extends StatelessWidget {
  final OnboardingModel onboardingModel;

  const OnboardingWidget({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        8.heightSpace(),
        AppText(
          text: onboardingModel.name,
          fontSize: 24,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          maxLines: 1,
          horizontalPadding: 16,
        ),
        8.heightSpace(),
        SvgPicture.asset(
          onboardingModel.imagePath,
          height: MediaQuery.of(context).size.height / 2.25,
          width: MediaQuery.of(context).size.width,
        ),
        16.heightSpace(),
        AppText(
          text: onboardingModel.title,
          fontSize: 20,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          maxLines: 3,
          horizontalPadding: 16,
        ),
        8.heightSpace(),
        AppText(
          text: onboardingModel.description,
          fontSize: 18,
          color: Theme.of(context).textTheme.bodyLarge!.color!,
          textAlign: TextAlign.center,
          horizontalPadding: 20,
          maxLines: 10,
        ),
      ],
    );
  }
}
