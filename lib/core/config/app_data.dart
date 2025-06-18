import 'package:auvnet_internship_assessment/core/config/assets/app_images.dart';
import 'package:auvnet_internship_assessment/core/config/assets/app_vectors.dart';
import 'package:auvnet_internship_assessment/feature/onboarding/domain/entity/onboarding_entitiy.dart';

class AppData {
  // Onboarding Pages
  static final List<OnboardingEntity> onboardingPages = [
    OnboardingEntity(
      title: "all-in-one delivery",
      description:
          "Order groceries, medicines, and meals delivered straight to your door",
    ),
    OnboardingEntity(
      title: "User-to-User Delivery",
      description: "Send or receive items from other users quickly and easily",
    ),
    OnboardingEntity(
      title: "Sales & Discounts",
      description: "Send or receive items from other users quickly and easily",
    ),
  ];

  // Service Cards
  static final List<Map<String, String>> serviceCards = [
    {'image': AppImages.foodHomeImage, 'desc': 'Up to 50%', 'title': 'Food'},
    {
      'image': AppImages.healthHome,
      'desc': '20 mins',
      'title': 'Health &\nwellness',
    },
    {'image': AppImages.groceries, 'desc': '15 mins', 'title': 'Groceries'},
  ];

  // Popular Restaurants
  static final List<Map<String, String>> popularRestaurants = [
    {'image': AppImages.nearby1, 'text': 'Allo Beirut ', 'text2': '32 mins'},
    {'image': AppImages.nearby2, 'text': 'Laffah', 'text2': '38 mins'},
    {
      'image': AppImages.nearby3,
      'text': 'Falafil Al\nRabiah Al kha...',
      'text2': '44 mins',
    },
    {'image': AppImages.nearby4, 'text': 'Barbar', 'text2': '34 mins'},
  ];

  // Shortcuts
  static final List<Map<String, String>> shortcuts = [
    {'image': AppVectors.pastOrder, 'text': 'Past\norders'},
    {'image': AppVectors.superSaver, 'text': 'Super\nSaver'},
    {'image': AppVectors.mustTries, 'text': 'Must-tries'},
    {'image': AppVectors.giveBack, 'text': 'Give Back'},
    {'image': AppVectors.bestSellers, 'text': 'Best\nSellers'},
  ];

  // Home Slider Images
  static final List<String> homeSliderImages = [
    AppImages.homeSlider,
    AppImages.homeSlider,
    AppImages.homeSlider,
    AppImages.homeSlider,
    AppImages.homeSlider,
  ];
}
