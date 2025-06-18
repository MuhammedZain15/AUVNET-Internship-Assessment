class OnboardingEntity {
  final String title;
  final String description;

  OnboardingEntity({required this.title, required this.description});
}
final List<OnboardingEntity> pages = [
  OnboardingEntity(
    title: "all-in-one delivery",
    description: "Order groceries, medicines, and meals delivered straight to your door",
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