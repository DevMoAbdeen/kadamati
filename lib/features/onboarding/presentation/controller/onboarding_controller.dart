import '../../../../core/extensions/translation_extension.dart';
import '../../../../core/constants/translation_keys.dart';
import '../../domain/entities/onboarding_model.dart';

class OnboardingController {
  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      name: TranslationKeys.exploreName.translateValue(),
      imagePath: "assets/images/ic_search.svg",
      title: TranslationKeys.exploreTitle.translateValue(),
      description: TranslationKeys.exploreDescription.translateValue(),
    ),
    OnboardingModel(
      name: TranslationKeys.postName.translateValue(),
      imagePath: "assets/images/ic_post_work.svg",
      title: TranslationKeys.postTitle.translateValue(),
      description: TranslationKeys.postDescription.translateValue(),
    ),
    OnboardingModel(
      name: TranslationKeys.shareName.translateValue(),
      imagePath: "assets/images/ic_share.svg",
      title: TranslationKeys.shareTitle.translateValue(),
      description: TranslationKeys.shareDescription.translateValue(),
    ),
    OnboardingModel(
      name: TranslationKeys.connectName.translateValue(),
      imagePath: "assets/images/ic_connect.svg",
      title: TranslationKeys.connectTitle.translateValue(),
      description: TranslationKeys.connectDescription.translateValue(),
    ),
    OnboardingModel(
      name: TranslationKeys.ratingsName.translateValue(),
      imagePath: "assets/images/ic_reviews.svg",
      title: TranslationKeys.ratingsTitle.translateValue(),
      description: TranslationKeys.ratingsDescription.translateValue(),
    ),
    // OnboardingModel(
    //   name: "Track Your Favorites",
    //   imagePath: "assets/images/favorites.svg",
    //   title: "Save Your Favorite Providers",
    //   description: "Keep track of the service providers you love by adding them to your favorites. Easily revisit their profiles whenever needed.",
    // ),
  ];
}
